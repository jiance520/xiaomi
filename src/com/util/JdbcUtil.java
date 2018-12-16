package com.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
//import oracle.jdbc.OracleTypes;
import org.apache.log4j.Logger;
import java.sql.SQLException;
/**
* @version ʱ�䣺2018��5��10�� ����10:05:42
* ���е������Ժͷ������Ǿ�̬�����Ժͷ���,�������ʼ������Ĭ��ʹ��Oracle�е�mytable�û��е�orcl
*/
public class JdbcUtil {//�����࣬��Բ�ͬ�����ݿ⣬ʹ��ͬ����jdbc������
   private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());
   private static String driver = "oracle.jdbc.driver.OracleDriver";//
   private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
   private static String user = "xiaomi";
   private static String password = "xiaomi";
   private static Connection conn = null;
   private static PreparedStatement pst = null;
   private static ResultSet rst = null;
   private static CallableStatement cst = null;
// MySQL���ݿ��root�û���xsh���ݿ�
//        private static String driver = "com.mysql.jdbc.Driver";//ǰ�����пո�
//        private static String url = "jdbc:mysql://localhost:3306/xsh";
//        private static String user= "root";
//        private static String password= "root";
// static {//�Ѿ��������м���
//    try {
//       Class.forName(driver);
//    } catch (ClassNotFoundException e) {
//       System.out.println("������������");
//       e.printStackTrace();
//    }
// }
   public JdbcUtil() {
      super();
   }
// ʹ�ù��췽����ʼ��������,�����ǷǾ�̬����
    public JdbcUtil(String driver,String url ,String user,String password) {
        this.driver = driver;
        this.url = url;
        this.user = user;
        this.password = password;
      logger.debug("����һ����JdbcUtil");
    }
   // �õ����ӣ����е����������ж����������ӡ�
   public static Connection getConn(){
      if(conn == null){
         try {
            logger.debug("��ʼִ��");
            Class cc = Class.forName(driver);
            logger.debug("���������ɹ�");
            conn = DriverManager.getConnection(url,user,password);
            logger.debug("���ӳɹ�");
         } catch (Exception e) {
            logger.debug("����ʧ��");
            e.printStackTrace();
         }
      }
      return conn;
   }
     /**
     * insert update delete SQL����ִ�е�ͳһ����
     * @param sql SQL���
     * @param params ռλ��?�������飬��û�в�����Ϊnull
     * @return ��Ӱ�������
     */
   public static int executeUpdate(String sql,Object... params){//String...��Object[]�����㣬ֱ�Ӵ����������
      conn = getConn();
      int affectedLine = 0;// ��Ӱ�������
      try {
         logger.debug("��ʼ����");
         pst = conn.prepareStatement(sql);
         if(params!=null){
            for (int i = 0; i < params.length; i++) {
               pst.setObject(i+1,params[i]);
               logger.debug(params[i]);
            }
         }
   /*�ڴ� PreparedStatement ������ִ�� SQL ��䣬
            ����������һ�� SQL ���ݲ������ԣ�Data Manipulation Language��DML����䣬
            ���� INSERT��UPDATE �� DELETE��䣻�������޷������ݵ� SQL ��䣬���� DDL ��䡣    */
         affectedLine = pst.executeUpdate();
         logger.debug("���³ɹ���"+affectedLine+"����Ӱ��");
      } catch (SQLException e) {
         logger.debug("���´���");
         e.printStackTrace();
      }
      finally{
         closeAll();
      }
      return affectedLine;
   }
   /**
     * SQL ��ѯָ���к��еĽ��  ,һ�е��У���һ�ж��С�
     * @param sql SQL���
     * @param params �������飬��û�в�����Ϊnull
     * @return �����
     */
   public static HashMap<String,Object> queryOne(String sql,Object... params){
      HashMap<String,Object> map = null;
      ResultSetMetaData rsmd = null;
      int columnCount = 0;
      conn = getConn();
      try {
         logger.debug("��ʼ��ѯһ�����");
         pst = conn.prepareStatement(sql);
         if(params!=null){
            for (int i = 0; i < params.length; i++) {
               pst.setObject(i+1, params[i]);
            }
         }
         rst = pst.executeQuery();
         rsmd = rst.getMetaData();
         columnCount = rsmd.getColumnCount();
         if(rst.next()){
            map = new HashMap<String,Object>();
            for (int i = 0; i < columnCount; i++) {
               map.put(rsmd.getColumnLabel(i+1), rst.getObject(i+1));
            }
         }
         logger.debug("��ѯһ������ɹ�");
      } catch (Exception e) {
         logger.debug("��ѯһ�����ʧ��");
         e.printStackTrace();
      }
      finally{
         closeAll();
      }
      return map;
   }
   /**
     * SQL ��ѯ����ѯ���ֱ�ӷ���ResultSet��
     * @param sql SQL���
     * @param params �������飬��û�в�����Ϊnull
     * @return �����
     */
   public static ResultSet executeQueryRS(String sql,Object... params){
      conn = getConn();
      try {
         logger.debug("��ʼ��ѯ�����");
         pst = conn.prepareStatement(sql);
         if(params!=null){
            for (int i = 0; i < params.length; i++) {
               pst.setObject(i+1,params[i]);
            }
         }
         rst = pst.executeQuery();
         logger.debug("��ѯ������ɹ�");
      } catch (SQLException e) {
         logger.debug("��ѯ�����ʧ��");
         e.printStackTrace();
      }
      return rst;//���ܹر���Դ�����򷵻ص�rst��null
   }
    /**
     * ��ȡ������������������List�� (�ص�)���ﵽ������jsp�м�ӻ�ȡ��ResultSet�ļ�(������)��
     * @param sql  SQL���
     * params  ������û����Ϊnull
     * @return List �����
     */
// MetaDataԪ����
// ResultSetMetaData�洢�� ResultSet��MetaData��
// ��ѯ�������еĲ�����Ϊ�յ��ֶΣ�
//List list = exectueQuery("select column_name from user_tab_columns where table_name = 'PRODUCT' and nullable = 'Y'");
// exectueQuery("select * from emp where id=?","12");
   public static List<HashMap> exectueQuery(String sql,Object... params){
      rst = executeQueryRS(sql,params);
      ResultSetMetaData rsmd = null;
//    ��ȡ������
      int columnCount = 0;
      try {
         logger.debug("��ʼ��ѯList����");
         rsmd = rst.getMetaData();//��ȡ�й�ResultSet��������ݵ���Ϣ�����������ֶ������ֶ����������ǻ�ȡ�������ݡ�
//       ͨ��ResultSet��Ԫ���ݣ���ý��������
         columnCount = rsmd.getColumnCount();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      List<HashMap> list = new ArrayList<HashMap>();//�ɸ���������ı䷺��<Object>
      try {
         //��ResultSet�Ľ�����浽List��
         while(rst.next()){
            HashMap<String,Object> map = new HashMap<String,Object>();
            for (int i = 0; i < columnCount; i++) {
               map.put(rsmd.getColumnLabel(i+1), rst.getObject(i+1));//rsmd.getColumnLabel(i),ͨ��Ԫ���ݻ�ȡ����Ψһ�Ե��ֶ�����rs.getObject(i)ÿһ���ֶ�����Ӧһ���ֶε�ֵ��
//             ��getColumnLabel������������ں������¶�����ֶ��������û�ж������Ĭ���ֶ����������Ǵ�д�ַ�����
            }
            list.add(map);//ÿһ��map����һ�м�¼�������еļ�¼����list�С�
         }
         logger.debug("��ѯList�ɹ�");
      } catch (SQLException e) {
         logger.debug("��ѯListʧ��");
         e.printStackTrace();
      }
      finally{
         closeAll();
      }
      return list;
   }
    /**
     * �洢���̴���һ����������ķ��� ,out�������ڹ��̵����һ����
     * @param sql �洢�������
     * @param params ��������
     * @param outParamPos �������λ��
     * @param sqlType �����������   ���е�����������Ͷ���int!!??�����α�
     * @return ���������ֵ
     * Object obj = queryProcedure("{call com.queryUser(?,?)}", 2, OracleTypes.CURSOR, "www.hao123.com");
     */
   public static HashMap<String,Object> queryProcedure(String sql,int outParamPos,int sqlType,Object... params){
      HashMap<String,Object> map = null;
      ResultSetMetaData rsmd = null;
      int columnCount = 0;
      conn = getConn();
      try {
         logger.debug("��ʼ���ù���");
         cst = conn.prepareCall(sql);//sql="{call procedurename(?,?...)}";
         if(params!=null){
            for (int i = 0; i < params.length; i++) {
               cst.setObject(i+1, params[i]);
            }
         }
         cst.registerOutParameter(outParamPos, sqlType);
//       �ڲ�ѯ֮ǰע�ᣬ����Ҫ��ѯ�Ľ����������ʹ���޷���ֵ��execute()���������������callableStatement�����С�
         cst.execute();
         rst = (ResultSet)cst.getObject(outParamPos);//object����תResultSet��������ResultSetǰ���ܹرա�
         rsmd = rst.getMetaData();
         columnCount = rsmd.getColumnCount();
         if(rst.next()){
            map = new HashMap<String,Object>();
            for (int i = 0; i < columnCount; i++) {
               map.put(rsmd.getColumnLabel(i+1), rst.getObject(i+1));
            }
         }
         logger.debug("���ù��̳ɹ�");
      } catch (SQLException e) {
         logger.debug("���ù���ʧ��");
         e.printStackTrace();
      }
      finally{
         closeAll();
      }
      return map;
   }
// ���ô����ķ���,ע��forѭ���ܿ���һ��?,cst.setObject(i+2, params[i]);�����i+2��ʼ��
// �����ķ���ֵֻ��һ����������̿��Է����α꣬���Ժ������ص�ֻ����һ��Object.
   public static Object queryFunction(String sql,int outParamPos,int sqlType,Object... params){
      Object obj = null;
      int columnCount = 0;
      conn = getConn();
      try {
         logger.debug("��ʼ���ú���");
         cst = conn.prepareCall(sql);//sql="{?=call functionname(?,?...)}";
         if(params!=null){
            for (int i = 0; i < params.length; i++) {
               cst.setObject(i+2, params[i]);
            }
         }
         cst.registerOutParameter(outParamPos, sqlType);
//       �ڲ�ѯ֮ǰע�ᣬ����Ҫ��ѯ�Ľ����������ʹ���޷���ֵ��execute()���������������callableStatement�����С�
         cst.execute();
         obj = cst.getObject(outParamPos);//object����תResultSet��������ResultSetǰ���ܹرա�
         logger.debug("���ú����ɹ�");
      } catch (SQLException e) {
         logger.debug("���ú���ʧ��");
         e.printStackTrace();
      }
      finally{
         closeAll();
      }
      return obj;
   }
//  ��ѯ������Ϊ�յ��ֶΣ��봫�������PRODUCT��
   public static List<HashMap> nullList(String tablename){
      String sql = "select column_name from user_tab_columns where table_name = '"+tablename+"' and nullable = 'Y'";
      List<HashMap> maplist = exectueQuery(sql);
      List nullList = new ArrayList();
      for(int i =0;i<maplist.size();i++){
         maplist.get(i).get("COLUMN_NAME");
         nullList.add(maplist.get(i).get("COLUMN_NAME").toString().toLowerCase());
      }
      System.out.println("-----nullList:"+nullList);
      return null;
   }
   // ֻ�ر�����
   public static void closeConn(){
      if(conn != null){
         try {
            conn.close();
            conn = null;
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
   }
// �ر�ȫ��
   public static void closeAll(){
      if(conn!=null){
         try {
            conn.close();
            conn = null;
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      if(pst!=null){
         try {
            pst.close();
            pst = null;
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      if(rst!=null){
         try {
            rst.close();
            rst = null;
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      if(cst!=null){
         try {
            cst.close();
            cst = null;
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      logger.debug("ȫ���رճɹ�");
   }
   public static void main(String[] args) {
      nullList("PRODUCT");
//    OracleTypes,���������ݹ涨�������͡�
   }
}
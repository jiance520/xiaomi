package com.action;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.util.JdbcUtil;

public class ImageAction extends HttpServlet {
	private static Logger logger = Logger.getLogger(JdbcUtil.class.getName());

	/**
	 * Constructor of the object.
	 */
	public ImageAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		*/
		String StrFont=this.randstr();
		//��session��ֵ
		HttpSession ses=request.getSession();
        ses.setAttribute("rand",StrFont);
        
        String fontName="����";
        int fontSize=18;
        int width=70;
        int height=25;
        Font font=new Font(fontName,Font.BOLD,fontSize);
        BufferedImage StrImage=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d=(Graphics2D)StrImage.getGraphics();
        //���ñ���ɫ
        g2d.setBackground(getRandColor(100,200));
        //��䱳��
        g2d.clearRect(0,0,width,height);
        //��������ɫ
        g2d.setFont(font);
        g2d.setColor(Color.BLACK);
        /*
                      д������ַ���
        StrFont - Ҫ���ֵ� String
        x - ���� String λ�õ� x ����
        y - ���� String λ�õ� y ���� 
		*/
        g2d.drawString(StrFont,5,20);
        //�ͷŴ�ͼ�ε��������Լ���ʹ�õ�����ϵͳ��Դ
        g2d.dispose();
        
        response.setHeader("pragma", "no-cache");  
        response.setHeader("cache-control", "no-cache");  
        response.setDateHeader("expires", 0);  
        response.setContentType("image/jpeg");
        
        ServletOutputStream os = response.getOutputStream();
        //д�������
        ImageIO.write(StrImage,"jpg",os);
        //ˢ�������
        os.flush();
        //�ر������
        os.close();
        
        //System.out.println("------code------------"+StrFont);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
	
	//ȡ������ַ���
	protected String randstr(){
        String str="";
        String charstr="23456789ABDEFIJLQRTYabdefghijqrty";
        char[] arrchar=charstr.toCharArray();
        int length=arrchar.length;
        length=length-1;
        Random rd=new Random();
        char ct;
        int it;
        for(int i=0;i<6;i++)
        {
            it=rd.nextInt(length);
            ct=arrchar[it];
            str=str+String.valueOf(ct);
        }
        return str;
    }
	
	//��������ɫ
	protected Color getRandColor(int fc,int bc){
                Random random = new Random();
                if(fc>255) fc=255;
                if(bc>255) bc=255;
                int r=fc+random.nextInt(bc-fc);
                int g=fc+random.nextInt(bc-fc);
                int b=fc+random.nextInt(bc-fc);
                return new Color(r,g,b);
    }
}

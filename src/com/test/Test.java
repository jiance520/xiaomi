package com.test;

import java.util.Scanner;

/**
 * @version ʱ�䣺2018��6��12�� ����3:20:27
 *
 */
//class Test2(){}
public class Test implements Cloneable {
//	deep clone��ǳ��¡����ֻ��¡��ջ�ڴ棬���ڴ�û�п�¡��
//	protected Object clone1() throws CloneNotSupportedException {
//        return super.clone();
//    }
//	deep clone(��ȿ�¡)������¡�˶��ڴ档
//	protected Object clone2() throws CloneNotSupportedException {
//		return super.clone();
//    }
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("������һ������");
		int num = scanner.nextInt();
		System.out.println(num);
	}
}

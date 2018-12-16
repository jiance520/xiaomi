package com.test;

import java.util.Scanner;

/**
 * @version 时间：2018年6月12日 下午3:20:27
 *
 */
//class Test2(){}
public class Test implements Cloneable {
//	deep clone（浅克隆）：只克隆了栈内存，堆内存没有克隆。
//	protected Object clone1() throws CloneNotSupportedException {
//        return super.clone();
//    }
//	deep clone(深度克隆)：即克隆了堆内存。
//	protected Object clone2() throws CloneNotSupportedException {
//		return super.clone();
//    }
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("请输入一个数：");
		int num = scanner.nextInt();
		System.out.println(num);
	}
}

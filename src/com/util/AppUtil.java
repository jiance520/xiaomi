package com.util;


import java.io.*;
import java.util.*;
import com.sun.mail.imap.protocol.*;

public class AppUtil {
	//���ļ���
	public static String encode(String s){
		String is = "";
		StringWriter   sw  = new StringWriter();
		BASE64MailboxEncoder  be = new BASE64MailboxEncoder(sw);
		
		is = be.encode(s);
		return is;
	}	
	//���Ľ���
	public static String decode(String s){
		String is = "";
		BASE64MailboxDecoder bd = new BASE64MailboxDecoder();
		
		is = bd.decode(s);
		return is;
	}	
	public static void main(String[] args) {
		String s = "����1";
		String s1 = encode(s);
		String s2 = decode(s1);
		System.out.println("s1 = "+s1);
		System.out.println("s2 = "+s2);
		
	}
}

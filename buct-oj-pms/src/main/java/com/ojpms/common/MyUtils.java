package com.ojpms.common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
public class MyUtils {
	/*
	 * 写文件
	 */
	public static void writeFile(File file,String data){
		try {
			FileWriter fw = new FileWriter(file);
			BufferedWriter bw=new BufferedWriter(fw);
			bw.write(data);
			bw.close();
			fw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	/*
	 * 读文件
	 * 返回字符串形式
	 */
	public static String readFileToStr(File file) throws IOException{
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		StringBuffer sb = new StringBuffer();
		String str = null;
		while((str = br.readLine()) != null){
			sb.append(str).append("\n");
		}
		br.close();
		fr.close();
		return sb.toString();
	}	
	/*
	 * 读文件
	 * 返回List形式
	 */
	public static List<String> readFileToArray(File file) throws IOException{
		FileReader fr = new FileReader(file);
		BufferedReader br = new BufferedReader(fr);
		List<String> arr = new LinkedList<String>();
		String str = null;
		while((str = br.readLine()) != null){
			arr.add(str);
		}
		br.close();
		fr.close();
		return arr;
	}	
	
	public static String decoder(String str){
		try {
			return URLDecoder.decode(str,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	public static String encoder(String str){
		try {
			return URLEncoder.encode(str,"utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	public static Map<Integer, Boolean> string2Map(String str){
		str = str.substring(str.indexOf('{')+1,str.indexOf('}'));
		Map<Integer, Boolean> res = new HashMap<Integer, Boolean>();
		String []arr = str.split(",");
		for (String s : arr) {
			String []a = s.split("=");
			res.put(Integer.valueOf(a[0].trim()), a[1].trim().equals("true")?true:false);
		}
		return res;
	}
	public static String converseDate(long dateSrc){
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date dateDest = new Date(dateSrc);
		return simpleDateFormat.format(dateDest); 
	}
}

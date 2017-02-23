package com.football.db;

import java.sql.Connection;
import java.sql.DriverManager;

//반복되는 JDBC 구문 처리
public class DBUtil {
	private static Connection conn = null;
	
	public static Connection open(){
		String url = "jdbc:oracle:thin:@211.63.89.33:1521:xe";
		String id = "young";
		String pw = "young1234";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,id,pw);
		} catch (Exception e) {
			System.out.println("DBUtil : "+ e.toString());
		}
		
		return conn;//다른곳에서 항상 사용할수 있게 리턴해줌
	}
	public static Connection open(String server, String id, String pw){
		String url = "jdbc:oracle:thin:@"+ server +":1521:xe";
				
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,id,pw);
		} catch (Exception e) {
			System.out.println("DBUtil : "+ e.toString());
		}
		
		return conn;//다른곳에서 항상 사용할수 있게 리턴해줌
	}
	
	public static void close(){
		try {
			if(conn != null && !conn.isClosed()){//conn객체가 있는데 안닫혀있다면
				conn.close();
			}	
		} catch (Exception e) {
			System.out.println("DBUtil : "+ e.toString());
		}
	}
}

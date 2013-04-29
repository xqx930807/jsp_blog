package org.aurora.blog.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Driver;

/*
 * 提供一个工厂方法，返回数据库连接对象
 * dao
 * 用于处理对象的值
 */
public class Conn {
	
	public static Connection getConnection() throws SQLException {
		
		DriverManager.registerDriver(new Driver());
		
		String url = "jdbc:mysql://localhost:3306/blog";
		String user = "root";
		String password = "root";
		Connection conn = DriverManager.getConnection(url, user, password);
		
		return conn;
	}

	/*
	public static void main(String[] args) throws SQLException {
		Conn.getConnection();
	}
	*/
	
}
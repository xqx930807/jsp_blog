package org.aurora.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.aurora.blog.dto.Pub;

public class PubDao {
	
	//增加公告
	public void addPub(Pub pub) throws SQLException{
		Connection conn = Conn.getConnection();
		String sql = "insert into  pub (title,cons,date_pub) values (?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pub.getTitle());
		pstmt.setString(2, pub.getCons());
		pstmt.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
}

package org.aurora.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.aurora.blog.dto.Article;
import org.aurora.blog.dto.Friend;
import org.aurora.blog.dto.Pub;


//返回查询到的所有好友
public class FriendDao {
	public ArrayList<Friend> queryFri() {
		ArrayList<Friend> list = new ArrayList<Friend>();
		Connection conn = null;
		try {
			conn = Conn.getConnection();
			String sql = "select * from friends order by id desc ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Friend friend = new Friend(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
				list.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}//获取连接
		
		return list;
		}
	

	
}

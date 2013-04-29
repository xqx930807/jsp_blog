package org.aurora.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.aurora.blog.dto.Article;
import org.aurora.blog.dto.User;

public class UserDao {
	
	public void addUser(User user) throws SQLException{
			Connection conn = Conn.getConnection();
			String sql = "insert into  user(username,name,password,birthdate,email,city) values (?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2,user.getName());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4,user.getBirthdate());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getCity());
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		}
	
	
	//根据会员名查询
	public User queryUser_Name(String name) throws SQLException{
		User user = null;
		
		Connection conn = Conn.getConnection();
		String sql = "select * from user where username='"+name+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			user = new User(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return user;
	}
	
	//根据ID号查询
	public User queryUser_Id(int id) throws SQLException{
		User user = null;
		
		Connection conn = Conn.getConnection();
		String sql = "select * from user where id='"+id+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			user = new User(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return user;
	}
	
	public ArrayList<User> browseUser() throws SQLException{
		ArrayList<User> list = new ArrayList<User>(); 
		
		User user = null;
		
		Connection conn = Conn.getConnection();
		String sql = "select * from user ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			user = new User(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
			list.add(user);
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	//修改个人信息
	public void update(User user) throws SQLException{
		Connection conn = Conn.getConnection();
		String sql = "update user set username = '"+user.getUsername()+"',name = '"+user.getName()+"',password = '"+user.getPassword()+"', birthdate = '"+user.getBirthdate()+"',email = '"+user.getEmail()+"' where id = '"+user.getId()+"' ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.executeUpdate(sql);
		
		pstmt.close();
		conn.close();
	}

	public static void main(String[] args) throws SQLException {
		
		User user = new User("test7","test7","test7","2012-1-1","test7@163.com","北京");
		UserDao userdao = new UserDao();
		userdao.update(user);
			
		/*
		User user = null;
		UserDao userdao = new UserDao();
		user = userdao.queryUser_Name("test1");
		System.out.println(user.getBirthdate());
		*/
	}

}

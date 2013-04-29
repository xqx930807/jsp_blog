package org.aurora.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.aurora.blog.dao.Conn;
import org.aurora.blog.dto.Article;

public class ArticleDao {
	
	public void addArticle(Article article) throws SQLException{
		Connection conn = Conn.getConnection();
		String sql = "INSERT INTO  article (username,date_time,title,cons) values (?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, article.getUsername());
		pstmt.setTimestamp(2,new Timestamp(System.currentTimeMillis()));
		pstmt.setString(3, article.getTitle());
		pstmt.setString(4,article.getCons());
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}

	public ArrayList<Article> query_art_all() {
		ArrayList<Article> list = new ArrayList<Article>();
		Connection conn;
		try {
			conn = Conn.getConnection();
			String sql = "select * from article order by id desc limit 1,6";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Article dept = new Article(rs.getInt(1),rs.getString(2),rs.getString(4));
				list.add(dept);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}//获取连接
		
		return list;
		}
	
	//根据博客标题查询博客文章，    返回一条对象
	public Article query_title(String title) throws SQLException{
		Article article = null;
		
		Connection conn = Conn.getConnection();
		String sql = "select * from article where title='"+title+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			article = new Article(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return article;
	}
	
	//根据博客作者查询博客文章，    返回一条对象
	public Article query_author(String author) throws SQLException{
		Article article = null;
		
		Connection conn = Conn.getConnection();
		String sql = "select * from article where username='"+author+"'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			article = new Article(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
		
		return article;
	}
	
	public static void main(String[] args) {
		/*
		Article article = null;
		ArticleDao dao = new ArticleDao();
		try {
			article = dao.query_title("title4");
			int a = article.getId();
			System.out.println(a);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			*/
	}

	
}

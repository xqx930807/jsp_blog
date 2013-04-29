package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aurora.blog.dao.Conn;
import org.aurora.blog.dto.*;


public class BrowArtServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		
		//PrintWriter out = response.getWriter();
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		try {
			conn = Conn.getConnection();
			String id = request.getParameter("id");
			
			String sql_art = "select * from article where id = '"+id+"'";
			pstmt = conn.prepareStatement(sql_art);
			rs = pstmt.executeQuery();
			if(rs.next()){
				Article article = new Article(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5));				
				request.setAttribute("article", article);//设置article的请求变量				
			}
			String title = rs.getString(3);
			String sql_com = "select * from com where title='"+title+"'";
			ArrayList<Com> list_com  = new ArrayList<Com>();
			pstmt1 = conn.prepareStatement(sql_com);
			rs1 = pstmt1.executeQuery();
			while(rs1.next()){
				Com com = new Com(rs1.getInt(1),rs1.getString(2),rs1.getString(4),rs1.getString(5));
				list_com.add(com);
			}
			
			request.setAttribute("list_com", list_com);//设置有关所有评论的请求变量
			
			conn.close();
			pstmt.close();
			pstmt1.close();
			rs.close();
			rs1.close();

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher("article.jsp");//请求转发
		rd.forward(request, response);
		
	}
}

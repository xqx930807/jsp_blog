package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aurora.blog.dao.Conn;
import org.aurora.blog.dto.Com;
import org.aurora.blog.dto.Friend;

public class AddComServlet extends HttpServlet {


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("usersession");//取得用户名
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		String txt = request.getParameter("txt_content");
		String title = request.getParameter("title");
		
		try {
			conn = Conn.getConnection();
			String sql = "insert into com (username,time,coms,title) values ('"+username+"','"+new Timestamp(System.currentTimeMillis())+"','"+txt+"','"+title+"')";
			pstmt = conn.prepareStatement(sql);		
			pstmt.executeUpdate(sql);
	
		} catch (SQLException e) {
			e.printStackTrace();
		}			
			
		//请求转发
		RequestDispatcher rd = request.getRequestDispatcher("com_ok.jsp");
		rd.forward(request, response);
		
		
	}

}

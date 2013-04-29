package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aurora.blog.dao.Conn;

public class LogServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		//response.setContentType("text/html;charset=gbk");
		
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("txt_user");//用户名
		String password = request.getParameter("txt_pwd");//密码
		

		HttpSession session = request.getSession();
			Connection conn;
			try {
				conn = Conn.getConnection();
				String sql = "select *  from user where username = ? and password=?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					session.setAttribute("usersession",username);
					RequestDispatcher rd = request.getRequestDispatcher("login_ok.jsp");//请求转发
					rd.forward(request, response);
				}else{
					RequestDispatcher fr = request.getRequestDispatcher("login_fail.jsp");//请求转发
					fr.forward(request, response);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			

	}

}

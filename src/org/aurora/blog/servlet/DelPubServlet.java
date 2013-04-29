package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aurora.blog.dao.Conn;

public class DelPubServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("usersession");//取得用户名
		String id = request.getParameter("id");
			
		if(username.equals("admin")){
			try {
				Connection conn = Conn.getConnection();
				String sql = "delete from pub where id='"+id+"'";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();				

			} catch (SQLException e) {
				e.printStackTrace();
			}			
		}else{
			return;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("managepub.jsp");//请求转发
		rd.forward(request, response);
		
	}


}

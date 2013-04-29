package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aurora.blog.dao.Conn;

public class BrowsePubServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		
		String id = request.getParameter("id");
		
		Connection conn = null;
		PreparedStatement pstmt =null;
		
		try {
			conn = Conn.getConnection();
			String sql = "select * from pub where id = '"+Integer.parseInt(id)+"'";
			pstmt = conn.prepareStatement(sql);		
			ResultSet rs = pstmt.executeQuery(sql);
			if(rs.next()){
				String cons = rs.getString(3);
				String time = rs.getString(4);
				request.setAttribute("cons", cons);
				request.setAttribute("time", time);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("browsepub.jsp");
		rd.forward(request, response);
		
	}

}

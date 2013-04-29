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
import javax.servlet.http.HttpSession;

import org.aurora.blog.dao.ArticleDao;
import org.aurora.blog.dao.Conn;
import org.aurora.blog.dao.FriendDao;
import org.aurora.blog.dto.Article;
import org.aurora.blog.dto.Friend;

public class QueryFriServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//编码
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("usersession");//取得用户名
		
		Friend  friend = null;
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		
		String para = request.getParameter("sel_tj");
		String key  = request.getParameter("sel_key");
		
		
			try {
				if(para.equals("name")){		
					conn = Conn.getConnection();
					String sql = "select * from friends where name='"+key+"' and username = '"+username+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()){
						friend = new Friend(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
					}
				}else{			
					conn = Conn.getConnection();
					String sql = "select * from friends where id='"+key+"' and username = '"+username+"'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()){
						friend = new Friend(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9));
					}
				}
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("friend", friend);
				
			
		//请求转发
		RequestDispatcher rd = request.getRequestDispatcher("query_friend.jsp");
		rd.forward(request, response);
		
	}

}

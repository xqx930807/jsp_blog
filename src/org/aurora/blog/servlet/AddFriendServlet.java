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
import org.aurora.blog.dao.PubDao;
import org.aurora.blog.dto.Friend;
import org.aurora.blog.dto.Pub;

public class AddFriendServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		
		//获得输出流
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("usersession");//取得用户名
		//获得表单提交的数据
		String name = request.getParameter("txt_name");
		String sex = request.getParameter("txt_sex");
		String birdate = request.getParameter("txt_bir");
		String city = request.getParameter("txt_province");
		String addr = request.getParameter("txt_address");
		String mail = request.getParameter("txt_handset");
		String tel = request.getParameter("txt_email");
		String qq = request.getParameter("txt_QQ");
		
		try {
			Connection conn = Conn.getConnection();
			String sql = "insert into  friends (name,sex,birdate,city,addr,mail,tel,qq,username) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, sex);
			pstmt.setString(3, birdate);
			pstmt.setString(4,city);
			pstmt.setString(5,addr);
			pstmt.setString(6, mail);
			pstmt.setString(7, tel);
			pstmt.setString(8,qq);
			pstmt.setString(9,username);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//请求转发
		RequestDispatcher rd = request.getRequestDispatcher("addfriend_ok.jsp");
		rd.forward(request, response);
	}

}

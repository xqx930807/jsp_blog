package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aurora.blog.dao.ArticleDao;
import org.aurora.blog.dao.PubDao;
import org.aurora.blog.dto.Article;
import org.aurora.blog.dto.Pub;

public class AddPubServlet extends HttpServlet {

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
		String title = request.getParameter("txt_title");
		String cons = request.getParameter("file");
		
		Pub pub = new Pub(title,cons);
		PubDao add = new PubDao();
		
		try {
			add.addPub(pub);
			RequestDispatcher rd = request.getRequestDispatcher("managepub.jsp");//请求转发
			rd.forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}

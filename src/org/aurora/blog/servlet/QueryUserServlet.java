package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aurora.blog.dao.ArticleDao;
import org.aurora.blog.dao.UserDao;
import org.aurora.blog.dto.Article;
import org.aurora.blog.dto.User;

public class QueryUserServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		
		UserDao userdao = null;
		User user = null;
		
		String para = request.getParameter("sel_tj");
		String key  = request.getParameter("sel_key");
		
		
			try {
				if(para.equals("name")){
					userdao = new UserDao();
					user = userdao.queryUser_Name(key);
				}else{
					userdao = new UserDao();
					user = userdao.queryUser_Id(Integer.parseInt(key));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("user",user);
		
		
		//ÇëÇó×ª·¢
		RequestDispatcher rd = request.getRequestDispatcher("queryuser.jsp");
		rd.forward(request, response);
		
	}

}

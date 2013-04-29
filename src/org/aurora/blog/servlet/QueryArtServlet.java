package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aurora.blog.dao.*;
import org.aurora.blog.dto.*;

public class QueryArtServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		
		ArticleDao articledao = null;
		Article article = null;
		
		String para = request.getParameter("queryarticle");
		String key  = request.getParameter("key");
		
		
			try {
				if(para.equals("title")){
					articledao = new ArticleDao();
					article = articledao.query_title(key);
				}else{
					articledao = new ArticleDao();
					article = articledao.query_author(key);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("article", article);
		
		
		//ÇëÇó×ª·¢
		RequestDispatcher rd = request.getRequestDispatcher("query.jsp");
		rd.forward(request, response);
		
	}
}

package org.aurora.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aurora.blog.dao.UserDao;
import org.aurora.blog.dto.User;

public class RegServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		
		//获得输出流
		PrintWriter out = response.getWriter();
		
		//获得表单提交的数据
		String username = request.getParameter("txt_regname");//用户名
		String name = request.getParameter("txt_regrealname");//真实姓名
		String password = request.getParameter("txt_regpwd");//密码
		String birthdate = request.getParameter("txt_birthday");//出生日期
		String email = request.getParameter("txt_regemail");//邮箱
		String city = request.getParameter("txt_province");//所在城市
		String sex = request.getParameter("txt_regsex");//性别
		String qq = request.getParameter("txt_regqq");//QQ号
		String homepage = request.getParameter("txt_reghomepage");//个人主页
		String sign = request.getParameter("txt_regsign");//个性化签名
		String intro = request.getParameter("txt_regintroduce");//自我简介
		
		
		
		//把数据封装为DTO对象
		User user = new User(username,name,password,birthdate,email,city);
		UserDao dao = new UserDao();
		try {
			//增加数据
			dao.addUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("reg_ok.jsp");
		rd.forward(request, response);
	}

	}


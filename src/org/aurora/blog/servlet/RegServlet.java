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
		//���ñ���
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=gbk");
		
		//��������
		PrintWriter out = response.getWriter();
		
		//��ñ��ύ������
		String username = request.getParameter("txt_regname");//�û���
		String name = request.getParameter("txt_regrealname");//��ʵ����
		String password = request.getParameter("txt_regpwd");//����
		String birthdate = request.getParameter("txt_birthday");//��������
		String email = request.getParameter("txt_regemail");//����
		String city = request.getParameter("txt_province");//���ڳ���
		String sex = request.getParameter("txt_regsex");//�Ա�
		String qq = request.getParameter("txt_regqq");//QQ��
		String homepage = request.getParameter("txt_reghomepage");//������ҳ
		String sign = request.getParameter("txt_regsign");//���Ի�ǩ��
		String intro = request.getParameter("txt_regintroduce");//���Ҽ��
		
		
		
		//�����ݷ�װΪDTO����
		User user = new User(username,name,password,birthdate,email,city);
		UserDao dao = new UserDao();
		try {
			//��������
			dao.addUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("reg_ok.jsp");
		rd.forward(request, response);
	}

	}


package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.tbl_coordinate;
import com.smhrd.model.tbl_coordinateDAO;

public class test_loginCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member vo = new Member(id,pw);
		
		MemberDAO dao = new MemberDAO();
		System.out.println("LoginCon id/pw >>"+id+"/"+pw);
		String loginMember = dao.selectMember(vo);
		System.out.println("이상없음");
		
		tbl_coordinateDAO dao2 = new tbl_coordinateDAO();
		
		tbl_coordinate selectme = dao2.selectOneme(id);
		System.out.println(selectme.getMEM_ID());
		System.out.println(selectme.getMEM_LATITUDE());
		System.out.println(selectme.getMEM_LONGITUDE());
		
		
		session.setAttribute("MEM_ID", selectme.getMEM_ID());
		session.setAttribute("MEM_LATITUDE", selectme.getMEM_LATITUDE());
		session.setAttribute("MEM_LONGITUDE", selectme.getMEM_LONGITUDE());
		
		
		if(loginMember != null) {
			
			System.out.println("로그인 성공");
			
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect("tbl_main.jsp");
		}else{
			
			System.out.println("로그인 실패");
			response.sendRedirect("tbl_main.jsp");
		}
				
				
				
				
				
			}



}

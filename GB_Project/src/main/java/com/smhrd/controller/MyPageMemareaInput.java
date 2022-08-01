package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.smhrd.model.MyPageMemareaDAO;


public class MyPageMemareaInput extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String MEM_ID = (String) session.getAttribute("loginMember");

		MyPageMemareaDAO dao = new MyPageMemareaDAO();
		String MEM_AREA = dao.selectMyPageMemarea(MEM_ID);
		System.out.println(MEM_AREA);
		
		
		if(MEM_AREA != null) {
			
			System.out.println("배송지 성공");
			
			// my페이지에 표시 세션에 저장 왜안돼지? 
			String mem_area = (String) session.getAttribute("MEM_AREA");
			String mem_id = request.getParameter("loginMember"); //이부분이 아닐 수 도 있음
			
			response.sendRedirect("myPage.jsp");
		}else{
			
			System.out.println("희망배송지 실패");
			response.sendRedirect("myPageMemAreainput.jsp");
		}
	}
	
}

package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.AppToPayDAO;


public class AppToPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String MEM_ID = (String)session.getAttribute("loginMember");
		int BOARD_SEQ = Integer.parseInt(request.getParameter("board_seq"));
		
		com.smhrd.model.AppToPay vo = new com.smhrd.model.AppToPay(MEM_ID,BOARD_SEQ);
		
	   AppToPayDAO dao = new AppToPayDAO();
	   
	   int cnt = dao.updateAppToPay(vo);
	   
	   if(cnt>0) {
		System.out.println("성공");   
	   }else {
		   System.out.println("실패");
	   }
		response.sendRedirect("payState.jsp");
	}

}

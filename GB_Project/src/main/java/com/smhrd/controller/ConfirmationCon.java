package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Confirmation;
import com.smhrd.model.ConfirmationDAO;


public class ConfirmationCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();		
		String id = (String)session.getAttribute("loginMember");
		int BOARD_SEQ = Integer.parseInt(request.getParameter("board_seq"));
		System.out.println(id);
		System.out.println(BOARD_SEQ);
		Confirmation vo = new Confirmation(id,BOARD_SEQ);
		
		int cnt = new ConfirmationDAO().updateConfirm(vo);
		
		if(cnt>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	
		response.sendRedirect("payState.jsp");
	}

}

package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MyPageMemarea;
import com.smhrd.model.MyPageMemareaDAO;
import com.smhrd.model.shareDeleteConDAO;


public class shareDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		 BigDecimal board_seq = new BigDecimal(request.getParameter("board_seq"));
		shareDeleteConDAO dao = new shareDeleteConDAO();
		int cnt = dao.shareDeleteCon(board_seq);
		
		if(cnt>0) {//주소 저장 성공
			System.out.println("삭제 성공");
			
		}else {//주소 저장 실패
			System.out.println("삭제 실패");
	}
		response.sendRedirect("payState.jsp");

	}
	}



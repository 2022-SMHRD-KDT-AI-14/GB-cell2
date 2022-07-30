package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ShareDAO;
import com.smhrd.model.ShareForUpdate;

public class updateStateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		BigDecimal board_seq = new BigDecimal(request.getParameter("board_seq"));
		String article_state = request.getParameter("article_state");
		System.out.println("updateStateCon, board_seq >> "+board_seq);
		System.out.println("updateStateCon, article_state >> "+article_state);
		ShareForUpdate vo= new ShareForUpdate(board_seq,article_state);
		ShareDAO dao = new ShareDAO();
		int cnt = dao.updateState(vo);
		if(cnt>0) {
			System.out.println("참여 성공");
		// 알람기능추가
			response.sendRedirect("payState.jsp");
		
		}else {
			System.out.println("참여 실패");
			// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
			response.sendRedirect("payState.jsp");
		}		
		
	}

}

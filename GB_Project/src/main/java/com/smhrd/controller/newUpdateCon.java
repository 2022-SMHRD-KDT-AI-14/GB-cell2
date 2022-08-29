package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ShareDAO;
import com.smhrd.model.ShareForUpdate;

public class newUpdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		BigDecimal board_seq = new BigDecimal(request.getParameter("board_seq"));
		String article_state = request.getParameter("article_state");
		ShareForUpdate vo = new ShareForUpdate(board_seq, article_state);
		int cnt1 = new ShareDAO().updateState(vo);

		if (cnt1 > 0) {
			System.out.println("상태 업데이트 성공!");
		} else {
			System.out.println("상태 업데이트 실패ㅜ");
		}
		
		response.sendRedirect("payState2.jsp");
	}

}

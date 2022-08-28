package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;

public class tradeDecCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		tbl_payment vo = new tbl_payment(loginMember, new BigDecimal(board_seq));
		int cnt1 = new tbl_paymentDAO().tradeDec(vo);
		int totalPar = new tbl_paymentDAO().selectPaymentPar(board_seq).size();
		
		if (cnt1 > 0) {
			System.out.println("거래확정 성공!");
		} else {
			System.out.println("거래확정 실패ㅜ");
		}
		
		List<tbl_payment> payList = new tbl_paymentDAO().selectPaymentPar(board_seq);
		int cnt =0;
		for(tbl_payment p :payList) {
			if(p.getCAT_NAME().equals("거래확정")) cnt++;
		}
		if(cnt == totalPar) {
			String url="newUpdateCon?board_seq="+board_seq+"&article_state=거래완료";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			
		}else {
		
		response.sendRedirect("payState2.jsp");
		}
		
	}

}

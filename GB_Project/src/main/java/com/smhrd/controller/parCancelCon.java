package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;
public class parCancelCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("loginMember");
		BigDecimal board_seq = new BigDecimal(Integer.parseInt(request.getParameter("board_seq")));
		BuyApplicant vo1 = new BuyApplicant(mem_id,board_seq);
		tbl_payment vo2 = new tbl_payment(mem_id,board_seq);
		
		int cnt1 = new BuyApplicantDAO().deleteBuyAppPar(vo1);
		int cnt2 = new tbl_paymentDAO().deletePaymentPar(vo2);
		
		if (cnt1 > 0) {
			System.out.println("참석자 구매tb 삭제 성공!");
		} else {
			System.out.println("참석자 구매tb 삭제 실패ㅜ");
		}
		
		if (cnt2 > 0) {
			System.out.println("참석자 결제tb 삭제 성공!");
		} else {
			System.out.println("참석자 결제tb 삭제 실패ㅜ");
		}
		response.sendRedirect("payState2.jsp");
	}

}

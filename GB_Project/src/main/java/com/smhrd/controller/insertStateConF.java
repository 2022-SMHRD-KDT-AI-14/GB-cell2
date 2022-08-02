package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tbl_free_applicant;
import com.smhrd.model.tbl_free_applicantDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;

public class insertStateConF extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		String cat_name = request.getParameter("cat_name");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		
		//추가 by성결
		tbl_payment vo2= new tbl_payment(loginMember, new BigDecimal(board_seq));
		tbl_paymentDAO dao3 = new tbl_paymentDAO();
		int cnt3 =dao3.insertPaymentPar(vo2);
		
		if(cnt3>0) {
			System.out.println("결제테이블 성공");
		}else {
			System.out.println("결제테이블 실패");
		}//추가 by성결
		
		
		System.out.println("insertStateConf, mem_id >> "+loginMember);
		System.out.println("insertStateConf, 카테고리 >> "+cat_name);
		System.out.println("insertStateConf, board_seq >> "+board_seq);
		
		tbl_free_applicantDAO dao = new tbl_free_applicantDAO();
		tbl_free_applicant vo = new tbl_free_applicant(loginMember,"모집중","P", cat_name, new BigDecimal(board_seq));
		int cnt =  dao.insertFreeApplicant(vo);
		if(cnt>0) {
			 System.out.println("buyApllicant 참석자 추가 성공");
		 }else {
			 System.out.println("buyApllicant 참석자 추가 실패");
		 }
//			response.sendRedirect("boardView.jsp?num="+board_seq);
			response.sendRedirect("boardView.jsp?num="+board_seq/2);
	}

}

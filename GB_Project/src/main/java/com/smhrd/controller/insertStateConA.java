package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.tbl_arbeit_applicant;
import com.smhrd.model.tbl_arbeit_applicantDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;

public class insertStateConA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		String arb_time = request.getParameter("arb_time");
		String arb_site = request.getParameter("arb_site");
		int arb_pay= Integer.parseInt( request.getParameter("arb_pay"));
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
		
		
		System.out.println("insertUpdateCona, mem_id >> "+loginMember);
		System.out.println("insertUpdateCona, 시간 >> "+arb_time);
		System.out.println("insertUpdateCona, 장소 >> "+arb_site);
		System.out.println("insertUpdateCona, 시급 >> "+arb_pay);
		System.out.println("insertUpdateCona, 카테고리 >> "+cat_name);
		System.out.println("insertUpdateCona, board_seq >> "+board_seq);
		

		tbl_arbeit_applicantDAO dao = new tbl_arbeit_applicantDAO();
		tbl_arbeit_applicant vo = new tbl_arbeit_applicant(loginMember,"모집중","P",arb_time, arb_site, new BigDecimal(arb_pay) ,cat_name,new BigDecimal(board_seq));
		int cnt =  dao.insertArbeitApplicant(vo);
		PrintWriter out = response.getWriter();
		
		
		if(cnt>0) {
			 System.out.println("ArbeitApplicant 참석자 추가 성공");
			 out.print("<html><head></head><body><script>alert('참석 실패')</script></body></html>");
		 }else {
			 System.out.println("ArbeitApplicant 참석자 추가 실패");
			 System.out.println("ArbeitApplicant 참석자 추가 실패");
			 out.print("<html><head></head><body><script>alert('참석 실패')</script></body></html>");
		 }
		response.sendRedirect("boardView.jsp?num="+board_seq/2);		 
	
	
	
	}

}

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
import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;

public class insertStateConB extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//시퀀스 받는다.
		//참석자 입장이다. 시퀀스에 접근해서 share table에 간다
		// 필요한정보꺼낸다
		System.out.println("ㅅㅂ");
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		String buy_link = request.getParameter("buy_link");
		int buy_pay= Integer.parseInt( request.getParameter("buy_pay"));
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
		
		
		System.out.println("insertUpdateConb, mem_id >> "+loginMember);
		System.out.println("updateStateConb, 링크 >> "+buy_link);
		System.out.println("insertUpdateConb, 가격 >> "+buy_pay);
		System.out.println("insertUpdateConb, 카테고리 >> "+cat_name);
		System.out.println("insertUpdateConb, board_seq >> "+board_seq);
		
		BuyApplicantDAO dao = new BuyApplicantDAO();
		BuyApplicant vo = new BuyApplicant(loginMember,"모집중","P",buy_link, new BigDecimal(buy_pay) , cat_name,new BigDecimal(board_seq));
		int cnt =  dao.insertBuyApplicant(vo);
		if(cnt>0) {
			 System.out.println("buyApllicant 참석자 추가 성공");
		 }else {
			 System.out.println("buyApllicant 참석자 추가 실패");
		 }
//		response.sendRedirect("boardView.jsp?num="+board_seq);
		response.sendRedirect("boardView.jsp?num="+board_seq/2);		 
	}

}

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

/**
 * Servlet implementation class test
 */
public class test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("test.java파일입니다.");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		String buy_link = request.getParameter("buy_link");
		int buy_pay= Integer.parseInt( request.getParameter("buy_pay"));
		String cat_name = request.getParameter("cat_name");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		
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
//			response.sendRedirect("boardView.jsp?num="+board_seq);
			response.sendRedirect("boardView.jsp?num="+board_seq/2);
		
	}

}

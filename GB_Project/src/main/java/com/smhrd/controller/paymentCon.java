package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tbl_paymentDAO;

public class paymentCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		
		
		
		//작성자수준
		//건빈이 BoardWC.java에다  추가작성하는것이 맞는것 같다아서 붙여넣음
		
		//참여자수준
		//참여버튼 누르면 아래메소드 실행하게 test_participateCon if/else에서 else안에다 삽입함.
		
		request.setCharacterEncoding("UTF-8");
		
		//세션 - id
		HttpSession session = request.getSession();
		String MEM_ID = (String)session.getAttribute("loginMember");
		
		tbl_paymentDAO dao = new tbl_paymentDAO();
		int cnt3 =dao.insertPayment(MEM_ID);
		
		if(cnt3>0) {
			System.out.println("참여확정 후 결제테이블 성공");
		}else {
			System.out.println("참여확정 후 결제테이블 실패");
		}
		
		/*
		 * String cate = request.getParameter("radio"); if(cate.equals("4")) {
		 * response.sendRedirect("tbl_boardBuy.jsp"); }else if(cate.equals("2")) {
		 * response.sendRedirect("tbl_boardId.jsp"); }else if(cate.equals("3")) {
		 * response.sendRedirect("tbl_boardArbeit.jsp"); }else {
		 * response.sendRedirect("tbl_boardFree.jsp"); }
		 */
		
		
		
	}

}

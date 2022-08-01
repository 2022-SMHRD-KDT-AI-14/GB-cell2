package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tbl_account_applicant;
import com.smhrd.model.tbl_account_applicantDAO;
import com.smhrd.model.tbl_arbeit_applicant;

public class insertStateConI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		String acc_link = request.getParameter("acc_link");
		String acc_time = request.getParameter("arb_site");
		int acc_pay= Integer.parseInt( request.getParameter("arb_pay"));
		String cat_name = request.getParameter("cat_name");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		
		System.out.println("insertUpdateConi, mem_id >> "+loginMember);
		System.out.println("insertUpdateConi, 링크 >> "+acc_link);
		System.out.println("insertUpdateConi, 시간 >> "+acc_time);
		System.out.println("updateStateConi, 금액>> "+acc_pay);
		System.out.println("updateStateConi, 카테고리 >> "+cat_name);
		System.out.println("insertUpdateConi, board_seq >> "+board_seq);
		
		tbl_account_applicantDAO dao = new tbl_account_applicantDAO();
		tbl_account_applicant vo = 
				new tbl_account_applicant(loginMember,"모집중","P",
						acc_link, acc_time, new BigDecimal(acc_pay)
						,cat_name,new BigDecimal(board_seq));
		int cnt =  dao.insertAccountApplicant(vo);
		if(cnt>0) {
			 System.out.println("AccountApplicant 참석자 추가 성공");
		 }else {
			 System.out.println("AccountApplicant 참석자 추가 실패");
		 }
			response.sendRedirect("boardView.jsp?num="+board_seq);
	}

}

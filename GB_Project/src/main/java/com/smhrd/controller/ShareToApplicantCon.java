package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.tbl_account_applicant;
import com.smhrd.model.tbl_account_applicantDAO;
import com.smhrd.model.tbl_arbeit_applicant;
import com.smhrd.model.tbl_arbeit_applicantDAO;
import com.smhrd.model.tbl_free_applicant;
import com.smhrd.model.tbl_free_applicantDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.updateStatepDAO;

public class ShareToApplicantCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("왕리스트");
		//1. 참석테이블에서 게시글 번호 긁어오기
			//1-1 로그인한사람의
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		
		tbl_arbeit_applicantDAO daoA =new tbl_arbeit_applicantDAO();
		BuyApplicantDAO daoB = new BuyApplicantDAO();
		tbl_free_applicantDAO daoF = new tbl_free_applicantDAO();
		tbl_account_applicantDAO daoI =new tbl_account_applicantDAO();

		/*
		 * tbl_arbeit_applicant voA = new tbl_arbeit_applicant(); BuyApplicant voB = new
		 * BuyApplicant(); tbl_free_applicant voF = new tbl_free_applicant();
		 * tbl_account_applicant voI = new tbl_account_applicant();
		 */
		
		ArrayList<Integer> ListBoard = new ArrayList<Integer>(); 

		List<tbl_arbeit_applicant> board_seqAL = daoA.selectOneA(loginMember);// 리스트
		for(tbl_arbeit_applicant b : board_seqAL) {
		//	System.out.println(b.getBOARD_SEQ());
			 ListBoard.add(b.getBOARD_SEQ().intValue());
		}
		
		
		
		List<BuyApplicant>  board_seqBL = daoB.selectOneB(loginMember);
		for(BuyApplicant b :  board_seqBL) {
			//System.out.println(b.getBoard_seq());
			 ListBoard.add(b.getBoard_seq().intValue());
		}
		
		
		List<tbl_free_applicant>  board_seqFL = daoF.selectOneF(loginMember);
		for(tbl_free_applicant b : board_seqFL) {
			//System.out.println(b.getBOARD_SEQ());
			 ListBoard.add(b.getBOARD_SEQ().intValue());
		}
		
		
		List<tbl_account_applicant>  board_seqIL = daoI.selectOneI(loginMember);
		for(tbl_account_applicant b : board_seqIL) {
			//System.out.println(b.getBOARD_SEQ());
			 ListBoard.add(b.getBOARD_SEQ().intValue());
		}
		
		for(Integer b : ListBoard) {
			System.out.println("왕리스트 나열 "+b);
		}
		
//		RequestDispatcher rd = request.getRequestDispatcher("updateStateConpAll");
//		request.setAttribute("ListBoard", ListBoard);
//		rd.forward(request, response);
		
		
		
		//System.out.println("여기까지 오면 반은 성공!!");
		ShareDAO dao = new ShareDAO();
			
		String cat_name = null;
		String state = null;
		updateStatepDAO	dao2=new updateStatepDAO();
		for (Integer i : ListBoard) {
			System.out.println(i+"게시글의 상태를 참석자 테이블의 상태로 연동해보자");
			cat_name = dao.selectOne(i).getCat_name(); //게시글의 카테고리
			state = dao.selectOne(i).getArticle_state();
			int cnt2 = 0;
			if(cat_name.equals("A")) {
				cnt2 = dao2.updateStatepA( new BigDecimal(i), state);
			}else if(cat_name.equals("B")) {
				cnt2 = dao2.updateStatepB( new BigDecimal(i), state);
			}else if(cat_name.equals("I")) {
				cnt2 = dao2.updateStatepI( new BigDecimal(i), state);
			}else {
				cnt2 = dao2.updateStatepF( new BigDecimal(i), state);
			}	
			
			if (cnt2 > 0) {
				System.out.println(i+"번 "+cat_name+" 테이블<"+state+">으로 성공!");
			} else {
				System.out.println(i+"번 "+cat_name+" 테이블<"+state+">으로 성공!");
			}
			
			
			
		}
		System.out.println("연동성공^^");
		response.sendRedirect("payState.jsp");
		
	}

}

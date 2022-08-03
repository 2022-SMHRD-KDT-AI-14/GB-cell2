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

public class ShareToAppCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		String state = request.getParameter("state");
		
		tbl_arbeit_applicantDAO daoA =new tbl_arbeit_applicantDAO();
		BuyApplicantDAO daoB = new BuyApplicantDAO();
		tbl_free_applicantDAO daoF = new tbl_free_applicantDAO();
		tbl_account_applicantDAO daoI =new tbl_account_applicantDAO();

		
		ShareDAO dao = new ShareDAO();
		String cat_name = dao.selectOne(board_seq).getCat_name();
		updateStatepDAO	dao2=new updateStatepDAO();
			int cnt2 = 0;
			if(cat_name.equals("A")) {
				cnt2 = dao2.updateStatepA( new BigDecimal(board_seq), state);
			}else if(cat_name.equals("B")) {
				cnt2 = dao2.updateStatepB( new BigDecimal(board_seq), state);
			}else if(cat_name.equals("I")) {
				cnt2 = dao2.updateStatepI( new BigDecimal(board_seq), state);
			}else {
				cnt2 = dao2.updateStatepF( new BigDecimal(board_seq), state);
			}	
			
			if (cnt2 > 0) {
				System.out.println(board_seq+"번 "+cat_name+" 테이블<"+state+">으로 성공!");
			} else {
				System.out.println(board_seq+"번 "+cat_name+" 테이블<"+state+">으로 성공!");
			}
			
			
			System.out.println("연동성공^^");
			response.sendRedirect("payState.jsp");
			
		}
	
		
	}



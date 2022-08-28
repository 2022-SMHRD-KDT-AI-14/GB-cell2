package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.MyPageMemarea;
import com.smhrd.model.MyPageMemareaDAO;
import com.smhrd.model.shareDeleteConDAO;
import com.smhrd.model.tbl_paymentDAO;


public class shareDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		BigDecimal board_seq = new BigDecimal(request.getParameter("board_seq"));
		shareDeleteConDAO dao = new shareDeleteConDAO();
		int cnt1 = dao.shareDeleteCon(board_seq);
		
		if(cnt1>0) {//주소 저장 성공
			System.out.println("삭제 성공");
			
		}else {//주소 저장 실패
			System.out.println("삭제 실패");
		}
		
		new BuyApplicantDAO().deleteBuyApp(board_seq);
		new tbl_paymentDAO().deletePayment(board_seq);
		response.sendRedirect("payState.jsp");

	}
	}



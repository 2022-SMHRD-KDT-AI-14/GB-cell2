package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;

/**
 * Servlet implementation class buyApplicantCNT
 */
public class buyApplicantCNT extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int board_seq=Integer.parseInt(request.getParameter("board_seq"));//form에서 받기
		int cnt= new BuyApplicantDAO().SelectBuyApplicantCNT(board_seq);
		System.out.println("buyApplicantCNT , 총 참여자수 >>"+cnt);
		response.sendRedirect("paymentAPI.jsp?cnt='cnt'");
		
	}

}

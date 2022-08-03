package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.tbl_reportDAO;


public class tbl_reportDeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int BOARD_SEQ =Integer.parseInt(request.getParameter("BOARD_SEQ"));
		
		tbl_reportDAO dao = new tbl_reportDAO();
		
		int cnt = dao.updatereport(BOARD_SEQ);
		
		if(cnt>0) {
			
		System.out.println("완료");
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("tbl_reportview.jsp");
	}

}

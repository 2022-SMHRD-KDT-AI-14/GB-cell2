package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tbl_report;
import com.smhrd.model.tbl_reportDAO;

public class tbl_reportCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String MEM_ID = (String)session.getAttribute("loginMember");
		String num = (String)session.getAttribute("num");
		int BOARD_SEQ = Integer.parseInt(num);
		String R_TITLE = request.getParameter("name"); 
		String R_CONTENT = request.getParameter("content"); 
		
		
		
		tbl_report vo = new tbl_report(0,R_TITLE,R_CONTENT,MEM_ID,"미정",BOARD_SEQ);
		tbl_reportDAO dao = new tbl_reportDAO();
				int cnt = dao.insertreport(vo);
				
				if(cnt>0) {		
					System.out.println("성공");
				}else {
					System.out.println("실패");
				}
		response.sendRedirect("tbl_main.jsp");
	}

}

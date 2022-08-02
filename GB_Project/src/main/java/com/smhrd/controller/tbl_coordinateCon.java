package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.tbl_coordinate;
import com.smhrd.model.tbl_coordinateDAO;



public class tbl_coordinateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String MEM_ID = (String)session.getAttribute("loginMember");
		
		tbl_coordinateDAO dao = new tbl_coordinateDAO();
		
		tbl_coordinate selectme = dao.selectOneme(MEM_ID);
		System.out.println(selectme.getMEM_ID());
		System.out.println(selectme.getMEM_LATITUDE());
		System.out.println(selectme.getMEM_LONGITUDE());
		
		
		session.setAttribute("MEM_ID", selectme.getMEM_ID());
		session.setAttribute("MEM_LATITUDE", selectme.getMEM_LATITUDE());
		session.setAttribute("MEM_LONGITUDE", selectme.getMEM_LONGITUDE());
		
		response.sendRedirect("tbl_coordinate.jsp");
		
	}

}

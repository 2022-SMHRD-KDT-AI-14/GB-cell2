package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.tbl_arbeit_applicantDAO;

public class updateStateConp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Integer> bList = (List<Integer>) request.getAttribute("bList");
		System.out.println("여기까지 오면 반은 성공!!");
		ShareDAO dao = new ShareDAO();

		String board_state = "거래중";
		String cat_name = null;
		for (Integer i : bList) {

			Share vo = new Share( new BigDecimal(i), board_state);
			dao.selectOne(i).getCat_name();
			int cnt = dao.updateStatep(vo);
			if (cnt > 0) {
				System.out.println("거래중으로 성공!");
			} else {
				System.out.println("거래중으로 실패..");
			}
			
			if(cat_name.equals("A")) {
				 new tbl_arbeit_applicantDAO().updateStatep();
			}else if(cat_name.equals("B")) {
				new tbl_arbeit_applicantDAO().updateStatep();
			}else if(cat_name.equals("I")) {
				new tbl_arbeit_applicantDAO().updateStatep();
			}else {
				
			}	
		}

		response.sendRedirect("payState.jsp");
	}

}

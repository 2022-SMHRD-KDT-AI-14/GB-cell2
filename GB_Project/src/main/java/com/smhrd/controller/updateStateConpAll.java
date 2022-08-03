package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.tbl_arbeit_applicantDAO;
import com.smhrd.model.updateStatepDAO;

public class updateStateConpAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("all");
//		request.setCharacterEncoding("UTF-8");
//		HttpSession session = request.getSession();
//		String loginMember = (String)session.getAttribute("loginMember");
		
	
		List<Integer> bList = (List<Integer>) request.getAttribute("bList");
		ShareDAO dao = new ShareDAO();
			
		String cat_name = null;
		String board_state = null;
		updateStatepDAO	dao2=new updateStatepDAO();
		for (Integer i : bList) {
			cat_name = dao.selectOne(i).getCat_name();
			board_state = dao.selectOne(i).getArticle_state();
			int cnt2 = 0;
			if(cat_name.equals("A")) {
				cnt2 = dao2.updateStatepA( new BigDecimal(i), board_state);
			}else if(cat_name.equals("B")) {
				cnt2 = dao2.updateStatepB( new BigDecimal(i), board_state);
			}else if(cat_name.equals("I")) {
				cnt2 = dao2.updateStatepI( new BigDecimal(i), board_state);
			}else {
				cnt2 = dao2.updateStatepF( new BigDecimal(i), board_state);
			}	
			
			if (cnt2 > 0) {
				System.out.println(cat_name+" 테이블은"+board_state+" 로 성공!");
			} else {
				System.out.println(cat_name+" 테이블은"+board_state+" 로 실패!");
			}
			
		}

response.sendRedirect("payState.jsp");
	}

}

package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Board;
import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class Participate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		//요청데이터(파라미터) 받기
		String mem_id = request.getParameter("mem_id");
		String buy_p_state ="N";
		String buy_c_state = null;
		String buy_link = request.getParameter("buy_link");
		int buy_pay = Integer.parseInt(request.getParameter("buy_pay"));
		String cat_name = request.getParameter("cat_name");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));	
		System.out.println("test_JoincCon,id >> "+mem_id);
		
		BuyApplicant vo = new BuyApplicant(mem_id,buy_p_state,buy_c_state, buy_link, buy_pay,cat_name,board_seq);
		BuyApplicantDAO dao = new BuyApplicantDAO();
		int cnt = dao.insertBuyApplicant(vo);
		
//		MemberDAO dao = new MemberDAO();
//		int cnt =  dao.insertMember(vo);
//		System.out.println("test_JoincCon,cnt >> "+cnt);
//		
//		if(cnt>0) {
//			System.out.println("회원가입 성공");
//			// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
//			RequestDispatcher rd = request.getRequestDispatcher("test_main.jsp");
//			request.setAttribute("id", vo.getId());
//			rd.forward(request, response);
//			
//			// 다른방법: 리다이렉팅, 쿼리스트링
//			//response.sendRedirect("main.jsp?email=email");
//		
//		}else {
//			System.out.println("회원가입 실패");
//			// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
//			response.sendRedirect("test_main.jsp");
//		}
//		
		
		
	}

}

package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicant;
import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
public class test_participateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 본래는 제2자 '참여확정'시 호출됨
		// 제1자도 '거래결정'시 호출되게 하자~
		HttpSession session = request.getSession();
		String mem_id= (String)session.getAttribute("loginMember");
		String by_c_state = "N";
//		String buy_link = request.getParameter("buy_link"); //form에서 받기
//		int buy_pay = Integer.parseInt(request.getParameter("buy_pay"));//form에서 받기
//		String cat_name = request.getParameter("cat_name");//form에서 받기
//		int board_seq=Integer.parseInt(request.getParameter("num"));//form에서 받기
//		System.out.println("test_JoincCon,mem_id >> "+mem_id);
//		BuyApplicant vo= new BuyApplicant(mem_id, by_p_state, by_c_state, buy_link, buy_pay, cat_name, board_seq);

		
		String buy_link = "www.coupang.com"; //form에서 받기
		int buy_pay = 15000;//form에서 받기
		String cat_name = "P";//form에서 받기
		int board_seq=Integer.parseInt(request.getParameter("num"));//form에서 받기
		System.out.println("test_JoincCon,mem_id >> "+mem_id);
		BuyApplicant vo= new BuyApplicant(mem_id,by_c_state, buy_link, buy_pay, cat_name, board_seq);
		System.out.println("test_JoincCon,mem_id >> "+mem_id);
		
		
		BuyApplicantDAO dao = new BuyApplicantDAO();
		int cnt = dao.insertBuyApplicant(vo);
		System.out.println("test_participateCon,cnt >> "+cnt);
		
		if(cnt>0) {
			System.out.println("참여 성공");
			// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
//			RequestDispatcher rd = request.getRequestDispatcher("test_main.jsp");
//			request.setAttribute("id", vo.getId());
//			rd.forward(request, response);
			
			// 다른방법: 리다이렉팅, 쿼리스트링
			//response.sendRedirect("main.jsp?email=email");
			response.sendRedirect("payState.jsp");
		
		}else {
			System.out.println("참여 실패");
			// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
			response.sendRedirect("payState.jsp");
		}
		
		
		
	}


}

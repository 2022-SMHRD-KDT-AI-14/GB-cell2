package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
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
import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;
import com.smhrd.model.test_participateConDAO;
import com.smhrd.model.test_participatelistCon;
public class test_participateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;


	


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 본래는 제2자 '참여확정'시 호출됨
		// 제1자도 '거래결정'시 호출되게 하자~
		
		request.setCharacterEncoding("UTF-8");
		
		//세션 - id
		HttpSession session = request.getSession();
	
		
		
		int board_seq=Integer.parseInt(request.getParameter("board_seq"));//form에서 받기
		String mem_id= (String)session.getAttribute("loginMember");
		
		String writer= new ShareDAO().selectWriter(board_seq);
		System.out.println("dao실행후 writer >> "+writer);
//		
		
		String by_p_state;
		if(mem_id.equals(writer)){ //참여자가 작성자와 같은경우
			by_p_state = "입금대기";  //모집중, 입금대기, 거래중, 거래완료
		}else { //참여자가 작성자가 아닌경우
			by_p_state = "모집중";  //모집중, 입금대기, 거래중, 거래완료
			
			
			//결제상태 테이블 추가영역
			HttpSession session2 = request.getSession();
			String MEM_ID = (String)session2.getAttribute("loginMember");
			BigDecimal BOARD_SEQ = new BigDecimal(board_seq);
			tbl_payment vo = new tbl_payment(MEM_ID,BOARD_SEQ);
			tbl_paymentDAO dao = new tbl_paymentDAO();
			int cnt3 =dao.insertPaymentPar(vo);
			
			if(cnt3>0) {
				System.out.println("참여확정 후 결제테이블 성공");
			}else {
				System.out.println("참여확정 후 결제테이블 실패");
			}
			
			
		}
		
		
		
		String by_c_state = "N";
//		String buy_link = request.getParameter("buy_link"); //form에서 받기
//		int buy_pay = Integer.parseInt(request.getParameter("buy_pay"));//form에서 받기
//		String cat_name = request.getParameter("cat_name");//form에서 받기
//		int board_seq=Integer.parseInt(request.getParameter("num"));//form에서 받기
//		System.out.println("test_JoincCon,mem_id >> "+mem_id);
//		BuyApplicant vo= new BuyApplicant(mem_id, by_p_state, by_c_state, buy_link, buy_pay, cat_name, board_seq);

		
		
		
		
		String buy_link = "www.coupang.com"; //form에서 받ㅋ
		BigDecimal buy_pay = new BigDecimal(2000);//form에서 받기
		String cat_name = "P";//form에서 받기
		
		System.out.println("test_Con,board_seq >> "+board_seq);
		BigDecimal board_seq_big = new BigDecimal(board_seq);
		BuyApplicant vo= new BuyApplicant(mem_id,by_p_state,by_c_state, buy_link, buy_pay, cat_name, board_seq_big);
		
		
		BuyApplicantDAO dao = new BuyApplicantDAO();
		int cnt = dao.insertBuyApplicant(vo);
		
		if(cnt>0) {
			System.out.println("참여 성공");
		
			response.sendRedirect("payState.jsp");
		
		}else {
			System.out.println("참여 실패");
			// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
			response.sendRedirect("payState.jsp");
		}
		
		
		
	}


}

package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.ShareForUpdate;
import com.smhrd.model.tbl_account_applicantDAO;
import com.smhrd.model.tbl_arbeit_applicantDAO;
import com.smhrd.model.tbl_free_applicantDAO;
import com.smhrd.model.tbl_paymentDAO;

public class updateStateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String String = null;

	
	//업데이트 하려면 boared_seq,state,cat_name 필요
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		System.out.println("updateStateCon, 로그인아이디 >> "+loginMember);
		String cat_name = request.getParameter("cat_name");
		System.out.println("updateStateCon, 카테고리 >> "+cat_name);
		BigDecimal board_seq = new BigDecimal(request.getParameter("board_seq"));
		System.out.println("updateStateCon, 게시글번호 >> "+board_seq);
		//String article_state = request.getParameter("article_state");
		String article_state =null;
		
		//보드시퀀스로 작성자 찾기
		String writer = new ShareDAO().selectOne(board_seq.intValue()).getMem_id();
		System.out.println("updateStateCon, 작성자 >> "+writer);
		
		
		
		
		if( loginMember.equals(writer) ) { //호출자가 작성자인 경우. 업데이트
			 article_state = request.getParameter("article_state"); //
		}else { //호출자가 작성자가 아닌 경우
			article_state="모집중";
			System.out.println("참여자가 호출했으니 인설트해야함");
			//참여자 인설트하는         insertStateConF
			String url = "insertStateCon"+cat_name;
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			response.sendRedirect("insertStateCon"+cat_name);
		}
		
		System.out.println("updateStateCon, 전>> "+article_state);
	
		
		// case1 : 작성자가 거래결정시 >> 참석자전원 입금대기로 상태변화, 
//		if(article_state.equals("모집중") &(cat_name.equals("B"))) {  왜 카테고리 b제약을 주었지?
		if(article_state.equals("모집중") ) { 
		
			ShareDAO dao = new ShareDAO();
			ShareForUpdate vo= new ShareForUpdate(board_seq,"입금대기",cat_name);
			int cnt = dao.updateState(vo);
			System.out.println("updateStateCon, 후 >> "+vo.getArticle_state());
			//if(cat_name=='A')
			//구매 update
			new BuyApplicantDAO().updateState(board_seq,"입금대기");
			new tbl_account_applicantDAO().updateState(board_seq);
			new tbl_arbeit_applicantDAO().updateState(board_seq);
			new tbl_free_applicantDAO().updateState(board_seq);
			//계정 update
			//알바 update
			System.out.println("updateStateCon, 후 >> "+vo.getArticle_state());
			
			
			
			if(cnt>0) {
				System.out.println("엄데이트 성공");
				response.sendRedirect("payState.jsp");
			
			}else {
				System.out.println("업데이트 실패");
				response.sendRedirect("payState.jsp");
			}		
		}
		// case2 : 참석자가 입금완료시 >> pay테이블 입금완료 , 
		else if(article_state.equals("입금대기")) {
			tbl_paymentDAO pdao = new tbl_paymentDAO();
			int TFcnt= pdao.selectPaymentTFcnt(board_seq.intValue());
			int Allcnt =pdao.selectPaymentAllcnt(board_seq.intValue());
			int cnt =0;
			int money = Integer.parseInt(request.getParameter("money"));
			pdao.updatePayment(loginMember,money,"입금완료",board_seq.intValue()); 
			
			
			//전원입금완료시 >> share테이블 거래중으로 상태변화
			if(TFcnt == Allcnt) {
				ShareDAO dao = new ShareDAO();
				ShareForUpdate vo= new ShareForUpdate(board_seq,"입금대기",cat_name);
				cnt = dao.updateState(vo);
				System.out.println("updateStateCon, 후 >> "+vo.getArticle_state());
			}		
			
			if(cnt>0) {
				System.out.println("엄데이트 성공");
				response.sendRedirect("payState.jsp");
			
			}else {
				System.out.println("업데이트 실패");
				response.sendRedirect("payState.jsp");
			}	
			
			
		// case3 : 참석자가 거래확정시 >> 
		}else if(article_state.equals("거래중")) {
			ShareDAO dao = new ShareDAO();
			ShareForUpdate vo= new ShareForUpdate(board_seq,"입금대기",cat_name);
			int cnt = dao.updateState(vo);
			System.out.println("updateStateCon, 후 >> "+vo.getArticle_state());
			
			if(cnt>0) {
				System.out.println("엄데이트 성공");
				response.sendRedirect("payState.jsp");
			
			}else {
				System.out.println("업데이트 실패");
				response.sendRedirect("payState.jsp");
			}	
		}
		
		
	}
}
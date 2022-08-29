package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;

public class newUpdatePayCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginMember = (String)session.getAttribute("loginMember");
		int board_seq = Integer.parseInt(request.getParameter("board_seq"));
		BigDecimal price = new BuyApplicantDAO().selectOnePar2(loginMember,board_seq).getBuy_pay();
		//String category = new ShareDAO().selectOne(board_seq).getCat_name();
		//String state= new ShareDAO().selectOne(board_seq).getArticle_state();
		int totalPar = new tbl_paymentDAO().selectPaymentPar(board_seq).size();
		int inputPrice = price.intValue()/totalPar;
		tbl_payment vo = new tbl_payment(loginMember, new BigDecimal(inputPrice), new BigDecimal(board_seq));
		
		//입금액, 입금여부 업데이트
		int cnt1 = new tbl_paymentDAO().updatePayment3(vo);
		
		if (cnt1 > 0) {
			System.out.println("입금 업데이트 성공!");
		} else {
			System.out.println("입금 업데이트 실패ㅜ");
		}
		
		// share테이블 업데이트완료. 참조하는 참석자 테이블은 안바꿔져도 되지 않난...?
		// pk,fk 참조 조건 다 해제시켜셔 자동으로 못 읽음
		
		//만약 3명 모두 입금이라면
		
		List<tbl_payment> payList = new tbl_paymentDAO().selectPaymentPar(board_seq);
		int cnt =0;
		for(tbl_payment p :payList) {
			if(p.getPAY_TF().equals("입금완료")) cnt++;
		}
		if(cnt == totalPar) {
			String url="newUpdateCon?board_seq="+board_seq+"&article_state=거래중";
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
			
			
		}else {
		
		response.sendRedirect("payState2.jsp");
		}
	}

}

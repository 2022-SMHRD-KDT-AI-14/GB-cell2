package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;
import com.smhrd.model.tbl_payment;
import com.smhrd.model.tbl_paymentDAO;

/**
 * Servlet implementation class checkPay
 */
public class checkPay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		/* DB상태 모두 입금시 거래상태변화 */
		List<tbl_payment>  list =null; 
		List<tbl_payment>list2 =null; 
		ArrayList<Integer> nList = new ArrayList<Integer>();
		
		tbl_paymentDAO dao = new tbl_paymentDAO();
	
		String cat_name =null;
		ShareDAO dao2 = new ShareDAO();
		list = dao.payComplete();//결과 게시글 별 카운트 수 리트
		System.out.println("제발..");
		for(tbl_payment p : list) {
			BigDecimal board_seq = p.getBOARD_SEQ();
			cat_name = dao2.selectOne(board_seq.intValue()).getCat_name();
			BigDecimal compPar = p.getPAY_MONEY();
			list2 = dao.selectPaymentPar(board_seq.intValue());
			BigDecimal unPar = new BigDecimal(list2.size());
			
			
			System.out.println("board_seq >> "+board_seq);
			System.out.println("참가수 >> "+unPar);
			System.out.println("입금한 사람 수 >> "+compPar);
			if(compPar.intValue() == unPar.intValue() ) {	// 입금대기에서 거래중으로 상태변화
				System.out.println("동일 하잖아 !? ");
				System.out.println("포워딩해야지~");
				nList.add(board_seq.intValue());
			}
			
		}
		request.setAttribute("bList", nList);
		request.setAttribute("state", "입금대기");
		RequestDispatcher rd = request.getRequestDispatcher("updateStateConp");
		rd.forward(request, response);
		
			
		
		
		
	}


}

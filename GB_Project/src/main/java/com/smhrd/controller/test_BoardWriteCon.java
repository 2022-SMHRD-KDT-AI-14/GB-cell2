package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.tbl_account_applicant;
import com.smhrd.model.tbl_applicantDAO;
import com.smhrd.model.tbl_arbeit_applicant;
import com.smhrd.model.tbl_buy_applicant;
import com.smhrd.model.tbl_free_applicant;
import com.smhrd.model.tbl_paymentDAO;
import com.smhrd.model.tbl_share;
import com.smhrd.model.tbl_shareDAO;

public class test_BoardWriteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

request.setCharacterEncoding("UTF-8");
		
		//세션 - id
		HttpSession session = request.getSession();
		String MEM_ID = (String)session.getAttribute("loginMember");
		
		
		//파일이 저장될 서버의 경로 지정
		System.out.println("서버의경로1? >> "+request.getServletContext().getContextPath());
		System.out.println("서버의경로2? >> "+request.getServletContext().getRealPath("/"));
		/* String saveDir = request.getServletContext().getRealPath("img"); */
		 String saveDir = request.getServletContext().getRealPath("img"); 
		
		
		
		//파일의 최대크기 15MB
		int maxSize = 1024*1024*15;
		//인코딩방식
		String encoding ="UTF-8";
		
		//파일, 글제목, 컨텐츠 //파일이름중복방지함수~
		MultipartRequest multi =  new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String name = multi.getParameter("name");
		System.out.println(name);
		
			
			String filename =  URLEncoder.encode(multi.getFilesystemName("filename"), "UTF-8");
	
		
		String content = multi.getParameter("content");
		String cate = multi.getParameter("radio");
		
		String buylink = multi.getParameter("buylink");
		String buypay2 = multi.getParameter("buypay");
		String idlink = multi.getParameter("idlink");
		String idtime = multi.getParameter("idtime");
		String idpay2 = multi.getParameter("idpay");
		String arbeittime = multi.getParameter("arbeittime");
		String arbeitsite = multi.getParameter("arbeitsite");
		String arbeitpay2 = multi.getParameter("arbeitpay");
		
		if(cate.equals("4")) {
			int buypay = Integer.parseInt(buypay2);
			
			tbl_share tbl_share = new tbl_share(name,content,MEM_ID,filename,"0","N","모집중","B");
			
			System.out.println("test_BoardWriteCon, tbl_share id >> "+tbl_share.getMEM_ID());
			tbl_buy_applicant tbl_buy_applicant = new tbl_buy_applicant(MEM_ID,"모집중","W",buylink,buypay,"B");
			
			tbl_shareDAO dao = new tbl_shareDAO();
			tbl_applicantDAO dao2 = new tbl_applicantDAO();
			
			int cnt1 = dao.insertShareBuyBoard(tbl_share);
			int cnt2 = dao2.insertBuyBoardMember(tbl_buy_applicant);
			

			//추가 by성결
			tbl_paymentDAO dao3 = new tbl_paymentDAO();
			int cnt3 =dao3.insertPayment(MEM_ID);
			
			if(cnt3>0) {
				System.out.println("결제테이블 성공");
			}else {
				System.out.println("결제테이블 실패");
			}//추가 by성결
			if(cnt1>0) {
				System.out.println("게시글 테이블 성공");
				
			}else {
				System.out.println("게시글 테이블 실패");
			}
			if(cnt2>0) {
				System.out.println("참석자 테이블 작성");
				
			}else {
				System.out.println("참석자 테이블 실패");
			
			}
			
			response.sendRedirect("tbl_boardBuy.jsp");
			
			
		}else if(cate.equals("2")) {
			
			int idpay = Integer.parseInt(idpay2);
			
			tbl_share tbl_share = new tbl_share(name,content,MEM_ID,filename,"0","N","모집중","I");
			tbl_account_applicant tbl_account_applicant = new tbl_account_applicant(MEM_ID,"모집중","W",idlink,idtime,new BigDecimal(idpay),"I");
			
			tbl_shareDAO dao = new tbl_shareDAO();
			tbl_applicantDAO dao2 = new tbl_applicantDAO();
			
			int cnt1 = dao.insertShareAccountBoard(tbl_share);
			int cnt2 = dao2.insertAccountBoardMember(tbl_account_applicant);
			//추가 by성결
			tbl_paymentDAO dao3 = new tbl_paymentDAO();
			int cnt3 =dao3.insertPayment(MEM_ID);
			
			if(cnt3>0) {
				System.out.println("결제테이블 성공");
			}else {
				System.out.println("결제테이블 실패");
			}//추가 by성결
			
			if(cnt1>0) {
				System.out.println("작성성공1");
				
			}else {
				System.out.println("작성실패1");
				
			}
			if(cnt2>0) {
				System.out.println("작성성공2");
				
			}else {
				System.out.println("작성실패2");
			}
			response.sendRedirect("tbl_boardId.jsp");
			
		}else if(cate.equals("3")) {
			
			int arbeitpay = Integer.parseInt(arbeitpay2);
			
			tbl_share tbl_share = new tbl_share(name,content,MEM_ID,filename,"0","N","모집중","A");
			tbl_arbeit_applicant tbl_arbeit_applicant = new tbl_arbeit_applicant(MEM_ID,"모집중","W",arbeittime, arbeitsite,new BigDecimal(arbeitpay) ,"A");
			
			tbl_shareDAO dao = new tbl_shareDAO();
			tbl_applicantDAO dao2 = new tbl_applicantDAO();
			
			
			int cnt1 = dao.insertShareArbeitBoard(tbl_share);
			int cnt2 = dao2.insertArbeitBoardMember(tbl_arbeit_applicant);
			
			//추가 by성결
			tbl_paymentDAO dao3 = new tbl_paymentDAO();
			int cnt3 =dao3.insertPayment(MEM_ID);
			
			if(cnt3>0) {
				System.out.println("결제테이블 성공");
			}else {
				System.out.println("결제테이블 실패");
			}//추가 by성결
			if(cnt1>0) {
				System.out.println("게시글 테이블 성공");
				
			}else {
				System.out.println("게시글 테이블 실패");
			}
			if(cnt2>0) {
				System.out.println("참석자 테이블 작성");
				
			}else {
				System.out.println("참석자 테이블 실패");
			
			}
			
			response.sendRedirect("tbl_boardArbeit.jsp");
			
		}else {
			
			tbl_share tbl_share = new tbl_share(name,content,MEM_ID,filename,"0","N","모집중","A");
			tbl_free_applicant tbl_free_applicant = new tbl_free_applicant(MEM_ID,"모집중","W","F");
			
			tbl_shareDAO dao = new tbl_shareDAO();
			tbl_applicantDAO dao2 = new tbl_applicantDAO();
			
			int cnt1 = dao.insertShareFreeBoard(tbl_share);
			int cnt2 = dao2.insertFreeBoardMember(tbl_free_applicant);
			
			//추가 by성결
			tbl_paymentDAO dao3 = new tbl_paymentDAO();
			int cnt3 =dao3.insertPayment(MEM_ID);
			
			if(cnt3>0) {
				System.out.println("결제테이블 성공");
			}else {
				System.out.println("결제테이블 실패");
			}//추가 by성결
			
			
			if(cnt1>0) {
				System.out.println("작성성공1");
				
			}else {
				System.out.println("작성실패1");
				
			}
			if(cnt2>0) {
				System.out.println("작성성공2");
				
			}else {
				System.out.println("작성실패2");
			}
			
			
			response.sendRedirect("tbl_boardFree.jsp");
		
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}// 서비스 메소드
	
}

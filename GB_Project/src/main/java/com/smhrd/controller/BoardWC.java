package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.Member;

public class BoardWC extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		//세션 - id
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("loginMember");
		
		
		//파일이 저장될 서버의 경로 지정
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
		String cate = multi.getParameter("cate");
		
		String buylink = multi.getParameter("buylink");
		String buypay2 = multi.getParameter("buypay");
		String idlink = multi.getParameter("idlink");
		String idtime = multi.getParameter("idtime");
		String idpay2 = multi.getParameter("idpay");
		String arbeittime = multi.getParameter("arbeittime");
		String arbeitsite = multi.getParameter("arbeitsite");
		String arbeitpay2 = multi.getParameter("arbeitpay");
		
	
	
		
		
		
		if(cate.equals("a")) {
			int buypay = Integer.parseInt(buypay2);
			Board boardVO = new Board(name, writer, filename, content,buypay,buylink);
			BoardDAO dao = new BoardDAO();
			int cnt1 = dao.insertBuyBoard(boardVO);
			int cnt2 = dao.insertBuyBoardMember(boardVO);
			if(cnt1>0) {
				System.out.println("작성성공1");
				response.sendRedirect("boardBuy.jsp");
			}else {
				System.out.println("작성실패1");
				response.sendRedirect("boardBuy.jsp");
			}
			if(cnt2>0) {
				System.out.println("작성성공2");
				
			}else {
				System.out.println("작성실패2");
				
			
			
			
		}
		
		}else if(cate.equals("b")) {
			
			int idpay = Integer.parseInt(idpay2);
			
			Board boardVO = new Board(name, writer, filename, content,idlink,idtime,idpay);
			BoardDAO dao = new BoardDAO();
			int cnt1 = dao.insertIdBoard(boardVO);
			int cnt2 = dao.insertIdBoardMember(boardVO);
			if(cnt1>0) {
				System.out.println("작성성공1");
				response.sendRedirect("boardId.jsp");
			}else {
				System.out.println("작성실패1");
				response.sendRedirect("boardId.jsp");
			}
			if(cnt2>0) {
				System.out.println("작성성공2");
				
			}else {
				System.out.println("작성실패2");
				
			
			
			
		}
			
			
			
			
			
		}else if(cate.equals("c")) {
			
			int arbeitpay = Integer.parseInt(arbeitpay2);
			
			Board boardVO = new Board(name, writer, filename, content,"n",arbeittime,arbeitsite,arbeitpay);
			BoardDAO dao = new BoardDAO();
			int cnt1 = dao.insertArbeitBoard(boardVO);
			int cnt2 = dao.insertArbeitBoardMember(boardVO);
			if(cnt1>0) {
				System.out.println("작성성공1");
				response.sendRedirect("boardArbeit.jsp");
			}else {
				System.out.println("작성실패1");
				response.sendRedirect("boardArbeit.jsp");
			}
			if(cnt2>0) {
				System.out.println("작성성공2");
				
			}else {
				System.out.println("작성실패2");
			}
			
			
			
			
			
		
		
	}else {
		
		
		Board boardVO = new Board(name, writer, filename, content);
		BoardDAO dao = new BoardDAO();
		int cnt1 = dao.insertFreeBoard(boardVO);
		int cnt2 = dao.insertFreeBoardMember(boardVO);
		if(cnt1>0) {
			System.out.println("작성성공1");
			response.sendRedirect("boardFree.jsp");
		}else {
			System.out.println("작성실패1");
			response.sendRedirect("boardFree.jsp");
		}
		if(cnt2>0) {
			System.out.println("작성성공2");
			
		}else {
			System.out.println("작성실패2");
		}
		
		
		
	
	}
	}

}


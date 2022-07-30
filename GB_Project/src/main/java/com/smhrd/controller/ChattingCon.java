package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.ChattingDAO;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.tbl_share;
import com.smhrd.model.tbl_shareDAO;

public class ChattingCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	
		
		ChattingDAO dao = new ChattingDAO();
		
		int chatnum = dao.selectchat(1);
		
		
		if(chatnum>0) {
			System.out.println("번호저장 성공");
			HttpSession session = request.getSession();
			if(20>=chatnum) {
				chatnum+=1;
			session.setAttribute("chatnum", chatnum);
			}else {
				chatnum-=20;
			session.setAttribute("chatnum", chatnum);	
			}
			
		}else{
			System.out.println("번호저장 실패");
		}
		System.out.println(chatnum);	
		int cnt = dao.updatechat(chatnum);
		if(cnt>0) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
		response.sendRedirect("chatting.jsp");
		
	}
	}



package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;
import com.smhrd.model.myPagePW;
import com.smhrd.model.myPagePWDAO;

public class myPagePWCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginMember");
		String pw = request.getParameter("pw"); //jps에서 바꿔야할 값
		myPagePW vo = new myPagePW(id,pw);
		myPagePWDAO dao = new myPagePWDAO();
		int cnt =  dao.updateMyPagePW(vo);
	
		if(cnt>0) {
							System.out.println("비밀번호 수정 성공");
							// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
							RequestDispatcher rd = request.getRequestDispatcher("tbl_main.jsp");
							
							request.setAttribute("pw", vo.getMEM_PW());
							rd.forward(request, response);
							
							// 다른방법: 리다이렉팅, 쿼리스트링
							//response.sendRedirect("main.jsp?email=email");
						
						}else {
							System.out.println("비밀번호수정 실패");
							// 포워딩 방식 joinSuccess.jsp이동, email->request영역에 저장
							response.sendRedirect("tbl_main.jsp");
						}
			}
			
			
			
		}
	


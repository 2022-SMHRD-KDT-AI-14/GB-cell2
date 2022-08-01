package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MyPageMemarea;
import com.smhrd.model.MyPageMemareaDAO;
import com.smhrd.model.tbl_coordinate;
import com.smhrd.model.tbl_coordinateDAO;


public class MyPageMemareaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String MEM_AREA = request.getParameter("MEM_AREA");
		String MEM_ID = (String)session.getAttribute("loginMember");
		float xCOORDINATE = Float.parseFloat(request.getParameter("MEM_xCOORDINATE"));
		float yCOORDINATE = Float.parseFloat(request.getParameter("MEM_yCOORDINATE"));
		int ixCOORDINATE = (int)xCOORDINATE;
		int iyCOORDINATE = (int)yCOORDINATE;		
				
		System.out.println(ixCOORDINATE);
		System.out.println(iyCOORDINATE);
		
		
		
		MyPageMemarea vo = new MyPageMemarea(MEM_ID, MEM_AREA);
		MyPageMemareaDAO dao = new MyPageMemareaDAO(); //전달자로부터받은정보를가지고 기능을 구현하는 클래스
		int cnt= dao.updateMyPageMemarea(vo);
		
		
		tbl_coordinate vo2 = new tbl_coordinate(MEM_ID,ixCOORDINATE,iyCOORDINATE);
		tbl_coordinateDAO dao2 = new tbl_coordinateDAO();
		
		int cnt2 = dao2.updatecoordinate(vo2);
		
		if(cnt>0) {//주소 저장 성공
			System.out.println("희망배송지 저장 성공");
			session.setAttribute("MEM_AREA", MEM_AREA);
			session.setAttribute("MEM_ID", MEM_ID);
			
		}else {//주소 저장 실패
			System.out.println("희망배송지 저장 실패");
	}

		response.sendRedirect("tbl_main.jsp");

		
		if(cnt2>0) {//주소 저장 성공
			System.out.println("희망배송지 위도경도 저장 성공");
			
			
		}else {//주소 저장 실패
			System.out.println("희망배송지 위도경도 저장 실패");
	}
		
		response.sendRedirect("myPage.jsp");


	}
}

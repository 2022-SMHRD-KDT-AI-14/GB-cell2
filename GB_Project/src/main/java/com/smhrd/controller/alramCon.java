package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.BuyApplicantDAO;
import com.smhrd.model.Share;
import com.smhrd.model.ShareDAO;

/**
 * Servlet implementation class alramCon
 */
public class alramCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//작성자가 아닌경우 실행
		
		
		String board_seq = request.getParameter("board_seq");
		HttpSession session = request.getSession();
		String loginMember = (String) session.getAttribute("loginMember");
//		new ShareDAO().selectAllMyAlramList((String)session.getAttribute("loginMember"));
		System.out.println("alramCon id >> " + loginMember);
		ShareDAO dao = new ShareDAO();
		List<Share> list = dao.selectAllMyAlramList(loginMember);
		response.setCharacterEncoding("UTF-8"); // 응답데이터인코딩
		PrintWriter out = response.getWriter(); // 서버와 클라이언트 연결해주는통로
		if (list.size() > 0) { 
			for (Share s : list) {
				//if(!(s.getMem_id().equals(loginMember) & s.getArticle_state().equals("모집중"))) {
				//}
					out.println("\n"+ s.getMem_id()+"님의 "+ s.getBoard_seq() + "번글 거래결정!!\n입금해주세요😊");
			}
		} else { // 댓글작성실패 동기방식: 다른페이지로 이동/비동기통신: 원래페이지의 일부분만 변경
			// out.print("fail");
			System.out.println("alramCon, 입금알람 받을 리스트없음");
		}
	}

}

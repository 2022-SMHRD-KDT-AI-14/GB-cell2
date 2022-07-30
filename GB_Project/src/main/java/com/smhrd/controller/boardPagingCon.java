package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.tbl_share;
import com.smhrd.model.tbl_shareDAO;

public class boardPagingCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		tbl_shareDAO dao = new tbl_shareDAO();
		List<tbl_share> list =  dao.selectAllListPage(num);
		System.out.println(num);
		System.out.println(list.size());
		System.out.println(list.get(0).toString());
		System.out.println(list.get(0).getCAT_NAME());
		/* 자바객체를 json형태로 바꿔주는 라이브러리 사용 */
		JsonObject json = new JsonObject(); //json객체
		JsonArray jarray = new JsonArray(); //json Array
	
		
		BigDecimal n = new BigDecimal("2");
		for(tbl_share b: list) {
			if(b.getCAT_NAME().equals("I")) {
			json.addProperty("num",b.getBOARD_SEQ().divide(n,4,BigDecimal.ROUND_DOWN));
			json.addProperty("name", b.getARTICLE_TITLE());
			json.addProperty("writer", b.getMEM_ID());
			json.addProperty("category", b.getCAT_NAME());
			
			jarray.add(json);
			json =new JsonObject();
			}
		}
		
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jarray);
	
	
	}

}

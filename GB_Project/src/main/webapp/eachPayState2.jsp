<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ShareDAO"%>
<%@page import="com.smhrd.model.Confirmation"%>
<%@page import="com.smhrd.model.ConfirmationDAO"%>
<%@page import="com.smhrd.model.shareCompleteDAO"%>
<%@page import="com.smhrd.model.BuyApplicantDAO"%>
<%@page import="com.smhrd.model.AppToPayDAO"%>
<%@page import="com.smhrd.model.AppToPay"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.smhrd.model.tbl_paymentDAO"%>
<%@page import="com.smhrd.model.tbl_payment"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>eachstate</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<!-- 스크립틀릿 안쓰려고 지금 이작업 하는거임..JSP파일 안에서 변수 선언하는 태그 임. id는 변수명 -->
<!-- JSTL에서 변수를 선언하는 기능 var변수명 value값,값에다가EL표기법으로 아까 위에 선언한 변수를 넣는다 -->
<!-- param.num url에 있는 파라미터중에서 num이라는 값을 불러오겠다.. 저기서 선언한 변수는 자바변수가 아니다.EL로 불러오기가능 -->


<body class="is-preload">
<%
	int board_seq =Integer.parseInt(request.getParameter("board_seq"));
	String loginMember = (String)session.getAttribute("loginMember");
	BigDecimal price = new BuyApplicantDAO().selectOnePar2(loginMember,board_seq).getBuy_pay();
	
	
	String title = new ShareDAO().selectOne(board_seq).getArticle_title();
	String imgsrc = new ShareDAO().selectOne(board_seq).getArticle_file();
	String category = new ShareDAO().selectOne(board_seq).getCat_name();
	String state= new ShareDAO().selectOne(board_seq).getArticle_state();
	int totalPar = new tbl_paymentDAO().selectPaymentPar(board_seq).size();
	List<tbl_payment> list = new tbl_paymentDAO().selectPaymentPar(board_seq);
	int paymentTFcnt = new tbl_paymentDAO().selectPaymentTFcnt(board_seq);
	
%>
<div id="main">
<div  class="inner">
			
			
			
			
			<section>
					<div class="row">
						<div class="col-6 col-12-small">
									<img src="img/<%=imgsrc %>" width="400px"
										height="300px">
						</div>
						<div class="col-6 col-12-small">
							
							<header id="header">
								
								<a href="boardView.jsp?num=<%=board_seq/2%>"><h2><%=title %>
								<%if(state.equals("거래확정")){ %>
								(이미확정된거래입니다) 
								<%}%></h2></a>
							</header>
							<br>
							<h3 >모집상태: <%=state %></h3>
							<h3 > 카테고리:<%=category %></h3>
							<h3 >구매가격: <%=price %></h3>
							<h3 >총참여자수: <%=totalPar %></h3>
			
			</div></section>
	
	<table class="alt" border=1 >
	<tr>
	<th>아이디</th> <th>입금여부</th> <th>입금현황</th> <th>1/n금액</th> <th>거래확정여부</th>
	</tr>
	<%
	for(tbl_payment p:list){	
	%>
	<tr>
	<td><%=p.getMEM_ID() %></td>
	<td><%=p.getPAY_TF() %></td>
	<td><%=p.getPAY_MONEY() %>원 입금!</td>
	<td><%=price.intValue()/totalPar %></td>
	<td><%=p.getCAT_NAME() %></td>
	</tr>
	<%}%>
	</table>
	<p> 입금률 : <%= paymentTFcnt%>명/ <%=totalPar %>명 =<%=(100*paymentTFcnt/totalPar) %>%</p>
	</div>
	</section>
	</div></div>
</body>
</html>
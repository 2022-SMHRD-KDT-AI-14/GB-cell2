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
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ=="
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style>
body {
	background-image: url('asset/img/bg.jpg');
	padding-left: 200px;
	padding-right: 200px;
	font-family: 'Do Hyeon', sans-serif;
}

.card-body {
	background-color: whitesmoke;
}

p {
	padding-top: 5px;
	padding-left: 20px;
	font-size: 30px;
}


</style>
</head>
<!-- 스크립틀릿 안쓰려고 지금 이작업 하는거임..JSP파일 안에서 변수 선언하는 태그 임. id는 변수명 -->
<!-- JSTL에서 변수를 선언하는 기능 var변수명 value값,값에다가EL표기법으로 아까 위에 선언한 변수를 넣는다 -->
<!-- param.num url에 있는 파라미터중에서 num이라는 값을 불러오겠다.. 저기서 선언한 변수는 자바변수가 아니다.EL로 불러오기가능 -->


<body>

<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO"/>
<c:set var="board" value="${BoardDAO.selectOne(param.board_seq)}"/>

<jsp:useBean id="BuyApplicantDAO" class="com.smhrd.model.BuyApplicantDAO"/>
<c:set var="buyer2" value="${BuyApplicantDAO.selectOnePar2(loginMember,param.board_seq)}"/>

<jsp:useBean id="tbl_arbeit_applicantDAO" class="com.smhrd.model.tbl_arbeit_applicantDAO"/>
<c:set var="arbeit2" value="${tbl_arbeit_applicantDAO.selectOnePar2(loginMember,param.board_seq)}"/>

<jsp:useBean id="tbl_account_applicantDAO" class="com.smhrd.model.tbl_account_applicantDAO"/>
<c:set var="account2" value="${tbl_account_applicantDAO.selectOnePar2(loginMember,param.board_seq)}"/>

<jsp:useBean id="tbl_free_applicantDAO" class="com.smhrd.model.tbl_free_applicantDAO"/>
<c:set var="free2" value="${tbl_free_applicantDAO.selectOnePar2(loginMember,param.board_seq)}"/>


<c:set var="buyerCNT" value="${BuyApplicantDAO.SelectBuyApplicantCNT(param.board_seq)}"/>

<jsp:useBean id="tbl_paymentDAO" class="com.smhrd.model.tbl_paymentDAO"/>
<c:set var="payment" value="${tbl_paymentDAO.selectPayment2(loginMember,param.board_seq)}"/>
<c:set var="paymentPar" value="${tbl_paymentDAO.selectPaymentPar(param.board_seq)}"/>
<c:set var="paymentTFcnt" value="${tbl_paymentDAO.selectPaymentTFcnt(param.board_seq)}"/>

<%
int num = Integer.parseInt(request.getParameter("board_seq"));
int number=num/2;

String board_seq = (String)request.getParameter("board_seq");
String id = (String)session.getAttribute("loginMember");
int cnt = 0;

BuyApplicantDAO a = new BuyApplicantDAO();
int b = a.SelectBuyApplicantCNT(num);

Confirmation voo = new Confirmation(id,num);

String state = new ConfirmationDAO().selectConfirm(voo);
%>


			<div>							
			<c:choose>
		 			<c:when test ="${board.CAT_NAME eq'B'}">
		 			
						<p>구매가격: ${buyer2.buy_pay} 원</p>
						<p>총 참여수: <c:out value="${paymentPar.size()}" /></p>
						<p><table>
						<tr>
											<th><h1><c:out value="아이디"/>ㅤ </h1></th>
											<th><h1><c:out value="입금여부"/>ㅤ </h1></th>
											<th><h1><c:out value="입금현황"/>ㅤ </h1></th>
											<th><h1><c:out value="1/n 금액"/>ㅤ </h1></th>
						</tr>
						<c:forEach items="${paymentPar}" var="m">
										<tr>
											<td><h3><c:out value="${m.MEM_ID}님	"/>	</h3></td>
											<td><h3><c:out value="${m.PAY_TF}"/>	</h3></td>
											<td><h3>
										<c:choose>
										<c:when test="${m.PAY_TF=='입금완료'}">
											<c:out value="${buyer2.buy_pay/buyerCNT}원 입금"/>
											<%cnt+=1; %>
										</c:when>
										<c:otherwise>
											<c:out value="${m.PAY_MONEY}원 입금"/>
										</c:otherwise>
										</c:choose>
											</h3></td>
											 <td><h3><c:out value="${buyer2.buy_pay/buyerCNT} 원"/>	</h3></td>	
											 
											<c:if test ="${loginMember == m.MEM_ID}"> 
											
											<td>	
											<!--<a href="paymentAPI.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}"><button>입금하기</button></a>  -->
											<a href="AppToPay?board_seq=<%=board_seq%>">입금</a>
																			
											</td>
											</c:if>
										</tr>
						</c:forEach>
						</table>
						<p>
						<p>입금률 : <c:out value=" ${paymentTFcnt}/${paymentPar.size()} = " /><c:out value="${(paymentTFcnt/paymentPar.size())*100}"/>%</p>
						</c:when> 
				
					<c:when test ="${board.CAT_NAME eq'A'}">
<<<<<<< HEAD
					<h1>결제상태: ${arbeit2.ARB_P_STATE} , <a href='boardView.jsp?num=${param.board_seq}/2'>해당글 보러가기</a></h1>
=======
				
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-AI-14/GB-cell2.git
					<p>알바수당: ${arbeit2.ARBEIT_PAY} 원</p>
					<p>총 참여수: <c:out value="${paymentPar.size()}" /></p>
					<p><table>
					<tr>
										<th><h1><c:out value="아이디"/>ㅤ </h1></th>
										<th><h1><c:out value="입금여부"/>ㅤ </h1></th>
										<th><h1><c:out value="입금현황"/>ㅤ </h1></th>
										<th><h1><c:out value="1/n 금액"/>ㅤ </h1></th>
					</tr>
					<c:forEach items="${paymentPar}" var="m">
									<tr>
										<td><h3><c:out value="${m.MEM_ID}님	"/>	</h3></td>
										<td><h3><c:out value="${m.PAY_TF}"/>	</h3></td>
										
										<td><h3>
										<c:choose>
										<c:when test="${m.PAY_TF=='입금완료'}">
											<c:out value="${arbeit2.ARBEIT_PAY/paymentPar.size()}원 입금"/>
											<%cnt+=1; %>
										</c:when>
										<c:otherwise>
											<c:out value="${m.PAY_MONEY}원 입금"/>
										</c:otherwise>
										</c:choose>
											</h3></td>
											
										 <td><h3><c:out value="${arbeit2.ARBEIT_PAY/paymentPar.size()} 원"/>	</h3></td>	
										 
										<c:if test ="${loginMember == m.MEM_ID}">
										
										<td>	
										<a href="AppToPay?board_seq=<%=board_seq%>">입금</a>
																		
										</td>
										</c:if>
									</tr>
					</c:forEach></table>
					<p>
					<p>입금률 : <c:out value=" ${paymentTFcnt}/${paymentPar.size()} = " /><c:out value="${(paymentTFcnt/paymentPar.size())*100}"/>%</p>
					<%-- <p>입금률 : <c:out value=" ${paymentTFcnt}/${buyerCNT} = " /><fmt:formatNumber value="${(paymentTFcnt/buyerCNT)*100}" pattern=".00"/>%</p> --%>
					</c:when> 
				<c:when test ="${board.CAT_NAME eq'I'}">
					
					<p>구매가격: ${account2.ID_PAY} 원</p>
					<p>총 참여수: <c:out value="${paymentPar.size()}" /></p>
					<p><table>
					<tr>
										<th><h1><c:out value="아이디"/>ㅤ </h1></th>
										<th><h1><c:out value="입금여부"/>ㅤ </h1></th>
										<th><h1><c:out value="입금현황"/>ㅤ </h1></th>
										<th><h1><c:out value="1/n 금액"/>ㅤ </h1></th>
					</tr>
					<c:forEach items="${paymentPar}" var="m">
									<tr>
										<td><h3><c:out value="${m.MEM_ID}님	"/>	</h3></td>
										<td><h3><c:out value="${m.PAY_TF}"/>	</h3></td>
										<td><h3>
										<c:choose>
										<c:when test="${m.PAY_TF=='입금완료'}">
											<c:out value="${account2.ID_PAY/paymentPar.size()}원 입금"/>
											<%cnt+=1; %>
										</c:when>
										<c:otherwise>
											<c:out value="${m.PAY_MONEY}원 입금"/>
										</c:otherwise>
										</c:choose>
											</h3></td>
										 <td><h3><c:out value="${account2.ID_PAY/paymentPar.size()} 원"/>	</h3></td>	
										 
										<c:if test ="${loginMember == m.MEM_ID}"> //입금여부 미입금 
										
										<td>	
										<a href="AppToPay?board_seq=<%=board_seq%>">입금</a>
																		
										</td>
										</c:if>
									</tr>
					</c:forEach>
					</table>
					<p>
					
					<p>입금률 : <c:out value=" ${paymentTFcnt}/${paymentPar.size()} = " /><c:out value="${(paymentTFcnt/paymentPar.size())*100}"/>%</p>
				</c:when>
				<c:otherwise>
					<h1> 모집상태: ${free2.FREE_P_STATE} , <a href='boardView.jsp?num=<%=number%>'>해당글 보러가기</a></h1>
				</c:otherwise>
		</c:choose>
		</div>
		<div  id = "top">
		
		
			 			<%if(cnt==b){ %>
						<h1>결제상태: 결제완료 , <a href='boardView.jsp?num=<%=number%>'>해당글 보러가기</a></h1>
						<%
						new shareCompleteDAO().Complete(num);
						%>
						<%
						
						if(state!=null){%>
						<a href="#">구매확정완료</a>
						<%}else{
						%>
						<a href="ConfirmationCon?board_seq=<%=board_seq%>">구매확정</a>
						
							
						<%} %>
						<%}else{ %>
						<h1>결제상태: 결제미완료 , <a href='boardView.jsp?num=<%=number%>'>해당글 보러가기</a></h1>
						<%} %>
		</div>
		
		<%if(cnt==b){ %>
		<script>
   
    	alert(${board.BOARD_SEQ}+"번 게시글 전원 거래확정 \n 반환금을 신청해주세요")
    	
    
</script>
		
		
	<%} %>	
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
	function payment({
		
	      	$.ajax({
	      		url : "AppToPay",
	      		type: 'post',
				data:{"board_seq": ${board_seq}},
				success : {
					alert("입금성공")
				},
				error :{
					alert("통신실패")
				}
	      	})
	})
	
	</script>
</body>
</body>
</html>
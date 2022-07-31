<%@page import="java.math.BigDecimal"%>
<%@page import="com.smhrd.model.tbl_paymentDAO"%>
<%@page import="com.smhrd.model.tbl_payment"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
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
<!-- ��ũ��Ʋ�� �Ⱦ����� ���� ���۾� �ϴ°���..JSP���� �ȿ��� ���� �����ϴ� �±� ��. id�� ������ -->
<!-- JSTL���� ������ �����ϴ� ��� var������ value��,�����ٰ�ELǥ������� �Ʊ� ���� ������ ������ �ִ´� -->
<!-- param.num url�� �ִ� �Ķ�����߿��� num�̶�� ���� �ҷ����ڴ�.. ���⼭ ������ ������ �ڹٺ����� �ƴϴ�.EL�� �ҷ����Ⱑ�� -->


<body>

<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO"/>
<c:set var="board" value="${BoardDAO.selectOne(param.board_seq)}"/>

<jsp:useBean id="BuyApplicantDAO" class="com.smhrd.model.BuyApplicantDAO"/>
<c:set var="buyer" value="${BuyApplicantDAO.selectOnePar(loginMember,param.board_seq)}"/>
<c:set var="buyerCNT" value="${BuyApplicantDAO.SelectBuyApplicantCNT(param.board_seq)}"/>

<jsp:useBean id="tbl_paymentDAO" class="com.smhrd.model.tbl_paymentDAO"/>
<c:set var="payment" value="${tbl_paymentDAO.selectPayment2(loginMember,param.board_seq)}"/>
<c:set var="paymentPar" value="${tbl_paymentDAO.selectPaymentPar(param.board_seq)}"/>
<c:set var="paymentTFcnt" value="${tbl_paymentDAO.selectPaymentTFcnt(param.board_seq)}"/>


										
	
		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
			<h1>��������: ${buyer.buy_p_state}</h1>
			<p>������: ${board.ARTICLE_TITLE}		|		�ۼ���: ${board.MEM_ID}		|		�ۼ��� : ${board.ARTICLE_DATE}</p>
			<p>���Ű���: ${buyer.buy_pay}</p>
			<p>���� �Աݿ��� :  <c:out value="${payment.PAY_TF}" /> </p>
			<p>�� ������: <c:out value="${buyerCNT}" /></p>
			
			<th>
								<td><h3><c:out value="���̵�	"/></h3></td>
								<td><h3><c:out value="�Աݿ���	"/></h3></td>
								<td><h3><c:out value="�Աݾ�	"/></h3></td>
							</th>
			<table b>
							<tr>
								<td><h3><c:out value="���̵� ${m.MEM_ID}��	"/></h3></td>
								<td><h3><c:out value="${m.PAY_TF}	"/></h3></td>
								<td><h3><c:out value="${m.PAY_MONEY}�� �Ա�"/></h3></td>
							</tr>
			</table>
			
			<p>�Աݷ� : <c:out value=" ${paymentTFcnt}/${buyerCNT} = " /><fmt:formatNumber value="${(paymentTFcnt/buyerCNT)*100}" pattern=".00"/>%</p>
		</div>
	
	

	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	
</body>
</body>
</html>
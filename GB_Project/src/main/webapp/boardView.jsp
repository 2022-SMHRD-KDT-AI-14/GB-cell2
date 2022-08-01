<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	padding-top: 10px;
	padding-left: 10px;

}

p {
	padding-top: 5px;
	padding-left: 20px;
	font-size: 30px;
}

#date{
	font-size : 15px;
	text-align : right;
}
</style>
</head>
<!-- 占쏙옙크占쏙옙틀占쏙옙 占싫억옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쌜억옙 占싹는곤옙占쏙옙..JSP占쏙옙占쏙옙 占싫울옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占승깍옙 占쏙옙. id占쏙옙 占쏙옙占쏙옙占쏙옙 -->
<!-- JSTL占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙占� var占쏙옙占쏙옙占쏙옙 value占쏙옙,占쏙옙占쏙옙占쌕곤옙EL표占쏙옙占쏙옙占쏙옙占� 占싣깍옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍는댐옙 -->
<!-- param.num url占쏙옙 占쌍댐옙 占식띰옙占쏙옙占쏙옙傷占쏙옙占� num占싱띰옙占� 占쏙옙占쏙옙 占쌀뤄옙占쏙옙占쌘댐옙.. 占쏙옙占썩서 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌘바븝옙占쏙옙占쏙옙 占싣니댐옙.EL占쏙옙 占쌀뤄옙占쏙옙占썩가占쏙옙 -->
<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO"/>
<c:set var="board" value="${BoardDAO.selectOne(param.num*2)}"/>

<jsp:useBean id="WritebuyDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardbuy" value="${WritebuyDAO.selectBuyOne(param.num*2)}"/>

<jsp:useBean id="WriteaccountDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardaccount" value="${WriteaccountDAO.selectAccountOne(param.num*2)}"/>

<jsp:useBean id="WritefreeDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardfree" value="${WritefreeDAO.selectFreeOne(param.num*2)}"/>

<jsp:useBean id="WritearbeitDAO" class="com.smhrd.model.tbl_shareWriteDAO"/>
<c:set var="boardarbeit" value="${WritearbeitDAO.selectArbeitOne(param.num*2)}"/>




<%--<jsp:useBean id="ReplyDAO" class="com.smhrd.model.ReplyDAO"></jsp:useBean> --%>
<%-- <c:set var="replyList" value="${ReplyDAO.selectReply(param.num)}"/> --%>
<body>


<c:out value="${loginMember}님 맞죠?"/>


	<form>

		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
			<p>제목 : ${board.ARTICLE_TITLE}</p>
			<p>작성자 : ${board.MEM_ID}</p>
		
			<p id="date">작성날짜 : ${board.ARTICLE_DATE}</p>
		</div>

	
		
		
			
				
			

			<div class="card-body" style="margin-top: 20px; margin-bottom: 5px;">
				<img src="img/${board.ARTICLE_FILE}" width="auto" height="200px">
				<c:choose>
				<c:when test="${board.CAT_NAME=='B'}">
					<p>구매링크 : ${boardbuy.BUY_LINK}</p>
					<p>구매가격 : ${boardbuy.BUY_PAY}</p>
				</c:when>
				
				<c:when test="${board.CAT_NAME=='A'}">
					<p>알바시간 : ${boardarbeit.ARBEIT_TIME}</p>
					<p>알바장소 : ${boardarbeit.ARBEIT_SITE}</p>
					<p>알바시급 : ${boardarbeit.ARBEIT_PAY}</p>
				</c:when>
				
				<c:when test="${board.CAT_NAME=='I'}">
					<p>계정링크 : ${boardaccount.ID_LINK}</p>
					<p>이용기간 : ${boardaccount.ID_TIME}</p>
					<p>구매가격 : ${boardaccount.ID_PAY}</p>
				</c:when>
				
				<c:otherwise>
				
				</c:otherwise>
				</c:choose>
			</div>
				
			</div>
			
		
		
		
		
		

		
		<!-- 댓글작성 -->
		<div class="card mb-2">
			<!-- 이미지 가운데 자동 정렬  -->
			<%-- <div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
				<p>${board.name}/${board.writer}</p>
				<p id="date">작성일 : ${board.uploadday}</p>
		</div> --%>
			<div class="card-body" ><h6>내용:${board.ARTICLE_CONTENT}</h6></div>
		</div>
	
	</form>
	
	
	<!-- 참여버튼 클릭시 DB저장 -->
	
	<h1>작성자가 아닌자만 참여버튼 나온다!</h1><a href="#"><button style=""><h4>참여결정</h4></button></a>
	<c:if test="${loginMember} != ${board.MEM_ID}">
		<c:if test="${board.CAT_NAME=='B'}">
			<a href="insertStateConb?
			board_seq=${board.BOARD_SEQ}&
			buy_link=${boardbuy.BUY_LINK}&
			buy_pay=${boardbuy.BUY_PAY}&
			cat_name=B">
			<button style=""><h4>참여결정</h4></button></a>
		</c:if>
		<c:if test="${board.CAT_NAME=='A'}">
			<a href="insertStateCona?
			board_seq=${board.BOARD_SEQ}&
			arb_time=${boardarbeit.ARBEIT_TIME}&
			arb_site=${boardarbeit.ARBEIT_SITE}&
			arb_pay=${boardarbeit.ARBEIT_PAY}&
			cat_name=A">
			<button style=""><h4>참여결정</h4></button></a>
		</c:if>
		<c:if test="${board.CAT_NAME=='I'}">
			<a href="insertStateConi?
			board_seq=${board.BOARD_SEQ}&
			acc_link=${boardaccount.ID_LINK}&
			acc_time=${boardaccount.ID_TIME}&
			acc_pay=${boardaccount.ID_PAY}&
			cat_name=I">
			<button style=""><h4>참여결정</h4></button></a>
		</c:if>
		<c:if test="${board.CAT_NAME=='F'}">	
			<a href="insertStateConf?
			board_seq=${board.BOARD_SEQ}&
			cat_name=F">
			<button style=""><h4>참여결정</h4></button></a>
		</c:if>
	</c:if>
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		function addReply() {
		/* 占쏙옙占쏙옙占쏙옙占쏙옙 占쏠갈몌옙占쏙옙占쏙옙 , 占쏙옙크占쏙옙트占싫울옙占쏙옙 el표占쏙옙占� 占쏙옙占쏙옙, 표占쏙옙占쏙옙占쏙옙占쏙옙 占쌘바븝옙占쏙옙占쏙옙占쏙옙占쏙옙占썩가占쏙옙 */
			let ta = $('textarea').val()
				
			$.ajax({
			//占쏙옙청占쏙옙占�
			url: 'ReplyCon',
			//占쏙옙청占쏙옙占쏙옙占쏙옙 (占쌉시뱄옙占쏙옙호, 占쌜쇽옙占쏙옙占�)
			data: {
				'boardnum':${param.num},
				'reply':ta
			},
			//占쏙옙청占쏙옙占�(get,post)
			type:'post',
			success:function(data){ //占쏙옙占쏙옙占� 占쏙옙占쏙옙
				//alert(data) 
				$('#reply').prepend('<li class="list-group-item"><span>'+ta+'/${loginVO.id}</span></li>')
			},
			error :function(){ //占쏙옙占쏙옙占� 占쏙옙占쏙옙
				alert('占쏙옙탐占쏙옙占�')
			}
			
			})
		
		
		}
	</script>	
	
</body>
</body>
</html>
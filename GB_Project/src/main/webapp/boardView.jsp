<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" isELIgnored="false"%>
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
<!-- ï¿½ï¿½Å©ï¿½ï¿½Æ²ï¿½ï¿½ ï¿½È¾ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Û¾ï¿½ ï¿½Ï´Â°ï¿½ï¿½ï¿½..JSPï¿½ï¿½ï¿½ï¿½ ï¿½È¿ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ ï¿½Â±ï¿½ ï¿½ï¿½. idï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ -->
<!-- JSTLï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½Ï´ï¿½ ï¿½ï¿½ï¿½ varï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ valueï¿½ï¿½,ï¿½ï¿½ï¿½ï¿½ï¿½Ù°ï¿½ELÇ¥ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Æ±ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ö´Â´ï¿½ -->
<!-- param.num urlï¿½ï¿½ ï¿½Ö´ï¿½ ï¿½Ä¶ï¿½ï¿½ï¿½ï¿½ï¿½ß¿ï¿½ï¿½ï¿½ numï¿½Ì¶ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Ò·ï¿½ï¿½ï¿½ï¿½Ú´ï¿½.. ï¿½ï¿½ï¿½â¼­ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ú¹Ùºï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Æ´Ï´ï¿½.ELï¿½ï¿½ ï¿½Ò·ï¿½ï¿½ï¿½ï¿½â°¡ï¿½ï¿½ -->
<jsp:useBean id="BoardDAO" class="com.smhrd.model.BoardDAO"/>
<c:set var="board" value="${BoardDAO.selectOne(param.num)}"/>




<%--<jsp:useBean id="ReplyDAO" class="com.smhrd.model.ReplyDAO"></jsp:useBean> --%>
<%-- <c:set var="replyList" value="${ReplyDAO.selectReply(param.num)}"/> --%>
<body>
	<form>
<<<<<<< HEAD
		<div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
			<p>${board.name}/${board.writer}</p>
			<p id="date">ï¿½Û¼ï¿½ï¿½ï¿½ : ${board.uploadday}</p>
=======
		
	<div>
		
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-AI-14/GB-cell2.git
		</div>
<<<<<<< HEAD
	
		<!-- ï¿½ï¿½ï¿½ï¿½Û¼ï¿½ -->
		<div class="card mb-2">
			<div class="card-body">
				<img src="img/${board.filename}">
				<!-- <img src="img/${BoardDAO.selectOne(param.num).filename}"> -->
				<ul class="list-group list-group-flush">
=======
			<div class="card-body" style="margin-top: 20px; margin-bottom: 5px;">
				<img src="img/${board.ARTICLE_FILE}" width="auto" height="200px">
			</div>
				
				<%-- <img src="img/${BoardDAO.selectOne(param.num).filename}"> --%>
				<%-- <ul class="list-group list-group-flush">
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-AI-14/GB-cell2.git
					<li class="list-group-item"><textarea class="form-control"
							id="exampleFormControlTextarea1" rows="3"></textarea>
						<button type="button" class="btn btn-dark mt-3" onclick="addReply()">post reply</button></li>
				</ul>
				<ul class="list-group list-group-flush" id="reply">
					<!-- ï¿½ï¿½ï¿½â¸¦ ï¿½Û¼ï¿½ï¿½Ø¾ï¿½ ï¿½ï¿½ï¿½Î°ï¿½Ä§ï¿½Øµï¿½ ï¿½×´ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ -->
					<c:forEach items="${replyList}" var = "reply">
					<li class="list-group-item"><span>${reply.content}/${reply.writer}</span></li>
					</c:forEach>
					
		
				</ul> --%>
			</div>
			
		<div class="card-body" style="margin-top: 20px; margin-bottom: 5px;">
			<h4>°¡°Ý</h4>
			<h5>»óÇ°¸í</h5>
			<h6 id="date">ÀÛ¼ºÀÏ : ${board.ARTICLE_DATE}</h6>
			<h6>Á¦¸ñ:${board.ARTICLE_TITLE}/³»¿ë:${board.ARTICLE_CONTENT}</h6>
		</div>
		
		
		
		

		
		<!-- ´ñ±ÛÀÛ¼º -->
		<div class="card mb-2">
			<!-- ÀÌ¹ÌÁö °¡¿îµ¥ ÀÚµ¿ Á¤·Ä  -->
			<%-- <div class="card-body" style="margin-top: 100px; margin-bottom: 10px; height: 150px">
				<p>${board.name}/${board.writer}</p>
				<p id="date">ÀÛ¼ºÀÏ : ${board.uploadday}</p>
		</div> --%>
			<div class="card-body" ><h6>ÀÛ¼º¹®±¸<br>»óÇ°»ó¼¼<br>Á¦Ç°È«º¸</h6></div>
		</div>
	
	</form>
	
	
	<!-- Âü¿©¹öÆ° Å¬¸¯½Ã DBÀúÀå -->
	<a href="participateCons">
	<div style="text-align: right;">
	<button style=""><h4>Âü¿©°áÁ¤</h4></button>
	</div>
	</a>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		function addReply() {
		/* ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ò°¥¸ï¿½ï¿½ï¿½ï¿½ï¿½ , ï¿½ï¿½Å©ï¿½ï¿½Æ®ï¿½È¿ï¿½ï¿½ï¿½ elÇ¥ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½, Ç¥ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ú¹Ùºï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½â°¡ï¿½ï¿½ */
			let ta = $('textarea').val()
				
			$.ajax({
			//ï¿½ï¿½Ã»ï¿½ï¿½ï¿½
			url: 'ReplyCon',
			//ï¿½ï¿½Ã»ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ (ï¿½Ô½Ã¹ï¿½ï¿½ï¿½È£, ï¿½Û¼ï¿½ï¿½ï¿½ï¿½)
			data: {
				'boardnum':${param.num},
				'reply':ta
			},
			//ï¿½ï¿½Ã»ï¿½ï¿½ï¿½(get,post)
			type:'post',
			success:function(data){ //ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
				//alert(data) 
				$('#reply').prepend('<li class="list-group-item"><span>'+ta+'/${loginVO.id}</span></li>')
			},
			error :function(){ //ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
				alert('ï¿½ï¿½Å½ï¿½ï¿½ï¿½')
			}
			
			})
		
		
		}
	</script>	
	
</body>
</body>
</html>
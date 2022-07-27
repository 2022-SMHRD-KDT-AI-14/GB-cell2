<%@page import="com.smhrd.model.Share"%>
<%@page import="com.smhrd.model.ShareDAO"%>
<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
    
    
<!doctype html>
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<title>Rage Freebie HTML5 Landing page</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="favicon.ico">

	<!--Google Font link-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">


	<link rel="stylesheet" href="assets/css/slick.css">
	<link rel="stylesheet" href="assets/css/slick-theme.css">
	<link rel="stylesheet" href="assets/css/animate.css">
	<link rel="stylesheet" href="assets/css/fonticons.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/bootstrap.css">
	<link rel="stylesheet" href="assets/css/magnific-popup.css">
	<link rel="stylesheet" href="assets/css/bootsnav.css">


	<!--For Plugins external css-->
	<!--<link rel="stylesheet" href="assets/css/plugins.css" />-->

	<!--Theme custom css -->
	<link rel="stylesheet" href="assets/css/style.css">
	<!--<link rel="stylesheet" href="assets/css/colors/maron.css">-->

	<!--Theme Responsive css-->
	<link rel="stylesheet" href="assets/css/responsive.css" />

	<script src="assets/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
	<!-- JS includes -->
	
	<script src="assets/js/vendor/jquery-1.11.2.min.js"></script>
	<script src="assets/js/vendor/popper.min.js"></script>
	<script src="assets/js/vendor/bootstrap.min.js"></script>
	<script src="assets/js/jquery.magnific-popup.js"></script>
	<script src="assets/js/jquery.easing.1.3.js"></script>
	<script src="assets/js/slick.min.js"></script>
	<script src="assets/js/jquery.collapse.js"></script>
	<script src="assets/js/bootsnav.js"></script>
	
	
	<!-- paradise slider js -->
	
	
	<script src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
	<script src="assets/js/gmaps.min.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="culmn">
		<!--Skill Sections-->
		<section id="skill" class="skill roomy-100">
			<div class="container">
				<div class="row">
					<div class="main_skill">
						<div class="col-md-6">
							<div class="skill_content wow fadeIn">
								<h2>등록한 게시글</h2>
								<div class="separator_left"></div>
								<p>
								
									<jsp:useBean id="ShareDAO" class="com.smhrd.model.ShareDAO" />
									<c:set var="ShareList" value="${ShareDAO.selectAllMyList(loginMember)}" />
					
										<c:if test="${!empty loginMember}">
										<table >
										<th>게시글No.</th><th>제목</th><th>작성자</th><th>거래상태</th>
											<c:forEach items="${ShareList}" var="s"  >
												<tr>
													<td><c:out value="${s.board_seq}" /></td>
													<td><c:out value="${s.article_title}" /></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<c:if test ="${empty s.article_state}">
													<td>
													<a href="test_participateCon?num=${s.board_seq}"><button>거래결정(참여확정)</button></a>
													</td>
													</c:if>
												</tr>
											</c:forEach>
										</table>
										</c:if>
								
									
									<!-- 		<script>
												function payAPI() {
													url: "",
													data:{
														
													}
													
												}
											</script> -->
								
								
								</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="skill_content wow fadeIn">
								<h2>참여한 게시글</h2>
								<div class="separator_left"></div>
						
								<p>
		<h5> @P1참여확정 누른경우 게시글 보임</h5>
		<h5>   (참여확정자 테이블을 통합한게 나으려나?)</h5>
		<h5> @P1(채팅이 안될경우)1자가 거래결정시 : 게시글옆에 알림기능이 표기되고 클릭시 정보확인/브러커중계하기/취소기능화면 </h5>
		<h5> @P2브로커중계하기 누르면 이체API화면
		<h5> @P3이체 결과출력화면 및 배송정보 등</h5>
									<c:set var="nShareList" value="${ShareDAO.selectAllMyParList(loginMember)}" />
					
										<c:if test="${!empty loginMember}">
										<table >
										<th>게시글No.</th><th>제목</th><th>작성자</th><th>거래상태</th>
											<c:forEach items="${nShareList}" var="s"  >
												<tr>
													<td><c:out value="${s.board_seq}" /></td>
													<td><c:out value="${s.article_title}" /></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<c:if test ="${empty s.article_state}">
													<td><button name="btn${s.board_seq}" onclick="payAPI()">거래결정</button></td>
													</c:if>
												</tr>
											</c:forEach>
										</table>
										</c:if>
									
								</p>
						
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
			<br />
			<br />
			<br />
			<hr />
			<br />
			<br />
			<br />
			<div class="container">
				<div class="row">
					<div class="skill_bottom_content text-center">
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>나의 게시글 수</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">4638</h2>
								<div class="separator_small"></div>
								<h5><em>나의 참여한 수</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>거래횟수</em></h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5><em>회원온도</em></h5>
							</div>
						</div>
					</div>
				</div>
				<!--End off row-->
			</div>
			<!--End off container -->
		</section>
		<!--End off Skill section -->
	</div>

	<!-- 버튼클릭하면 jsp->servlet으로 정보전달 
	63번(smart가 작성한))게시글에서 참여확정버튼클릭! -->

	
	<a href="test_participateCon?num=89"><button> 참여확정!</button></a>

</body>

</html>
    
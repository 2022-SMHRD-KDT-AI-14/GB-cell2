<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@page import="com.smhrd.model.MyPage"%>
<%@page import="com.smhrd.model.MyPageDAO"%>
<%@page import="com.smhrd.model.Member"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header id="header">
					<header class="main">
						<h1>배송지수정</h1>
					</header>
				</header>
				<section>


					<form action="MyPageMemareaUpdate">
						<input type="text" id="sample5_address" name="MEM_AREA"
							placeholder="주소 검색을 통해서 입력하세요.">
						<div style='display: none;'>
							<input type="text" id="xCOORDINATE" name="MEM_xCOORDINATE">
							<input type="text" id="yCOORDINATE" name="MEM_yCOORDINATE">
						</div><br>
						<div style="text-align: center;">
						<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"> 
						<input class="button primary" type="submit" value="주소 보내기">
						</div>
					</form>
					<div style="text-align: center;">
					<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
					
					</div>
				</section>
				
				
				
			</div>
		</div>
	</div>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a536dfd72f9eecd78cfcd6c5b7afae8&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		function sample5_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = data.address; // 최종 주소 변수
							// 주소 정보를 해당 필드에 넣는다.
							document.getElementById("sample5_address").value = addr;
							// 주소로 상세 정보를 검색
							geocoder
									.addressSearch(
											data.address,
											function(results, status) {
												// 정상적으로 검색이 완료됐으면
												if (status === daum.maps.services.Status.OK) {
													var result = results[0]; //첫번째 결과의 값을 활용
													// 해당 주소에 대한 좌표를 받아서
													var coords = new daum.maps.LatLng(
															result.y, result.x);
													document
															.getElementById("xCOORDINATE").value = result.x;
													document
															.getElementById("yCOORDINATE").value = result.y;
													console.log("위도 : "
															+ result.y
															+ "경도 : "
															+ result.x)
													// 지도를 보여준다.
													mapContainer.style.display = "block";
													map.relayout();
													// 지도 중심을 변경한다.
													map.setCenter(coords);
													// 마커를 결과값으로 받은 위치로 옮긴다.
													marker.setPosition(coords)
												}
											});
						}
					}).open();
		}
	</script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript"></script>

</body>
</html>
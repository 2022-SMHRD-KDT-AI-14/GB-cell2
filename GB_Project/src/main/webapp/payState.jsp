<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="javax.management.Notification"%>
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
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:400,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">


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


<script
	src="http://maps.google.com/maps/api/js?key=AIzaSyD_tAQD36pKp9v4at5AnpGbvBUsLCOSJx8"></script>
<script src="assets/js/gmaps.min.js"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>



</head>

<body data-spy="scroll" data-target=".navbar-collapse">



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  

  <script> // 작성자의 거래결정 후 참석자의 미입금 상태 알람
    $(window).load(function () { 
    	$.ajax({
		url : 'alramCon',
		type: 'get',
		success : function(data){
			
			if(data)alert("${loginMember}님~ "+data)
			
		},
		error : function(){
			alert("로그인 안함?")
			location.href="tbl_login.jsp";
		}
		})
    });
</script>

<script> //입금모두 되면 조건 변경하여 자동 업데이트
    $(window).load(function () { 
    	$.ajax({
		url : 'checkPay',
		type: 'get',
		success : function(data){
			/* alert(data)	 */		
			
		},
		error : function(){
			alert("통신실패")
		}
		})
    });
</script> 

<script> //게시글테이블 거래상태를 참석자 테이블에도 동기화
 
$(window).load(function () { 
    	$.ajax({
		url : 'ShareToApplicantCon',
		type: 'get',
		success : function(data){
			/* alert(data)	 */		
			
		},
		error : function(){
			alert("왕리스트 통신실패")
		}
		})
    });
</script>







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
										<table>
											<tr>
												<th>게시글No.</th>
												<th>카테고리</th>
												<th>거래현황</th>
												<th>작성자</th>
												<th>거래상태</th>
											</tr>
											<c:forEach items="${ShareList}" var="s">
												<tr>
													<td><c:out value="${s.board_seq}" /></td>
													<td><c:out value="${s.cat_name}" /></td>
													<td><a
														href="eachPayState.jsp?board_seq=${s.board_seq}"><c:out
																value="${s.article_title}" /></a></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<td><c:choose>
															<c:when test="${s.article_state =='모집중'}">
																<a href="updateStateCon?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}" ><button id="decision" onclick="decision()">거래결정</button></a>
																<a href="shareDeleteCon?board_seq=${s.board_seq}"><button>게시판삭제</button></a>
															</c:when>
															<c:when test="${s.article_state =='입금대기'}">
																
																<script>
																
																</script>
																<a href="paymentAPI.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}"><button>입금하기</button></a>
																<a href="#"><button>거래취소</button></a>
															</c:when>
															<c:when test="${s.article_state =='거래중'}">
															</c:when>
															<c:otherwise>
																<a href="#"><button>반환신청</button></a>
															</c:otherwise>
														</c:choose></td>
												</tr>
												
												
												
												
												
											</c:forEach>
										</table>
									</c:if>


								</p>
							</div>
						</div>





						<div class="col-md-6">
							<div class="skill_content wow fadeIn">
								<h2>참여한 게시글</h2>
								<div class="separator_left"></div>

								<p>
									<c:set var="nShareListA"	value="${ShareDAO.selectAllMyParListA(loginMember)}" />
									<c:set var="nShareListB"	value="${ShareDAO.selectAllMyParListB(loginMember)}" />
									<c:set var="nShareListF"	value="${ShareDAO.selectAllMyParListF(loginMember)}" />
									<c:set var="nShareListI"	value="${ShareDAO.selectAllMyParListI(loginMember)}" />

									<c:if test="${!empty loginMember}">
										<table>
											<tr>
												<th>게시글No.</th>
												<th>카테고리</th>
												<th>거래현황</th>
												<th>작성자</th>
												<th>거래상태</th>
											</tr>
											<c:forEach items="${nShareListA}" var="s">
												<tr>
													<td><c:out value="${s.board_seq }" /></td>
													<td><c:out value="${s.cat_name }" /></td>
													<td><a
														href="eachPayState.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}"><c:out
																value="${s.article_title}" /></a></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<td><a href="chatting.jsp">채팅방 참여</a></td>
													<td><c:choose>
															<c:when test="${s.article_state =='모집중'}">
															<!-- 가격 변동이 발생하므로 입금하기 하면 안 됨! -->
															</c:when>
															<c:when test="${s.article_state =='입금대기'}">
																<a href="paymentAPI.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}"><button>입금하기</button></a>
																<a href="#"><button>거래취소</button></a>
															</c:when>
															<c:when test="${s.article_state =='거래중'}">
																<a href="#?board_seq=${s.board_seq}"><button>거래확정</button></a>
																<a href="#?board_seq=${s.board_seq}"><button>이의제기</button></a>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
											
											<c:forEach items="${nShareListB}" var="s">
												<tr>
													<td><c:out value="${s.board_seq}" /></td>
													<td><c:out value="${s.cat_name }" /></td>
													<td><a
														href="eachPayState.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}"><c:out
																value="${s.article_title}" /></a></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<td><a href="chatting.jsp">채팅방 참여</a></td>
													<td><c:choose>
															<c:when test="${s.article_state =='모집중'}">
															<!-- 가격 변동이 발생하므로 입금하기 하면 안 됨! -->
															</c:when>
															<c:when test="${s.article_state =='입금대기'}">
																<a href="paymentAPI.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}"><button>입금하기</button></a>
																<a href="#"><button>거래취소</button></a>
															</c:when>
															<c:when test="${s.article_state =='거래중'}">
																<a href="#?board_seq=${s.board_seq}"><button>거래확정</button></a>
																<a href="#?board_seq=${s.board_seq}"><button>이의제기</button></a>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
											
											<c:forEach items="${nShareListF}" var="s">
												<tr>
													<td><c:out value="${s.board_seq}" /></td>
													<td><c:out value="${s.cat_name }" /></td>
													<td><a
														href="eachPayState.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}"><c:out
																value="${s.article_title}" /></a></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<td><a href="chatting.jsp">채팅방 참여</a></td>
													<td><c:choose>
															<c:when test="${s.article_state =='모집중'}">
															<!-- 가격 변동이 발생하므로 입금하기 하면 안 됨! -->
															</c:when>
															<c:when test="${s.article_state =='입금대기'}">
																<a href="paymentAPI.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}"><button>입금하기</button></a>
																<a href="#"><button>거래취소</button></a>
															</c:when>
															<c:when test="${s.article_state =='거래중'}">
																<a href="#?board_seq=${s.board_seq}"><button>거래확정</button></a>
																<a href="#?board_seq=${s.board_seq}"><button>이의제기</button></a>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>
											
											<c:forEach items="${nShareListI}" var="s">
												<tr>
													<td><c:out value="${s.board_seq}" /></td>
													<td><c:out value="${s.cat_name }" /></td>
													<td><a
														href="eachPayState.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}"><c:out
																value="${s.article_title}" /></a></td>
													<td><c:out value="${s.mem_id}" /></td>
													<td><c:out value="${s.article_state}" /></td>
													<td><a href="chatting.jsp">채팅방 참여</a></td>
													<td><c:choose>
															<c:when test="${s.article_state =='모집중'}">
															<!-- 가격 변동이 발생하므로 입금하기 하면 안 됨! -->
															</c:when>
															<c:when test="${s.article_state =='입금대기'}">
																<a href="paymentAPI.jsp?board_seq=${s.board_seq}&article_state=${s.article_state}&cat_name=${s.cat_name}"><button>입금하기</button></a>
																<a href="#"><button>거래취소</button></a>
															</c:when>
															<c:when test="${s.article_state =='거래중'}">
																<a href="#?board_seq=${s.board_seq}"><button>거래확정</button></a>
																<a href="#?board_seq=${s.board_seq}"><button>이의제기</button></a>
															</c:when>
															<c:otherwise>
															</c:otherwise>
														</c:choose></td>
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
			<br /> <br /> <br />
			<hr />
			<br /> <br /> <br />
			<div class="container">
				<div class="row">
					<div class="skill_bottom_content text-center">
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5>
									<em>나의 게시글 수</em>
								</h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">4638</h2>
								<div class="separator_small"></div>
								<h5>
									<em>나의 참여한 수</em>
								</h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5>
									<em>거래횟수</em>
								</h5>
							</div>
						</div>
						<div class="col-md-3">
							<div class="skill_bottom_item">
								<h2 class="statistic-counter">3468</h2>
								<div class="separator_small"></div>
								<h5>
									<em>회원온도</em>
								</h5>
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
 





	<script>

//listing vars here so they're in the global scope
var cards, nCards, cover, openContent, openContentText, pageIsOpen = false,
    openContentImage, closeContent, windowWidth, windowHeight, currentCard;

// initiate the process
init();

function init() {
  resize();
  selectElements();
  attachListeners();
}

// select all the elements in the DOM that are going to be used
function selectElements() {
  cards = document.getElementsByClassName('card'),
  nCards = cards.length,
  cover = document.getElementById('cover'),
  openContent = document.getElementById('open-content'),
  openContentText = document.getElementById('open-content-text'),
  openContentImage = document.getElementById('open-content-image')
  closeContent = document.getElementById('close-content');
}

/* Attaching three event listeners here:
  - a click event listener for each card
  - a click event listener to the close button
  - a resize event listener on the window
*/
function attachListeners() {
  for (var i = 0; i < nCards; i++) {
    attachListenerToCard(i);
  }
  closeContent.addEventListener('click', onCloseClick);
  window.addEventListener('resize', resize);
}

function attachListenerToCard(i) {
  cards[i].addEventListener('click', function(e) {
    var card = getCardElement(e.target);
    onCardClick(card, i);
  })
}

/* When a card is clicked */
function onCardClick(card, i) {
  // set the current card
  currentCard = card;
  // add the 'clicked' class to the card, so it animates out
  currentCard.className += ' clicked';
  // animate the card 'cover' after a 500ms delay
  setTimeout(function() {animateCoverUp(currentCard)}, 500);
  // animate out the other cards
  animateOtherCards(currentCard, true);
  // add the open class to the page content
  openContent.className += ' open';
}


function animateCoverUp(card) {
  // get the position of the clicked card
  var cardPosition = card.getBoundingClientRect();
  // get the style of the clicked card
  var cardStyle = getComputedStyle(card);
  setCoverPosition(cardPosition);
  setCoverColor(cardStyle);
  scaleCoverToFillWindow(cardPosition);
  // update the content of the opened page
  openContentText.innerHTML = '<h1>'+card.children[2].textContent+'</h1>'+paragraphText;
  openContentImage.src = card.children[1].src;
  setTimeout(function() {
    // update the scroll position to 0 (so it is at the top of the 'opened' page)
    window.scroll(0, 0);
    // set page to open
    pageIsOpen = true;
  }, 300);
}

function animateCoverBack(card) {
  var cardPosition = card.getBoundingClientRect();
  // the original card may be in a different position, because of scrolling, so the cover position needs to be reset before scaling back down
  setCoverPosition(cardPosition);
  scaleCoverToFillWindow(cardPosition);
  // animate scale back to the card size and position
  cover.style.transform = 'scaleX('+1+') scaleY('+1+') translate3d('+(0)+'px, '+(0)+'px, 0px)';
  setTimeout(function() {
    // set content back to empty
    openContentText.innerHTML = '';
    openContentImage.src = '';
    // style the cover to 0x0 so it is hidden
    cover.style.width = '0px';
    cover.style.height = '0px';
    pageIsOpen = false;
    // remove the clicked class so the card animates back in
    currentCard.className = currentCard.className.replace(' clicked', '');
  }, 301);
}

function setCoverPosition(cardPosition) {
  // style the cover so it is in exactly the same position as the card
  cover.style.left = cardPosition.left + 'px';
  cover.style.top = cardPosition.top + 'px';
  cover.style.width = cardPosition.width + 'px';
  cover.style.height = cardPosition.height + 'px';
}

function setCoverColor(cardStyle) {
  // style the cover to be the same color as the card
  cover.style.backgroundColor = cardStyle.backgroundColor;
}

function scaleCoverToFillWindow(cardPosition) {
  // calculate the scale and position for the card to fill the page,
  var scaleX = windowWidth / cardPosition.width;
  var scaleY = windowHeight / cardPosition.height;
  var offsetX = (windowWidth / 2 - cardPosition.width / 2 - cardPosition.left) / scaleX;
  var offsetY = (windowHeight / 2 - cardPosition.height / 2 - cardPosition.top) / scaleY;
  // set the transform on the cover - it will animate because of the transition set on it in the CSS
  cover.style.transform = 'scaleX('+scaleX+') scaleY('+scaleY+') translate3d('+(offsetX)+'px, '+(offsetY)+'px, 0px)';
}

/* When the close is clicked */
function onCloseClick() {
  // remove the open class so the page content animates out
  openContent.className = openContent.className.replace(' open', '');
  // animate the cover back to the original position card and size
  animateCoverBack(currentCard);
  // animate in other cards
  animateOtherCards(currentCard, false);
}

function animateOtherCards(card, out) {
  var delay = 100;
  for (var i = 0; i < nCards; i++) {
    // animate cards on a stagger, 1 each 100ms
    if (cards[i] === card) continue;
    if (out) animateOutCard(cards[i], delay);
    else animateInCard(cards[i], delay);
    delay += 100;
  }
}

// animations on individual cards (by adding/removing card names)
function animateOutCard(card, delay) {
  setTimeout(function() {
    card.className += ' out';
   }, delay);
}

function animateInCard(card, delay) {
  setTimeout(function() {
    card.className = card.className.replace(' out', '');
  }, delay);
}

// this function searches up the DOM tree until it reaches the card element that has been clicked
function getCardElement(el) {
  if (el.className.indexOf('card ') > -1) return el;
  else return getCardElement(el.parentElement);
}

// resize function - records the window width and height
function resize() {
  if (pageIsOpen) {
    // update position of cover
    var cardPosition = currentCard.getBoundingClientRect();
    setCoverPosition(cardPosition);
    scaleCoverToFillWindow(cardPosition);
  }
  windowWidth = window.innerWidth;
  windowHeight = window.innerHeight;
}

var paragraphText = '<p>Somebody once told me the world is gonna roll me. I ain\'t the sharpest tool in the shed. She was looking kind of dumb with her finger and her thumb in the shape of an "L" on her forehead. Well the years start coming and they don\'t stop coming. Fed to the rules and I hit the ground running. Didn\'t make sense not to live for fun. Your brain gets smart but your head gets dumb. So much to do, so much to see. So what\'s wrong with taking the back streets? You\'ll never know if you don\'t go. You\'ll never shine if you don\'t glow.</p><p>Hey now, you\'re an all-star, get your game on, go play. Hey now, you\'re a rock star, get the show on, get paid. And all that glitters is gold. Only shooting stars break the mold.</p><p>It\'s a cool place and they say it gets colder. You\'re bundled up now, wait till you get older. But the meteor men beg to differ. Judging by the hole in the satellite picture. The ice we skate is getting pretty thin. The water\'s getting warm so you might as well swim. My world\'s on fire, how about yours? That\'s the way I like it and I never get bored.</p>';
</script>

	


</body>

</html>

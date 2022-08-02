<%@page import="com.smhrd.model.tbl_share"%>
<%@page import="java.util.Random"%>
<%@page import="com.smhrd.model.tbl_coordinate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.smhrd.model.tbl_coordinateDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>join</title>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">
					<a href="tbl_main.jsp" class="logo"><strong>무언가 나누고 싶어?</strong> 1/N !</a>
					<ul class="icons">
						<li><a href="tbl_login.jsp" class="icon solid fa-lock"><span class="label">Medium</span></a></li>
						<li><a href="#" class="icon solid fa-file-invoice-dollar"><span class="label">Medium</span></a>
						</li>
						<li><a href="tbl_join.jsp" class="icon solid fa-user"><span class="label">Medium</span></a></li>
					</ul>
				</header>

				

				<!-- Content -->
				<section>
					
					<form method="post" action="tbl_join2.jsp">
						<header class="main">
							<h1>회원이 아니신가요?</h1>
						</header>
	
						<span class="image main"><img src="images/pic12.png" alt="" /></span>
						<h2 id="content">무얼 공유 하고 싶으신가요?</h2>
						<p>1/n은 무언가를 공유하는 분들을 위한 공간 입니다. 무엇을 공유하던 당신의 자유 입니다.<br>우리가 공유 할 수 있는 새로운 아이디어를 제시해주세요</p>
	
						<hr class="major" />
	
						<h2>회원가입</h2>
						<h3>개인정보 수집 및 이용 동의 (필수)</h3>
						<div class="col-6 col-12-small">
							<input type="checkbox" id="demo-copy" name="demo-copy">
							<label for="demo-copy">개인정보 수집 및 이용 동의 합니다.</label>
						</div>
						<div style="overflow: scroll; height: 150px; padding: 10px; border: 1px solid #d7a35d;">
							<p>
								개인정보보호법에 따라 1/n에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의
								거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
							</p>
							<p>
								1. 수집하는 개인정보
								이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 1/n 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과
								같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 1/n는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
							</p>
							<p>
								회원가입 시점에 1/n가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
								- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일
								경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소, 프로필
								정보를 수집합니다.
								- 단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
								서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
								1/n 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할
								경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
							</p>
							<p>
								서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서
								이미지나 음성이 수집될 수 있습니다.
								구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나,
								2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
								1/n에서 제공하는 위치기반 서비스에 대해서는 '1/n 위치정보 이용약관'에서 자세하게 규정하고 있습니다.
								이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
							</p>
							<p>
								2. 수집한 개인정보의 이용
								1/n 및 1/n 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를
								이용합니다.
							</p>
							<p>
								- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여
								개인정보를 이용합니다.
								- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인
								및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
								- 법령 및 1/n 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재,
								계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
								- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
								- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
								- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
								- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
							</p>
							<p>
								3. 개인정보의 보관기간
								회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
								단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게
								보관합니다.
							</p>
							<p>
								이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
								- 부정 가입 및 이용 방지
								가입인증 휴대전화번호 또는DI (만14세 미만의 경우 법정대리인DI) : 수집시점으로부터6개월 보관
								탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터6개월 보관
								- QR코드 복구 요청 대응
								QR코드 등록 정보:삭제 시점으로부터6개월 보관
								- 스마트플레이스 분쟁 조정 및 고객문의 대응
								휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
								- 1/n 플러스 멤버십 서비스 혜택 중복 제공 방지
								암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
								전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 1/n는 이 기간
								동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
								- 전자상거래 등에서 소비자 보호에 관한 법률
								계약 또는 청약철회 등에 관한 기록: 5년 보관
								대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
								소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
								- 전자금융거래법
								전자금융에 관한 기록: 5년 보관
								- 통신비밀보호법
								로그인 기록: 3개월
							</p>
							<p>
								참고로 1/n는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.
							</p>
							<p>
								4. 개인정보 수집 및 이용 동의를 거부할 권리
								이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실
								경우, 회원가입이 어려울 수 있습니다.
							</p>
						</div>
						<br>
						<br>
						<br>
	
						<h3>위치정보 이용약관 동의 (필수)</h3>
						<div class="col-6 col-12-small">
							<input type="checkbox" id="demo-human" name="demo-human">
							<label for="demo-human">위치정보 이용약관 동의 합니다.</label>
						</div>
	
						<div style="overflow: scroll; height: 150px; padding: 10px; border: 1px solid #d7a35d;">
							<p>
								위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 1/n 위치기반 서비스를 이용할 수 있습니다.
							</p>
							<p>
								제 1 조 (목적)
								이 약관은 1/n 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타
								필요한 사항을 규정함을 목적으로 합니다.
							</p>
							<p>
								제 2 조 (약관 외 준칙)
								이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등
								관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
							</p>
							<p>
								제 3 조 (서비스 내용 및 요금)
								①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
								1.Geo Tagging 서비스: 게시물에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다.
								2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및
								주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
								3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
								4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
								5.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
								6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
								7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
								8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등
								다양한 운전 및 생활 편의 서비스를 제공합니다.
								②제1항 위치기반서비스의 이용요금은 무료입니다.
							</p>
							<p>
								제 4 조 (개인위치정보주체의 권리)
								①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여
								동의를 유보할 수 있습니다.
								②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
								③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을
								갖추고 있습니다.
								④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는
								정당한 이유 없이 요구를 거절하지 아니합니다.
								1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
								2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
								⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다. 단, 동의의
								일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
								⑥개인위치정보주체는 제1항 내지 제4항 의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
							</p>
							<p>
								제 5 조 (법정대리인의 권리)
								①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
								②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수 있습니다.
							</p>
							<p>
								제 6 조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)
								회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에 자동으로
								기록하며, 6개월 이상 보관합니다.
							</p>
							<p>
								제 7 조 (서비스의 변경 및 중지)
								①회사는 위치정보사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나
								중지할 수 있습니다.
								②제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다.
							</p>
							<p>
								제 8 조 (개인위치정보 제3자 제공시 즉시 통보)
								①회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공 받는 자 및
								제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다.
								②회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자,
								제공일시 및 제공목적을 즉시 통보합니다.
								③다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.
								1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우
								2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우
							</p>
							<p>
								제 9 조 (8세 이하의 아동 등의 보호의무자의 권리)
								①회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는
								제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다.
								1. 8세 이하의 아동
								2. 금치산자
								3. 장애인복지법제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진및직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법
								제29조의 규정에 의하여 장애인등록을 한 자에 한한다)
								② 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을
								첨부하여 회사에 제출하여야 합니다.
								③보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.
							</p>
							<p>
								제 10 조 (손해배상)
								개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수
								있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.
							</p>
							<p>
								제 11 조 (분쟁의 조정)
								① 회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습니다.
								② 회사 또는 개인정보위치 주체는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법에 따라
								개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.
							</p>
						</div>
	
						<table>
	
						</table>
						<div style="text-align: center;">
							<a href="tbl_main.jsp" class="button">메인으로 가기</a>
							<a href="tbl_join2.jsp" class="button primary">회원가입</a></li>
						</div>
					</form>
				</section>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>

			</div>
		</div>




		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<section id="search" class="alt">
					<form method="post" action="#">
						<input type="text" name="query" id="query" placeholder="Search" />
					</form>
				</section>

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>Menu</h2>
					</header>
					<ul>
						<li><a href="tbl_main.jsp">홈페이지</a></li>
						<li><a href="tbl_boardwrite.jsp">글작성</a></li>
						<li>
							<span class="opener">공유하기</span>
							<ul>
                                <li><a href="tbl_boardBuy.jsp">구매 게시판</a></li>
                                <li><a href="tbl_boardId.jsp">계정공유 게시판</a></li>
                                <li><a href="tbl_boardArbeit.jsp">알바 게시판</a></li>
                                <li><a href="tbl_boardFree.jsp">자유 게시판</a></li>
                            </ul>
						</li>
						<li><a href="#">문의하기</a></li>
						

					</ul>
				</nav>
				<!-- Section -->
				<%if(session.getAttribute("MEM_ID")!=null){ 
				
					
						String MEM_ID = (String)session.getAttribute("MEM_ID");
						int MEM_LATITUDE = (int)session.getAttribute("MEM_LATITUDE");
						int MEM_LONGITUDE = (int)session.getAttribute("MEM_LONGITUDE");



						tbl_coordinateDAO dao = new tbl_coordinateDAO();

							ArrayList<String> id = new ArrayList<String>();
							List<tbl_coordinate> tbl_coordinate = dao.selectAllList();
							
							int cnt = 0;
						for(int i = 0 ; i<tbl_coordinate.size();i++){
							if(!tbl_coordinate.get(i).getMEM_ID().equals(MEM_ID)){
							if(tbl_coordinate.get(i).getMEM_LATITUDE()<MEM_LATITUDE+3&&tbl_coordinate.get(i).getMEM_LATITUDE()>MEM_LATITUDE-3
								&&tbl_coordinate.get(i).getMEM_LONGITUDE()<MEM_LONGITUDE+3&&tbl_coordinate.get(i).getMEM_LONGITUDE()>MEM_LONGITUDE-3){
								id.add(cnt, tbl_coordinate.get(i).getMEM_ID());
								cnt++;
							}
							}
						}
						int num1 = 0;
						int num2 = 0;
						int num3 = 0;
						int num11 = 0;
						int num22 = 0;
						int num33 = 0;
						
						  Random r = new Random();
						  if(id.size()>0){
						  num1 = r.nextInt(id.size());
						  num2 = r.nextInt(id.size());
						  num3 = r.nextInt(id.size());
						  }
						  List<tbl_share> list1 = dao.selectListshare(id.get(num1));
						  List<tbl_share> list2 = dao.selectListshare(id.get(num2));
						  List<tbl_share> list3 = dao.selectListshare(id.get(num3));
						  if(list1.size()>0){
						  num11 = r.nextInt(list1.size());
						  }
						  if(list2.size()>0){
						  num22 = r.nextInt(list2.size());
						  }
						  if(list3.size()>0){
						 num33 = r.nextInt(list3.size());
						  }
						  
						  int a = list1.get(num11).getBOARD_SEQ().intValue();
						  int b = list2.get(num22).getBOARD_SEQ().intValue();
						  int c = list3.get(num33).getBOARD_SEQ().intValue();
						  
						 int board_seq1 =a/2;
						  int board_seq2 = b/2;
						  int board_seq3 = c/2;
						  
						  session.setAttribute("board_seq1", board_seq1);
						  session.setAttribute("board_seq2", board_seq2);
						  session.setAttribute("board_seq3", board_seq3);
				
				%>
				
				<section>
					<header class="major">
						<h2>추천상품</h2>
					</header>
					<div class="mini-posts">
						<article>
							<a href="boardView.jsp?num=${board_seq1}" class="image"><img src="images/pic07.jpg" alt="" /></a>
							<p>제목 : <%=list1.get(num11).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list1.get(num11).getMEM_ID() %></p>
							
						</article>
						<article>
							<a href="boardView.jsp?num=${board_seq2}" class="image"><img src="images/pic08.jpg" alt="" /></a>
							<p>제목 : <%=list2.get(num22).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list2.get(num22).getMEM_ID() %></p>
						</article>
						<article>
							<a href="boardView.jsp?num=${board_seq3}" class="image"><img src="images/pic09.jpg" alt="" /></a>
							<p>제목 : <%=list3.get(num33).getARTICLE_TITLE() %></p>
							<p>작성자 : <%=list3.get(num33).getMEM_ID() %></p>
						</article>
					</div>
					<ul class="actions">
						<li><a href="#" class="button">공유참여</a></li>
					</ul>
				</section>
				<%} %>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>문의주세요</h2>
					</header>
					<p>사이트의 이상이 있다면 아래 연락처로 연락 부탁 드립니다</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">이메일</a></li>
						<li class="icon solid fa-phone">연락처</li>
						<li class="icon solid fa-home">주소<br />
							상세주소</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5
							UP</a>.</p>
				</footer>

			</div>
		</div>
	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
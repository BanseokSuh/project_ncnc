<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,
            maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>공지사항</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="../img/logo4.png" />

<!-- 나눔고딕 웹 폰트 적용 -->
<!--<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">

<!-- CSS 참조 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/notice.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
	<div id="container">

		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요 끝-->

		<div class="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>
			<!-- -------------햄버거 메뉴 끝------------ -->

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- -------------최근 본 상품 끝----------- -->

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능 끝-->

			<!----------------notice 화면 시작--------------------->

			<div id="faq-header">
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>공지사항</h2>
			</div>
			<div id="faq-content">
				<!-- 공지사항 아코디언 -->
				<div class="tab-content" id="faq-subtitle">
					<div class="tab-pane fade in active sub-list" id="tab-1">
						<ul>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">니컴내컴 온라인몰 시스템 점검 안내 (5/1)</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>고객님, 안녕하세요. 니컴내컴 온라인몰 입니다.<br> 											
											2020년 5월 1일부로 멤버십 제도가 개편되어 아래와 같이 니컴내컴 온라인몰 시스템 점검 예정 입니다.
											<p>&nbsp;</p>
											▶ 점검시간 : 5/1(금) 00시 ~ 04시 (총 4시간)
											<p>&nbsp;</p>
											해당 점검시간 동안 온라인몰 접속이 어려우니, 점검 종료 후 이용 부탁드립니다.<br>
											멤버십 제도 개편 관련하여 추가 문의사항이 있으시면 1:1 문의하기 또는
											니컴내컴 고객센터(1234-5678)로 문의 시 신속하게 답변 도와드리겠습니다.
											<p>&nbsp;</p>
											항상 노력하는 니컴내컴이 되겠습니다. 감사합니다.
										 </li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">상품 오배송 보상제</a>
								</h3>
								<ul>
									<li>안녕하세요. 니컴내컴 온라인몰 입니다.<br> 주문 상품의 품목 및 수량이 상이하게 배송된
										경우, 배송된 상품 중 불량, 파손, 유통기한 경과 상품이 포함된 경우,<br> 1:1 문의를 통해
										보상 신청해 주시면, 확인 후 3일 이내(영업일 기준) POINT 2,000점 적립으로 보상해 드리고 있습니다.
										<p>&nbsp;</p> <상품 오배송 보상 신청 방법> <br>
										마이페이지 > 1:1문의 > 질문유형 '기타' 선택 > 문의내용에 주문일, 상품 오배송 상태에 대해 입력 >
										등록<br>
										<p>&nbsp;</p>
										*2020년 03월 25일부터 상품 오배송 보상제가 시행되었으며, 이전 주문 건에 대해서는 소급 적용되지
										않습니다. <br>*주문일로부터 10일 이내 접수 건에 한하여 보상 가능합니다. *주문 1건 당 1회에 한하여 보상
										가능합니다. (최대 포인트 2,000점 한도) <br>*증정품 오배송은 보상에서 제외됩니다. <br>*본 보상제는 사전 고지
										없이 변경 또는 종료될 수 있습니다. 
									</li>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title" id="last_notice">
									<a href="#">온라인몰 주문 상품 배송 예정일 안내</a>
								</h3>
								<ul>
									<li>안녕하세요. 니컴내컴 온라인몰 입니다.<br> 온라인몰 주문 상품은 일반적으로 주문일 기준
										평균 3~5일 이내(주말, 공휴일 제외) 배송됩니다.
										<p>&nbsp;</p> *도서산간, 제주 지역의 경우, 주문일 기준 평균 5~7일 이내(주말, 공휴일 제외)<br>
										*브랜드세일 기간 동안 주문 시에는 주문량 폭주로 인해 주문일 기준 평균 5~7일 이내(주말, 공휴일 제외)
										<p>&nbsp;</p> 부득이한 사정으로 상품 출고가 지연되거나 불가능한 경우, 고객센터를 통해 사전 안내
										드리고 있습니다.<br> 상품의 배송 문의는 니컴내컴 고객센터로 문의해 주시기 바랍니다.<br>
										<p>&nbsp;</p> *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시 (주말,
										공휴일 휴무)
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!-- 아코디언 기능 끝 -->
			</div>
		</div>

		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!--고정 footer 끝-->

		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img
				src="${pageContext.request.contextPath}/img/arrow-up2.png"></a>
		</div>
		<!--탑버튼 끝-->

	</div>

	<!-- javascript 참조 -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="../plugins/sweetalert/sweetalert2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/* 아코디언 메뉴 액션 */
			$("#faq-subtitle h3").click(function() {
				$("#faq-subtitle ul ul").slideUp();
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
				}
			});

			/* -----햄버거 사이드 메뉴 열기----  */
			$("#hamburger").click(function() {
				$("#sidenav").css("left", "0");
				$("#side-wrap").addClass("dark")
			});
			$("#sidenav .close-sidenav").click(function() {
				$("#sidenav").css("left", "-80%");
				$("#side-wrap").removeClass("dark");
			});

			/* -----최근 본 상품 사이드 메뉴 열기----  */
			$("#newpro").click(function() {
				$("#sidenav-right").css("right", "0");
				$("#side-wrap2").addClass("dark")
			});
			$("#sidenav-right .close-sidenav").click(function() {
				$("#sidenav-right").css("right", "-80%");
				$("#side-wrap2").removeClass("dark");
			});

			/* ——최근 본 상품 > 휴지통——  */
			$(".latelyItem-ui-wrap").hide();

			$("#sidenav-right .del-pro").click(function() {
				$(".latelyItem-ui-wrap").slideToggle(function() {
					$(".list-latelyItem li .select").show();
				});
			});
		});
		$(function(){
	           $("#keyword").click(function(){
	              location.href="${pageContext.request.contextPath}/search/search.do";
	           });
	        });
	</script>
</body>
</html>
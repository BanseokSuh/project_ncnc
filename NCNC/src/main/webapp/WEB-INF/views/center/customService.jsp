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
<title>고객센터</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">
<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/customService.css">
</head>

<body>
	<div id="container">

		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp" %>
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요 끝-->

		<div class="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp" %>
			<!-- -------------햄버거 메뉴 끝------------ -->

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp" %>
			<!-- -------------최근 본 상품 끝----------- -->

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp" %>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능 끝-->

			<!----------------customService 화면 시작--------------------->
			<div id="cs-header">
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>고객센터</h2>
			</div>
			<div id="cs-content">
				<div class="row" id="cs-faq-header">
					<div class="col-sm-8 col-xs-8">
						<h3 class="text-left">FAQ</h3>
					</div>
					<div class="col-sm-4 col-xs-4 text-right">
						<a href="${pageContext.request.contextPath}/center/faq.do">더보기 &gt;</a>
					</div>
				</div>
				
				<!--FAQ 탭 버튼 영역 - 하지만 누르면 각 페이지로 이동 / 그 페이지에서 탭-->
				<div id="faq-kind" class="clear">
					<ul>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="selected btn-button-item-link">전체</a>
						</li>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">주문/결제</a>
						</li>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">취소/반품</a>
						</li>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">상품/배송</a>
						</li>
						<li class="btn-button-item pull-left clear">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">서비스/<br>회원혜택</a>
						</li>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">쿠폰/<br>이벤트</a>
						</li>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">사이트이용</a>
						</li>
						<li class="btn-button-item pull-left">
							<a href="${pageContext.request.contextPath}/center/faq.do" class="btn-button-item-link">기타</a>
						</li>
					</ul>
				</div>
				<!--FAQ 탭 버튼 영역 - 하지만 누르면 각 페이지로 이동 / 그 페이지에서 탭 끝-->
				
				<!--회색 배경 / 고객센터 전화번호 영업시간 노출-->
				<div id="cs-num-btn" class="clear">
					<h3 class="text-left">고객센터 이용안내</h3>
					<div id="cs-num-btn-inner">
						<div>
							<span id="cs-number">1234-5678</span> <span id="cscenter-time">월
								~ 금 09:00 ~18:00 | 주말/공휴일 휴무</span>
						</div>
					</div>
					<div class="row" id="cs-now-btn">
						<div class="col-sm-6 col-xs-6">
							<a href="${pageContext.request.contextPath}/mypage/cnct.do" class="offbtn2 text-center">1:1문의하기</a>
						</div>
						<div class="col-sm-6 col-xs-6">
							<a href="${pageContext.request.contextPath}/mypage/cnct.do" class="offbtn2 text-center">나의
								문의내역</a>
						</div>
					</div>
				</div>
				<!--공지사항 리스트 / 공지사항 게시품 최신순으로 2개씩 노출-->
				<div id="cs-notice" class="clear">
					<div class="row" id="cs-notice-header">
						<div class="col-sm-8 col-xs-8">
							<h3 class="text-left">공지사항</h3>
						</div>
						<div class="col-sm-4 col-xs-4 text-right">
							<a href="${pageContext.request.contextPath}/center/notice.do">더보기 &gt;</a>
						</div>
					</div>
					<div id="cs-notice-list">
						<ul>
							<li><a href="${pageContext.request.contextPath}/center/notice.do"> <span class="cs-notice-tit">니컴내컴 온라인몰 시스템 점검 안내 (5/1)</span><br> <span class="cs-notice-date">2020-04-29</span>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/center/notice.do"> <span class="cs-notice-tit">상품 오배송 보상제</span><br> <span class="cs-notice-date">2020-03-25</span>
							</a></li>
							<li><a href="${pageContext.request.contextPath}/center/notice.do"> <span class="cs-notice-tit">온라인몰 주문 상품 배송예정일 안내</span><br> <span class="cs-notice-date">2020-01-20</span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp" %>
		<!--고정 footer 끝-->

		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img
				src="${pageContext.request.contextPath}/img/arrow-up2.png"></a>
		</div>
		<!--탑버튼 끝-->
	</div>
	<script type="text/javascript">
		$(function() {
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

			/* -----최근 본 상품 > 휴지통----  */

			$(".latelyItem-ui-wrap").hide();

			$("#sidenav-right .del-pro").click(function() {
				$(".latelyItem-ui-wrap").slideToggle(function() {
					$(".list-latelyItem li .select").show();
				});
			});
			/* `#all_check`의 선택 상태가 변경되었을 때의 이벤트 */
			$("#all_check").change(function() {
				// 모든 `.hobby`의 선택 상태를 `#all_check`와 동일하게 맞춘다.
				$(".del-check").prop('checked', $(this).prop('checked'));
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
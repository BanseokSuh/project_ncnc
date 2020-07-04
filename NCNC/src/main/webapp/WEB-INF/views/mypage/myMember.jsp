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
<title>멤버십 정보</title>
<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
<!--bootstrap-->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<!--구글 웹 폰트 적용-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">
<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">
<!--외부 CSS 파일 참조-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/myMember.css">
</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>
		<div id="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>
			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>


			<!-- ============================================================================================ -->

			<!--각 페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
			<div id="page-header">
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>멤버십 정보</h2>
			</div>
			<div id="page-content">
				<div class="mem-grade">
					<h4>${output.mem_name}
						님의 현재 등급은 <span id="my-grade">FAMILY</span> 입니다.
					</h4>
				</div>
				<div class="mem-p">
					<div class="mem-standard">
						<div>
							<strong>선정기준</strong>
						</div>
						<div>전년도(19년도) 연간 누적 구매 포인트</div>
						<div>
							<h6>
								( 니컴내컴 구매적립 포인트만 해당되며<br> 구매적립이 아닌 이벤트 혹은 행사 추가 적립 포인트는
								포함되지 않습니다.)
							</h6>
						</div>
					</div>
					<div class="mem-bnf">
						<ul>
							<li class="mem-vvip"><span> <img
									src="../img/vvip.png" alt="vvip" />
							</span> <span class="text"> <span class="desc">포인트적립 15% +
										전 품목 무료배송</span>
							</span></li>
							<li class="mem-vip"><span> <img src="../img/vip.png"
									alt="vvip" />
							</span> <span class="text"> <span class="desc">포인트적립 10% +
										전 품목 무료배송</span>
							</span></li>
							<li class="mem-family"><span> <img
									src="../img/family.png" alt="vvip" />
							</span> <span class="text"> <span class="desc">포인트적립 5% +
										전 품목 무료배송</span>
							</span></li>
						</ul>
					</div>
				</div>
				<!-- //mem-p-->
			</div>
			<!-- //page-content-->
		</div>
		<!-- //content-->
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
	</div>
	<!-- //container-->
	<!--Javascript-->
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/* -----햄버거 사이드 메뉴 열기---- */
			$("#hamburger").click(function() {
				$("#sidenav").css("left", "0");
				$("#side-wrap").addClass("dark");
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

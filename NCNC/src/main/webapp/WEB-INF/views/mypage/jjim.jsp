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
<link
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<title>찜 리스트</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/img/apple-touch-icon-144-logo3.png" />
<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/nanumfont.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jjim.css" />
<!-- swal 알림창 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>
		<!-- 하단 고정 메뉴 -->
		<%@ include file="../inc/fixed.jsp"%>
		<!-- 햄버거 메뉴 -->
		<%@ include file="../inc/hamMenu.jsp"%>
		<!-- -------------최근 본 상품 시작------------ -->
		<%@ include file="../inc/recentItem.jsp"%>
		<!-- -------------최근 본 상품 끝----------- -->

		<!-- ================================================================================================== -->

		<c:choose>
			<c:when test="${output_count == 0}">
				<!-- 헤더 -->
				<div id="private-header">
					<button type="button" class="btn-back"
						onclick="history.back(); return false;">뒤로가기</button>
					<h2>찜 리스트</h2>
				</div>
				<!-- end헤더 -->
				<!-- 소내용 / 전체삭제 -->
				<div class="jjim-body">
					<button type="button" id="deleteall">전체삭제</button>
					전체<span> 0</span>개<br />
				</div>

				<div>
					<div>
						<br> <br> <br> <br> <br>
						<h4>찜한 상품이 없습니다.</h4>
						<br> <br> <br> <br> <br>
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<!-- 헤더 -->
				<div id="private-header">
					<button type="button" class="btn-back"
						onclick="history.back(); return false;">뒤로가기</button>
					<h2>찜 리스트</h2>
				</div>
				<!-- end헤더 -->
				<!-- 소내용 / 전체삭제 -->
				<div class="jjim-body">
					<form method="get"
						action="${pageContext.request.contextPath}/mypage/jjim_delete.do">
						<button type="submit" id="deleteall">전체삭제</button>
						전체<span>${output_count}</span>개
					</form>
				</div>
				<!-- end 소내용 / 전체삭제 -->
				<div id="jjim-content">
					<!-- 찜리스트 -->
					<div id="jjim-list">
						<ul>
							<c:forEach var="output" items="${output}" varStatus="status">
								<li>
									<div class="list-thumbnail top-area">
										<span class="img-area"
											style="background-image:url(${output.origin_name})"></span>
									</div>
									<div class="list-desc">
										<a
											href="${pageContext.request.contextPath}/mypage/jjim_deleteOne.do?cart_no=${output.cart_no}" id="jjim-delete">&times;</a>
										<p class="list-brand">${output.item_brand}</p>
										<p class="list-product-name">${output.item_name}</p>
										<p class="list-product-desc">${output.item_cpu}/${output.item_ram}G/${output.item_ssd}GB</p>
										<p class="list-product-price">
											<fmt:formatNumber pattern="###,###,###"
												value="${output.item_price}" />
											원
										</p>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
					<!-- end 찜리스트 -->
				</div>
			</c:otherwise>
		</c:choose>

		<div id="content">
			<%@ include file="../inc/footer.jsp"%>
		</div>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
	</div>
	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>
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
		});

		/* 전체삭제 */
		$(function() {
			$("#deleteall").click(function() {
				Swal.fire({
					title : "전체삭제 하시겠습니까?",
					text : "찜리스트에 있는 모든 상품이 삭제됩니다.",
					showCancelButton : true,
					confirmButtonColor : '#620080',
					cancelButtonColor : '#888',
					confirmButtonText : '확인',
					cancelButtonText : '닫기',
					reverseButtons : true,
				}).then(function(result) {
					if (result.value) {
						location.href = "";
					}
				});
			});
		})

		/* 선택삭제 */
		$(function() {
			$(".btn-cls").click(function() {
				Swal.fire({
					title : "삭제 하시겠습니까?",
					text : "선택한 상품이 목록에서 삭제됩니다.",
					showCancelButton : true,
					confirmButtonColor : '#620080',
					cancelButtonColor : '#888',
					confirmButtonText : '확인',
					cancelButtonText : '닫기',
					reverseButtons : true,
				}).then(function(result) {
					if (result.value) {
						location.href = "";
					}
				});
			});
		})
	</script>
</body>
</html>
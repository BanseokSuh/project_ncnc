<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>퀵메뉴 베스트</title>
<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />
<!--bootstrap-->
<link rel="stylesheet" type="text/css"
	href="../assets/css/bootstrap.min.css">
<!--나눔고딕 웹 폰트 적용-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/nanumfont.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/qBest.css" />
<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">
<!-- handlebar plugin -->
<script
	src="${pageContext.request.contextPath}/plugins/handlebars/handlebars-v4.0.5.js"></script>

<style>
.more-view {
	text-align: center;
}

.more-view img {
	width: 15px;
}
</style>
</head>

</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>
		<div id="quick-menu" class="text-center clear">
			<!--탭 기능-->
			<ul>
				<li class="pull-left text-center"><a
					href="${pageContext.request.contextPath}/home.do">홈</a></li>
				<li class="pull-left text-center"><a
					href="${pageContext.request.contextPath}/qmenu/qPrdList.do"
					>노트북</a></li>
				<li class="pull-left text-center"><a
					href="${pageContext.request.contextPath}/qmenu/qNews.do">뉴스</a></li>
				<li class="pull-left text-center"><a
					href="${pageContext.request.contextPath}/qmenu/qBest.do" 
					class="atvthis">베스트</a></li>
				<!--<li class="pull-left text-center">
                        <a href="../SBS/qResell.html">중고거래</a>
                    </li> 추후구현-->
				<li class="pull-left text-center"><a
					href="${pageContext.request.contextPath}/qmenu/qEvent.do">이벤트</a></li>
			</ul>
			<!--탭 기능 끝-->
		</div>
		<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
		<%@ include file="../inc/fixed.jsp"%>
		<!-- 햄버거 메뉴 -->
		<%@ include file="../inc/hamMenu.jsp"%>

		<!-- -------------햄버거 메뉴 끝------------ -->
		<!-- -------------최근 본 상품 시작------------ -->
		<%@ include file="../inc/recentItem.jsp"%>

		<!-- -------------최근 본 상품 끝----------- -->
		<div id="qpro-content">
			<div id="qpro-header">
				<h2>니컴 베스트</h2>
			</div>
			<div id="q-pr-list">
				<!--대학생/비즈니스/게이밍/디자인/초경량/그래픽 대분류 탭버튼-->

				<!--인기순/최신순/높은가격/낮은가격 중분류 탭 버튼-->
				<div id="main-best-category">
					<div class="tab" id="tab-btn">
						<ul class="nav nav-tabs" id="tab-ul">
							<li class="pull-left active text-center"><a
								href="#main-best-list-all" data-toggle="tab">판매순</a></li>
							<li class="pull-left text-center"><a
								href="#main-best-list-month" data-toggle="tab">리뷰순</a></li>
						</ul>
					</div>
					<!--내용영역-->
					<div id="best-content-list" class="tab-content thum-list-comm">
						<div id="main-best-list-all" class="tab-pane fade in active">
							<ul>
								<c:choose>
									<c:when test="${output == null || fn:length(output) == 0}">
										<!-- 조회결과없습니다. -->
									</c:when>

									<c:otherwise>
										<c:forEach var="item" items="${output}" varStatus="status">
											<c:set var="name" value="${item.item_name}" />

											<c:url value="/item/prdDetail.do" var="viewUrl">
												<c:param name="item_no" value="${item.item_no}" />
											</c:url>


											<li class="pull-left"><a href="${viewUrl}">
											 <span class="top-area"> 
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
													</span>
													 
													 
													 
													 <span class="best-pro-num"> </span>

													

												</span> <span class="bottom-area"> <span class="pro-brand">[<span
															class="ro-brand-title">${item.item_brand}</span>]
													</span> <span class="pro-title">${item.item_name}</span> <span
														class="pro-price"> <span class="per">${item.item_discount}%</span>
															<span class="price"> <span class="pre-price"><fmt:formatNumber
																		pattern="###,###,###" value="${item.item_price}" /></span> <fmt:formatNumber
																	pattern="###,###,###" value="${item.item_payment}" />
																<span class="won">원</span>
														</span>
													</span>
												</span>


											</a></li>

										</c:forEach>

									</c:otherwise>


								</c:choose>


							</ul>

							<!--  -->


						</div>

						<div id="main-best-list-month" class="tab-pane fade in clear">
							<ul>
								<c:choose>
									<c:when test="${output1 == null || fn:length(output) == 0}">
										<!-- 조회결과없습니다. -->
									</c:when>

									<c:otherwise>
										<c:forEach var="item" items="${output1}" varStatus="status">
											<c:set var="name" value="${item.item_name}" />

											<c:url value="/item/prdDetail.do" var="viewUrl">
												<c:param name="item_no" value="${item.item_no}" />
											</c:url>


											<li class="pull-left"><a href="${viewUrl}"> <span
													class="top-area">
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
													 <span class="best-pro-num"> 
														</span>
													</span>
												</span> <span class="bottom-area"> <span class="pro-brand">[<span
															class="ro-brand-title">${item.item_brand}</span>]
													</span> <span class="pro-title">${item.item_name}</span> <span
														class="pro-price"> <span class="per">${item.item_discount}%</span>
															<span class="price"> <span class="pre-price"><fmt:formatNumber
																		pattern="###,###,###" value="${item.item_price}" /></span> <fmt:formatNumber
																	pattern="###,###,###" value="${item.item_payment}" />
																<span class="won">원</span>
														</span>
													</span>
												</span>
											</a></li>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</ul>
							<!--  -->

						</div>


					</div>
				</div>
			</div>
		</div>
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!-- Javascript -->
		<script
			src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<!-- Swiper JS -->
		<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$("#keyword")
						.click(
								function() {
									location.href = "${pageContext.request.contextPath}/search/search.do";
								});
			});
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

				$(".more-view>a").click(function() {
					get_list();

				});

			});
		
		</script>
	</div>

</body>
</html>

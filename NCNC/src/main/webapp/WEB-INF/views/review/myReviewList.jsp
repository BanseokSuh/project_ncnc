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
<title>구매후기</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/myReviewList.css">
</head>

<body>
	<div id="container">
		<%@ include file="../inc/head.jsp" %>
		<div id="private-header">
			<button type="button" class="btn-back"
				onclick="history.back();return false;">뒤로가기</button>
			<h2>구매후기</h2>
		</div>
		<div class="tab" id="tab-btn">
			<ul class="nav nav-tabs" id="tab-ul">
				<li class="pull-left active"><a
					href="#review-write"
					data-toggle="tab">상품평쓰기</a></li>
				<li class="pull-left"><a
					href="#review-list"
					data-toggle="tab">작성한상품평</a></li>
			</ul>
		</div>
		<div id="myReviewList-inner" class="tab-content">
			<%@ include file="../inc/hamMenu.jsp" %>
			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp" %>
			<!-- -------------최근 본 상품 끝----------- -->
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp" %>
			<!-- ============================================================================== -->
			<div id="review-write" class="tab-pane fade in active">
				<ul>
				<c:choose>
					<c:when test="${fn:length(ordout) == 0 }">
						<p style="padding:15px;text-align:center;"> <br/><br/>구매한 상품이 없습니다.<br/><br/> </p>
					</c:when>
					<c:otherwise>
					<c:forEach var="ordout" items="${ordout}" varStatus="status">
						<li id="writeReview">
							<div class="list-thumbnail left-area">
								<span class="img-area" style="background-image: url(${ordout.origin_name})"></span>
							</div>
							<div class="list-desc">
								<p class="list-brand">[${ordout.item_brand}]</p>
								<p class="list-product-name">${ordout.item_name}</p>
								<p class="list-product-desc">${ordout.item_cpu}/${ordout.item_ram}G/${ordout.item_ssd}GB</p>
								<p class="list-product-price">
									<fmt:formatNumber pattern="###,###,###"
										value="${ordout.item_price}" />
									원
								</p>
								<div class="write-review-link">
									<a
										href="${pageContext.request.contextPath}/review/write.do?ord_no=${ordout.ord_no}">구매후기
										작성</a>
								</div>
							</div>
						</li>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					<!-- <li>
						<div class="list-thumbnail">
							<img src="../img/02.jpg">
						</div>
						<div class="list-desc">
							<p class="list-brand">[LG]</p>
							<p class="list-product-name">LG그램2020</p>
							<p class="list-product-desc">Intel i5-10210U/ 1.6GHz/ DDR4/
								8G/ NVMe SSD/ 256GB</p>
							<p class="list-product-price">1,110,000원</p>
							<div class="write-review-link">
								<a href="../KE/writeReview.html">구매후기 작성</a>
							</div>
						</div>
					</li>
					<li>
						<div class="list-thumbnail">
							<img src="../img/10.jpg">
						</div>
						<div class="list-desc">
							<p class="list-brand">[LG]</p>
							<p class="list-product-name">LG그램2020</p>
							<p class="list-product-desc">Intel i5-10210U/ 1.6GHz/ DDR4/
								8G/ NVMe SSD/ 256GB</p>
							<p class="list-product-price">1,110,000원</p>
							<div class="write-review-link">
								<a href="../KE/writeReview.html">구매후기 작성</a>
							</div>
						</div>
					</li> -->
				</ul>
			</div>
			<div id="review-list" class="tab-pane fade in">
				<c:choose>
					<c:when test="${fn:length(memput) == 0 }">
						<p style="padding:15px;text-align:center;"> <br/><br/>리뷰등록한 상품이 없습니다.<br/><br/> </p>
					</c:when>
					<c:otherwise>
						<div class="accordian-menu">
					<nav id="accordian">
						<ul>
							<c:forEach var="memput" items="${memput}" varStatus="status">
							<li id="myReviewList">
								<a >
									<div class="list-thumbnail left-area">
										<span class="img-area" style="background-image: url(${memput.origin_name})"></span>
									</div>
									<div class="reviewed-list-desc">
										<p class="list-brand">${memput.item_brand}</p>
										<p class="list-product-name">${memput.item_name}</p>
										<p class="list-product-desc">${memput.item_cpu}/${memput.item_ram}G/${memput.item_ssd}GB</p>
										<p class="list-product-price">
											<fmt:formatNumber pattern="###,###,###"
												value="${memput.item_price}" />
											원
										</p>
									</div>
									<div class="review-arrow">
										<img src="${pageContext.request.contextPath}/img/arrow-down.png"
											data-over="${pageContext.request.contextPath}/img/arrow-up.png" class="change-img">
									</div>
								</a>
								<ul>
									<li>
										<div class="review-content">
											<div class="review-product-img top-area">
												<span class="img-area review" style="background-image: url(${memput.origin_name})"></span>
											</div>
											<div class="review-product-desc">
												<p class="review-product-price"><fmt:formatNumber pattern="###,###,###"
												value="${memput.item_price}" />
											원</p>
												<p class="review-product-option">${memput.item_cpu}/${memput.item_ram}G/${memput.item_ssd}GB</p>
												<p class="review-text">${memput.rev_contents}</p>
												<div class="review-delete">
													<a href="${pageContext.request.contextPath}/review/reviewDelete.do?rev_no=${memput.rev_no}" class="review-cal">삭제</a>
												</div>
											</div>
										</div>
									</li>
								</ul>
								</li>
							</c:forEach>
						</ul>
					</nav>
				</div>
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
		<%@ include file="../inc/footer.jsp" %>
	</div>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js">
		
	</script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		/* 아코디언 메뉴 액션 */
		$(function() {
			$("#accordian a").click(function() {
				var temp = $(this).find(".change-img").attr('src');
				var over = $(this).find(".change-img").data('over');
				$(this).find(".change-img").attr('src', over);
				$(this).find(".change-img").data('over', temp);
				$("#accordian ul ul").slideUp();
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
				}
			})
			/* -----햄버거 사이드 메뉴 열기---- */

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
		$(function(){
	           $("#keyword").click(function(){
	              location.href="${pageContext.request.contextPath}/search/search.do";
	           });
	        });
	</script>
</body>
</html>
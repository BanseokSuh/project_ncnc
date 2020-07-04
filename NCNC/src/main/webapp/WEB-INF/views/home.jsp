<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0,  maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Bootstrap -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />

<!-- 가격 구분 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">

<!--외부 파일 참조-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />

<!--중고거래 스와이프 폴러그인-->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<title>니컴내컴</title>

</head>

<body>
	<div id="container">

		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="inc/head.jsp"%>

		<div id="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="inc/hamMenu.jsp"%>
			<!-- -------------햄버거 메뉴 끝------------ -->

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="inc/recentItem.jsp"%>
			<!-- -------------최근 본 상품 끝----------- -->

			<!--메인 퀵메뉴/ 햄버거 상품목록페이지에서는 숨기기 / 스크롤을 밑으로 내릴때 헤더는 사라지고 퀵메뉴만 노출 -->
			<div id="quick-menu" class="text-center clear">
				<!--탭 기능-->
				<ul>
					<li class="pull-left text-center"><a href="${pageContext.request.contextPath}/home.do">홈</a></li>
					<li class="pull-left text-center"><a href="${pageContext.request.contextPath}/qmenu/qPrdList.do">노트북</a></li>
					<li class="pull-left text-center"><a href="${pageContext.request.contextPath}/qmenu/qNews.do">뉴스</a></li>
					<li class="pull-left text-center"><a href="${pageContext.request.contextPath}/qmenu/qBest.do">베스트</a></li>
					<li class="pull-left text-center"><a href="${pageContext.request.contextPath}/qmenu/qEvent.do">이벤트</a></li>
				</ul>
				<!--탭 기능 끝-->
			</div>
			<!--메인 퀵메뉴/ 햄버거 상품목록페이지에서는 숨기기 / 스크롤을 밑으로 내릴때 헤더는 사라지고 퀵메뉴만 노출 끝-->

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<div id="fixed-q-menu">
				<ul>
					<li><a href="#" id="hamburger" class="show_hide"><img src="${pageContext.request.contextPath}/img/menu.png"></a></li>
					<li><a href="${pageContext.request.contextPath}/qmenu/qEvent.do"><img src="${pageContext.request.contextPath}/img/event.png"></a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/myPage.do"><img src="${pageContext.request.contextPath}/img/mypage.png"></a></li>
					<li><a href="${pageContext.request.contextPath}/mypage/jjim.do"><img src="${pageContext.request.contextPath}/img/jjim.png"></a></li>
					<li><a href="#" id="newpro"><img src="${pageContext.request.contextPath}/img/chronometer.png"></a></li>
				</ul>
			</div>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능 끝-->

			<!----------------home 화면 시작--------------------->

			<!--메인 슬라이드 이미지들 / 스와이프 효과 시작-->
			<div id="main-slide-section">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:forEach var="event" items="${eventout}" varStatus="status">
							<%-- 상세페이지로 이동하기 위한 URL --%>
							<c:url value="/qmenu/eventDetail.do" var="viewUrl">
								<c:param name="doc_no" value="${event.doc_no}" />
							</c:url>
							<div class="swiper-slide">
								<a href="${viewUrl}"><img src="${pageContext.request.contextPath}/img/${event.origin_name}" alt="이벤트 이미지"></a>
							</div>
						</c:forEach>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<!--메인 슬라이드 이미지들 / 스와이프 효과 끝-->
			<!-- 이동 버튼 -->

			<!----------------니컴 뉴스 --------------------->
			<div id="main-event" class="clear">
				<div id="event-title">
					<h3>니컴 IT뉴스</h3>
				</div>
				<div id="event-inner">
					<c:forEach var="news" items="${newsout}" varStatus="status">
						<%-- 상세페이지로 이동하기 위한 URL --%>
						<c:url value="/qmenu/newsDetail.do" var="viewUrl">
							<c:param name="doc_no" value="${news.doc_no}" />
						</c:url>
						<div class="pull-left">
							<a href="${viewUrl}"><img src="${pageContext.request.contextPath}/img/${news.origin_name}" alt="뉴스 이미지">
							<span class="main-event-text">${news.doc_title}</span></a>
						</div>
					</c:forEach>
				</div>
			</div>

			<!----------------니컴 베스트 --------------------->
			<div id="main-best" class="clear">
				<div id="best-title">
					<h3>니컴 베스트</h3>
				</div>
				<div id="main-best-category">
					<!--탭 메뉴-->
					<div class="tab" id="tab-btn">
						<ul class="nav nav-tabs" id="tab-ul">
							<li class="pull-left active text-center"><a href="#main-best-list-all" data-toggle="tab">인기순</a></li>
							<li class="pull-left text-center"><a href="#main-best-list-design" data-toggle="tab">최신순</a></li>
							<li class="pull-left text-center"><a href="#main-best-list-business" data-toggle="tab">높은가격</a></li>
							<li class="pull-left text-center"><a href="#main-best-list-gaming" data-toggle="tab">낮은가격</a></li>
						</ul>
					</div>
					<!--탭 메뉴 끝-->

					<!--내용영역-->
					<div id="best-content-list" class="tab-content thum-list-comm">
						<div id="main-best-list-all" class="tab-pane fade in active">
							<ul class="best-list">
								<c:forEach var="hot" items="${besthot}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${hot.item_no}" />
									</c:url>
									<li class="pull-left">
										<a href="${viewUrl}">
											<span class="top-area">
												<span class="img-area" style="background-image: url(${hot.origin_name})"></span>
												<span class="best-pro-num"></span>
											</span>
											<span class="bottom-area">
												<span class="pro-brand">[<span class="ro-brand-title">${hot.item_brand}</span>]</span>
												<span class="pro-title">${hot.item_name}</span>
												<span class="pro-price">
													<span class="per">${hot.item_discount}%</span>
													<span class="price">
														<span class="pre-price"><fmt:formatNumber pattern="###,###,###" value="${hot.item_price}"/></span>
														<fmt:formatNumber pattern="###,###,###" value="${hot.item_payment}"/><span class="won">원</span>
													</span>
												</span>
											</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!----------------베스트 영역 최신순 시작--------------------->
						<div id="main-best-list-design" class="tab-pane fade in">
							<ul class="best-list">
								<c:forEach var="new1" items="${bestnew}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${new1.item_no}" />
									</c:url>
									<li class="pull-left">
										<a href="${viewUrl}">
											<span class="top-area">
												<span class="img-area" style="background-image: url(${new1.origin_name})">
													<span class="best-pro-num"></span>
												</span>
											</span>
											<span class="bottom-area">
												<span class="pro-brand">[<span class="ro-brand-title">${new1.item_brand}</span>]</span>
												<span class="pro-title">${new1.item_name}</span>
												<span class="pro-price">
													<span class="per">${new1.item_discount}%</span>
													<span class="price">
														<span class="pre-price"><fmt:formatNumber pattern="###,###,###" value="${new1.item_price}" /></span>
														<fmt:formatNumber pattern="###,###,###" value="${new1.item_payment}" />
														<span class="won">원</span>
													</span>
												</span>
											</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!---------------베스트 영역 높은가격 시작------------------->
						<div id="main-best-list-business" class="tab-pane fade in">
							<ul class="best-list">
								<c:forEach var="high" items="${besthigh}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${high.item_no}" />
									</c:url>
									<li class="pull-left">
										<a href="${viewUrl}">
											<span class="top-area">
												<span class="img-area" style="background-image: url(${high.origin_name})">
													<span class="best-pro-num"></span>
												</span>
											</span>
											<span class="bottom-area">
												<span class="pro-brand">[<span class="ro-brand-title">${high.item_brand}</span>]</span>
												<span class="pro-title">${high.item_name}</span>
												<span class="pro-price">
													<span class="per">${high.item_discount}%</span>
													<span class="price">
														<span class="pre-price"><fmt:formatNumber pattern="###,###,###" value="${high.item_price}" /></span>
														<fmt:formatNumber pattern="###,###,###" value="${high.item_payment}" />
														<span class="won">원</span>
													</span>
												</span>
											</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>

						<!---------------베스트 영역 낮은가격 시작------------------->
						<div id="main-best-list-gaming" class="tab-pane fade in">
							<ul class="best-list">
								<c:forEach var="low" items="${bestlow}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${low.item_no}" />
									</c:url>
									<li class="pull-left">
										<a href="${viewUrl}">
											<span class="top-area">
												<span class="img-area" style="background-image: url(${low.origin_name})">
													<span class="best-pro-num"></span>
												</span>
											</span>
											<span class="bottom-area">
												<span class="pro-brand">[<span class="ro-brand-title">${low.item_brand}</span>]</span> 
												<span class="pro-title">${low.item_name}</span>
												<span class="pro-price">
													<span class="per">${low.item_discount}%</span>
													<span class="price">
														<span class="pre-price"><fmt:formatNumber pattern="###,###,###" value="${low.item_price}" /></span>
														<fmt:formatNumber pattern="###,###,###" value="${low.item_payment}" />
														<span class="won">원</span>
													</span>
												</span>
											</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!--내용영역 끝-->
				</div>
			</div>

			<!--고정 footer-->
			<%@ include file="inc/footer.jsp"%>
			<!--고정 footer 끝-->

			<!--탑버튼-->
			<div id="top_wrap">
				<a href="#top"><img src="${pageContext.request.contextPath}/img/arrow-up2.png"></a>
			</div>
			<!--탑버튼 끝-->

		</div>
		<!-- //content -->
	</div>
	<!-- //container -->

	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

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

			/* session 숨기기 */

			$("#session").hide();

		});

		var swiper = new Swiper('#main-resell .swiper-container', {
			slidesPerView : 3,
			spaceBetween : 30,
			pagination : {
				el : '.swiper-pagination',
				clickable : true,
			}
		});

		var swiper = new Swiper('#main-slide-section .swiper-container', {
			spaceBetween : 30,
			loop : true,
			centeredSlides : true,
			autoplay : {
				delay : 2500,
				disableOnInteraction : false,
			},
			pagination : {
				el : '.swiper-pagination',
				type : 'progressbar',

			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}

		});

		$(function() {
			$("#keyword").click(function() {
				location.href = "${pageContext.request.contextPath}/search/search.do";
			});
		});
	</script>
</body>

</html>

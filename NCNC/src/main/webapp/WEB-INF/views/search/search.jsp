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
<!--bootstrap-->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<!--Javascript-->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>상품 목록 보기</title>
<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />
<!--나눔고딕 웹 폰트 적용-->
<link rel="stylesheet" type="text/css"
	href="../assets/css/nanumfont.css" />
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
	href="${pageContext.request.contextPath}/css/search.css" />
<!--swiper CSS-->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
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

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp" %>
		<!-- end header -->
		<div id="quick-menu" class="text-center clear">
				<!--탭 기능-->
				<ul>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/home.do">홈</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qPrdList.do">노트북</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qNews.do">뉴스</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qBest.do">베스트</a>
					</li>
				<!--<li class="pull-left text-center">
                        <a href="../SBS/qResell.html">중고거래</a>
                    </li> 추후구현-->
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qEvent.do">이벤트</a>
					</li>
				</ul>
				<!--탭 기능 끝-->
			</div>
		<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
		<%@ include file="../inc/fixed.jsp" %>
		<!-- 햄버거 시작 -->
		<%@ include file="../inc/hamMenu.jsp" %>
		<!-- -------------햄버거 메뉴 끝------------ -->
		<!-- -------------최근 본 상품 시작------------ -->
		<%@ include file="../inc/recentItem.jsp" %>
		<!-- -------------최근 본 상품 끝----------- -->
		<div id="search-content">
			<div id="search-header">
				<c:choose>
					<c:when test="${fn:length(hot) == 0 }">
						<h2>
							검색결과<span>(0)</span>
						</h2>
					</c:when>
					<c:otherwise>
						<h2>
							검색결과<span>(${searchCount})</span>
						</h2>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="q-pr-list">
				<!--인기순/최신순/높은가격/낮은가격 중분류 탭 버튼-->
				<div id="search-title">
					<!--탭 메뉴-->
					<div class="tab" id="tab-btn">
						<ul class="nav nav-tabs" id="tab-ul">
							<li class="pull-left active text-center wid"><a
								href="#search-hot" data-toggle="tab">인기순</a></li>
							<li class="pull-left text-center wid"><a href="#search-new"
								data-toggle="tab">최신순</a></li>
							<li class="pull-left text-center wid"><a href="#search-high"
								data-toggle="tab">높은가격</a></li>
							<li class="pull-left text-center wid"><a href="#search-low"
								data-toggle="tab">낮은가격</a></li>
						</ul>
					</div>
					<!--내용영역-->
					<div id="pro-content-list" class="tab-content thum-list-comm">
						<div id="search-hot" class="tab-pane fade in active">
							<ul class="best-list">
								<c:forEach var="hot" items="${hot}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${hot.item_no}" />
									</c:url>
									<li class="pull-left"><a href="${viewUrl}"> <span
											class="top-area"> <span class="img-area" style="background-image: url(${hot.origin_name})"></span><span class="best-pro-num"></span></span>
										</span> <span class="bottom-area"> <span class="pro-brand">[<span
													class="ro-brand-title">${hot.item_brand}</span>]
											</span> <span class="pro-title">${hot.item_name}</span> <span
												class="pro-price"> <span class="per">${hot.item_discount}%</span>
													<span class="price"> <span class="pre-price"><fmt:formatNumber
																pattern="###,###,###" value="${hot.item_price}" /></span>
													<fmt:formatNumber pattern="###,###,###"
															value="${hot.item_payment}" /> <span class="won">원</span>
												</span>
											</span>
										</span>
									</a></li>
								</c:forEach>
							</ul>
						</div>

						<div id="search-new" class="tab-pane fade in">
							<ul class="best-list">
								<c:forEach var="new1" items="${news}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${new1.item_no}" />
									</c:url>
									<li class="pull-left"><a href="${viewUrl}"> <span
											class="top-area"> <span class="img-area" style="background-image: url(${new1.origin_name})"><span class="best-pro-num"></span></span>
										</span> <span class="bottom-area"> <span class="pro-brand">[<span
													class="ro-brand-title">${new1.item_brand}</span>]
											</span> <span class="pro-title">${new1.item_name}</span> <span
												class="pro-price"> <span class="per">${new1.item_discount}%</span>
													<span class="price"> <span class="pre-price"><fmt:formatNumber
																pattern="###,###,###" value="${new1.item_price}" /></span>
													<fmt:formatNumber pattern="###,###,###"
															value="${new1.item_payment}" /> <span class="won">원</span>
												</span>
											</span>
										</span>
									</a></li>
								</c:forEach>
							</ul>
						</div>
						<div id="search-high" class="tab-pane fade in">
							<ul class="best-list">
								<c:forEach var="high" items="${high}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${high.item_no}" />
									</c:url>
									<li class="pull-left"><a href="${viewUrl}"> <span
											class="top-area"> <span class="img-area" style="background-image: url(${high.origin_name})"><span class="best-pro-num"></span></span>
										</span> <span class="bottom-area"> <span class="pro-brand">[<span
													class="ro-brand-title">${high.item_brand}</span>]
											</span> <span class="pro-title">${high.item_name}</span> <span
												class="pro-price"> <span class="per">${high.item_discount}%</span>
													<span class="price"> <span class="pre-price"><fmt:formatNumber
																pattern="###,###,###" value="${high.item_price}" /></span>
													<fmt:formatNumber pattern="###,###,###"
															value="${high.item_payment}" /> <span class="won">원</span>
												</span>
											</span>
										</span>
									</a></li>
								</c:forEach>
							</ul>
						</div>
						<div id="search-low" class="tab-pane fade in">
							<ul class="best-list">
								<c:forEach var="low" items="${low}" varStatus="status">
									<%-- 상세페이지로 이동하기 위한 URL --%>
									<c:url value="/item/prdDetail.do" var="viewUrl">
										<c:param name="item_no" value="${low.item_no}" />
									</c:url>
									<li class="pull-left"><a href="${viewUrl}"> <span
											class="top-area"> <span class="img-area" style="background-image: url(${low.origin_name})"><span class="best-pro-num"></span></span>
										</span> <span class="bottom-area"> <span class="pro-brand">[<span
													class="ro-brand-title">${low.item_brand}</span>]
											</span> <span class="pro-title">${low.item_name}</span> <span
												class="pro-price"> <span class="per">${low.item_discount}%</span>
													<span class="price"> <span class="pre-price"><fmt:formatNumber
																pattern="###,###,###" value="${low.item_price}" /></span>
													<fmt:formatNumber pattern="###,###,###"
															value="${low.item_payment}" /> <span class="won">원</span>
												</span>
											</span>
										</span>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--고정 footer-->
	<%@ include file="../inc/footer.jsp" %>
	<!-- //고정 footer-->
	<!--탑버튼-->
	<div id="top_wrap">
		<a href="#top"><img src="../img/arrow-up2.png"></a>
	</div>
	<!--Swiper JS -->
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
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

		// 햄버거 메뉴바 슬라이드(왼쪽 -> 오른쪽)
		$(function() {
			$(".slidingDiv").hide();
			$(".show_hide").show();

			$(".show_hide").click(function(e) {
				$(".slidingDiv").animate({
					'left' : 'toggle'
				});
			});
		});

		// 헤더 swiper
		var swiper_1 = new Swiper('.swiper-container', {

			pagination : '.swiper-pagination',

			slidesPerView : 5, //한 번에 보여질 갯 수
			paginationClickable : true,

			spaceBetween : 0,

			freeMode : true,

			pagination : false,

			mousewheelControl : true, // 마우스 휠로 슬라이드 움직임

			nextButton : '.swiper-button-next', //다음페이지 이동

			prevButton : '.swiper-button-prev' //이전페이지 이동

		});

		$('.tabs > li > a').on(
				'click',
				function(e) {

					$(this).parent().addClass('active').siblings().removeClass(
							'active');

					var tabIdx = $(this).parent().index();

				});

		function get_list() {
			var template = Handlebars.compile($(".data_tmpl").html());
			var html = template(data);
			$(".result").append(html);
		}
		$(function() {
			$(".more-view>a").click(function() {
				get_list();

			});
		});
	</script>

</body>
</html>
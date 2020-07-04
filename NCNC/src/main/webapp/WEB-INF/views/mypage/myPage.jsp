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
<title>마이페이지</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />
<!-- bootstrap -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/mypage.css">
</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp" %>
		<div class="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp" %>
			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp" %>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp" %>

			<!-- ====================================================================================== -->

			<div id="content">
				<div id="my-header">
					<button type="button" class="btn-back"
						onclick="history.back(); return false;">뒤로가기</button>
					<h2>마이페이지</h2>
				</div>
				<div id="my-body">
					<!--검은색 배경-->
					<div id="my-body-first">
						<div id="my-name-section" class="row">
							<div class="col-sm-8 col-xs-8">
								<h4>
									<span id="mem-name">${member.mem_name}</span>님의<br>멤버십 등급은
									<span id="membership">FAMILY</span>입니다.
								</h4>
							</div>
							<div class="col-sm-4 col-xs-4" id="my-body-btn">
								<!--오른쪽 화살표는 배경이미지로 넣기-->
								<a href="${pageContext.request.contextPath}/mypage/myMember.do">멤버십
									정보</a> <a
									href="${pageContext.request.contextPath}/mypage/myInfoChange.do">내정보
									수정</a>
							</div>
						</div>
						<!--포인트/ 쿠폰 각각 db로 불러오기-->
						<div id="my-poin-cou-section" class="row">
							<div class="col-sm-6 col-xs-6">
								<div class="pull-left text-left">포인트</div>
								<div class="pull-right text-right">
									<a href="#" id="point-num">
									<c:if test="${output_po.po_value == null}">
										0 P
									</c:if>
									<c:if test="${output_po.po_value != null}">
										<fmt:formatNumber pattern="###,###,###" value="${output_po.po_value}" /> P
									</c:if>
									</a>
								</div>
							</div>
							<div class="col-sm-6 col-xs-6">
								<div class="pull-left text-left">쿠폰</div>
								<div class="pull-right">
									<a href="#" id="coupon-num">
									<c:if test="${output_count == null}"> 0 </c:if>
									<c:if test="${output_count != null}"> ${output_count} </c:if>
									 장
									</a>
								</div>
							</div>
						</div>
					</div>
					<!--흰 배경-->
					<div id="my-body-second" style="clear: both">
						<h3 class="text-center">주문/배송 조회</h3>
						<!--숫자는 width: 20%; 화살표는 width:5%-->
						<ul id="deliver-process">
							<li class="text-center pull-left"><span class="order-num">0</span>
								<a
								href="#">
									결제완료 </a></li>
							<li class="text-center pull-left"><img
								src="${pageContext.request.contextPath}/assets/img/arrow-right.png"
								alt="다음 단계"></li>
							<li class="text-center pull-left"><span class="order-num">0</span>
								<a
								href="#">
									상품준비중 </a></li>
							<li class="text-center pull-left"><img
								src="${pageContext.request.contextPath}/assets/img/arrow-right.png"
								alt="다음 단계"></li>
							<li class="text-center pull-left"><span class="order-num">0</span>
								<a
								href="#">
									배송중 </a></li>
							<li class="text-center pull-left"><img
								src="${pageContext.request.contextPath}/assets/img/arrow-right.png"
								alt="다음 단계"></li>
							<li class="text-center pull-left"><span class="order-num">0</span>
								<a
								href="#">
									배송완료 </a></li>
						</ul>
						<div id="deliver-pagelink" class="dis-root">
							<div class="pull-left text-center">
								<a
									href="${pageContext.request.contextPath}/mypage/myOrderList.do"
									id="my-order-list" class="offbtn2">주문내역</a>
							</div>
							<div class="pull-left text-center">
								<a
									href="${pageContext.request.contextPath}/mypage/myOrderList.do"
									id="my-cancel-order" class="offbtn2">취소/반품/교환</a>
							</div>
						</div>
					</div>
					<!--회색 배경-->
					<div id="my-body-third">
						<!--흰색배경-->
						<div class="row" id="third-piece">
							<div class="col-sm-3 col-xs-3 text-center">
								<a href="${pageContext.request.contextPath}/mypage/jjim.do">찜</a>
							</div>
							<div class="col-sm-3 col-xs-3 text-center">
								<a href="${pageContext.request.contextPath}/mypage/myCoupon.do">쿠폰</a>
							</div>
							<div class="col-sm-3 col-xs-3 text-center">
								<a
									href="${pageContext.request.contextPath}/review/myReviewList.do?mem_no=${member.mem_no}">상품리뷰</a>
							</div>
							<div class="col-sm-3 col-xs-3 text-center">
								<a
									href="${pageContext.request.contextPath}/center/customService.do">고객센터</a>
							</div>
						</div>
						<div id="third-list">
							<ul>
								<li><a
									href="${pageContext.request.contextPath}/mypage/cnct.do">
										1:1 문의</a></li>
								<li><a href="${pageContext.request.contextPath}/center/notice.do">공지사항</a></li>
								<li><a
									href="${pageContext.request.contextPath}/center/faq.do">FAQ</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp" %>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
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
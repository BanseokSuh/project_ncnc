<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/logo3.png" />

<!--bootstrap-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- 가격 구분 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">

<!-- 각 페이지 별로 css 넣기-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cartList.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css">
</head>

<title>장바구니</title>

<body>
	<div id="container">
		<!--  공통헤더 -->
		<%@ include file="../inc/head.jsp"%>
		<!--각페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
		<div id="private-header">
			<!-- 	<button type="button" class="btn-back" onclick="history.back();return false;">뒤로가기</button> -->

			<a href="${pageContext.request.contextPath}/home.do" class="btn-back"></a>

			<h2>장바구니</h2>
		</div>

		<div id="cartList-content">
			<!-- 공통햄버거 -->
			<%@ include file="../inc/hamMenu.jsp"%>
			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
			<div id="cartList-title">니컴내컴 배송</div>

			<form method="get" id="pay_form">
				<c:choose>
					<c:when test="${fn:length(output) == 0}">
						<div>
							<div>
								<br> <br> <br> <br> <br>
								<h4>선택하신 상품이 없습니다.</h4>
								<br> <br> <br> <br> <br>
							</div>
						</div>
						<hr />
					</c:when>

					<c:otherwise>
						<div id="cartList-product">
							<ul>
								<c:forEach var="output" items="${output}" varStatus="status">
									<li class="cart-item cart-item-${output.cart_no}">
										<div class="list-thumbnail left-area">
											<span class="img-area" style="background-image:url(${output.origin_name})"></span>
											<input class="cart_id" value="${output.cart_no}" name="check"
												type="checkbox" id="cart_id"/>
										</div>
										<div class="list-desc">
											<input name="cart_no" class="cart_no"
												value="${output.cart_no}" type="hidden" />
											
											<div class="list-item-info">
											<p class="list-brand">[${output.item_brand}]</p>
											<p class="list-product-name">${output.item_name}</p>

											<p class="list-product-desc">${output.item_cpu}/${output.item_ram}G/${output.item_ssd}GB
												<br> 옵션추가 : ${output.opt_name}
											</p>

											<p class="list-product-price">
												<fmt:formatNumber pattern="###,###,###"
													value="${output.item_price-(output.item_price*output.item_discount/100) + output.opt_price}" />
												원
											</p>
											</div>
											<div class="list-product-delete">
												<a href="${pageContext.request.contextPath}/mypage/cartDelete.do?cart_no=${output.cart_no}">&times;</a>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>

						<div id="cartList-price">
							<div>
								<span id="cartList-product-price"> <c:set var="total"
										value="0" /> <c:forEach var="output" items="${output}"
										varStatus="status">
										<c:set var="total"
											value="${output.item_price-(output.item_price*output.item_discount/100) + output.opt_price}" />
									</c:forEach> <fmt:formatNumber pattern="###,###,###" value="${total}" />원
								</span> <span>+</span> <span id="cartList-deliver-price"> <span
									id="deliver-price">배송비</span> 2,500원
								</span> <span>=</span> <span id="cartList-total-price"> <fmt:formatNumber
										pattern="###,###,###" value="${total + 2500}" />원
								</span>
							</div>
						</div>
						<div id="cartList-price-detail">
							<div id="cartList-price-info">
								<div>총 상품금액</div>
								<div>예상 배송비</div>
								<div>예상 할인금액</div>
							</div>
							<div id="cartList-price-desc">
								<div>
									<fmt:formatNumber pattern="###,###,###" value="${total}" />
									원
								</div>
								<div>2,500원</div>
								<div>0원</div>
							</div>
						</div>
						<div id="cartList-define-price">
							<div id="cartList-explain-info">결제 예상금액</div>
							<div id="cartList-explain-price">
								<fmt:formatNumber pattern="###,###,###" value="${total + 2500}" />
								원
							</div>
						</div>

						<!-- =================================================================================== -->
						<div id="go-to-order">
							<a href="#" id="order_ok" class="okbtn1">주문하기</a>
							<!-- <button type="button" id="order_ok3" class="okbtn1">주문하기_submit
								너로 정했따</button>
							<button type="button" id="order_ok2" class="okbtn1">주문하기_button</button> -->
							<!-- <input type="submit" value="전송" /> -->
							<!-- <input type="hidden" id="cartnum" /> -->
						</div>
						<!-- =================================================================================== -->

					</c:otherwise>
				</c:choose>
			</form>
			<!-- end of form tag -->
			<div id="cartList-deliver-desc">
				<div id="cartList-deliver-explain">배송비 안내</div>
				<ul>
					<li>
						<p>주문서에서의 쿠폰 적용 및 배송 지역 적용에 따라 할인액 및 배송비가 달리 적용될 수 있습니다.</p>
					</li>
					<li>
						<p>자체 배송에 한해 여러 건의 상품 중 무료배송 상품이 속해있을 경우 전체 무료 배송 됩니다.(도서산간 추가
							운임비 제외)</p>
					</li>
					<li>
						<p>업체별 배송 상품의 배송비는 업체와 택배사 간 계약 내용에 따라 각각 달리 부과될 수 있습니다.</p>
					</li>
				</ul>
			</div>
			<div id="cartList-use-desc">
				<div id="cartList-use-explain">장바구니 이용안내</div>
				<ul>
					<li>
						<p>장바구니는 최대 30일까지 보관됩니다. 더 오랫동안 보관하시려면 찜 기능을 이용해 주세요.</p>
					</li>
					<li>
						<p>오랫동안 장바구니에 보관된 상품을 주문하실 경우, 가겨이나 혜택이 변동될 수 있습니다.</p>
					</li>
					<li>
						<p>장바구니는 최대 10개까지 담으실 수 있습니다. 10개 초과시 가장 처음 담으셨던 상품 순으로 자동 삭제
							됩니다.</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- 공통푸터 -->
		<%@ include file="../inc/footer.jsp"%>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"> <img src="../img/arrow-up2.png">
			</a>
		</div>
	</div>
	<!-- 부트 스트랩 Javascript // 탭 메뉴 필요할때만, 아니면 빼기 -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="../plugins/sweetalert/sweetalert2.min.js"></script>
	<script type="text/javascript">
		$(function() {
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
	 </script>
	
	<script>
	$(function() {
    	$("#order_ok").click(function() {
        	const cartNo = new Array;
            const obj = $(".cart_id:checked");
             
            if (obj.length < 1) {
                swal('알림', '선택된 항목이 없습니다.');
                return false;
            }
             
            swal({
                title: '확인',
                text: '정말 ' + obj.length + '개의 항목을 주문하시겠습니까?', 
                type: "question",
                showCancelButton: true
            }).then(function(result) {
                if (result.value) {
                    obj.each(function(i, v) {
                   	cartNo.push($(v).val());
                    });
             		location.href = "${pageContext.request.contextPath}/order/order.do?cart_no="+cartNo;
                }       
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
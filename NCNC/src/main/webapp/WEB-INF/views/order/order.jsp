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
<title>구매페이지</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />
<!-- bootstrap -->
<!-- 모바일 웹 페이지 설정 -->
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png" />
<!-- bootstrap -->
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
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/order.css">

<link rel="stylesheet" href="../plugins/sweetalert/sweetalert2.min.css">
</head>
<body>
	<div id="container">
		<!-- 공통 헤더 -->
		<div class="content">
			<%@ include file="../inc/head.jsp"%>
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>

			<!-- -------------햄버거 메뉴 끝------------ -->

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- -------------최근 본 상품 끝----------- -->

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>

			<div calss="order-header">
				<h2>주문서작성/결제</h2>
			</div>

			
			<!-- order-1 주문자 시작 -->
			<div class="order-1">
				<div class="order-name ">
					<p class="sub-title">주문자</p>
				</div>

				<div class="o-name">
					<p>${memout.mem_name}</p>
				</div>
			</div>
			<!-- order-1 끝 -->
			<!-- order-2 배송지 정보 시작-->
			<div class="order-2">
				<div class="order-info">
					<p class="sub-title">배송지 정보</p>

				</div>
				<div class="order-info-list" id="mem-infor">
					<ul class="info-list">
						<li>받으실분</li>
						<li>연락처</li>
						<li>배송주소</li>
						<li>베송메모</li>
					</ul>
					<ul class="ordr-info-a">
						<li><input type="hidden" value="${memout.mem_no}" id="mem_no"></li>
						<li>${memout.mem_name}</li>
						<li>${memout.mem_tel}</li>
						<li>${memout.mem_postcode},${memout.mem_addr1},
							${memout.mem_addr2}</li>
						<li><input type="text" placeholder="부재시 연락주세요."
							maxlength="100" id="ord_memo" name="ord_memo"></li>
					</ul>
				</div>
			</div>
			<!-- order-2 배송지 정보 끝 -->
			<!-- order-3 주문 상품 시작 -->
			<div class="order-3">
				<div class="order-product">
					<p class="sub-title">주문 상품</p>
				</div>
				<c:forEach items="${outputlist}" var="item" varStatus="status">
					<div class="order-product-body">

						<div class="pull-left top-area" id="body1">
							<input type="hidden" class="cart_id" value="${item.cart_no}">
							<span class="img-area"
								style="background-image: url(${item.origin_name})"></span>
						</div>
						<div class="o-product" id="body2">
							<span class="brand">[${item.item_brand}]</span> <span
								class="content">${item.item_name}</span> <span class="detail">${speclist}</span>
							<div id="body3" class="payment">
								<span> <fmt:formatNumber pattern="###,###,###"
										value="${item.item_paymen}" />원
								</span>
							</div>
						</div>
					</div>
				</c:forEach>

			</div>
			<!-- order-3 주문 상품 끝 -->
			<!-- order-4 포인트 사용 시작 -->
			<div class="order-4">
				<div class="order-point">
					<p class="sub-title">포인트 사용</p>
				</div>
				<div class="order-point-body">
					<input type="text" name="po_value" id="po_value"
						value="${memout.po_value}" readonly>p
					<button id="po_val_btn" type="submit">사용</button>
				</div>
				<div class="use_point">
					사용 가능한 포인트 <span>${memout.po_value}</span>
				</div>
			</div>
			<!-- order-4 포인트 사용 끝 -->
			<!-- order-5 쿠폰 사용 시작 -->
			<div class="order-5">
				<p class="sub-title cou-section">쿠폰</p>
				<form class="cou-form">
					<label class="sub-title" for="cou_no">사용가능한 쿠폰</label> <select
						name="cou_no" id="coupon-content">
						<%--조회 결과에 따른 반복처리 --%>
						<c:forEach var="item" items="${couList}" varStatus="status">

							<option value="" label="쿠폰을 선택해주세요">쿠폰을 선택해주세요</option>
							<option value="${item.cou_no}" label="${item.cou_name}">
								<!--<c:if test="${item.mem_no == outputList.mem_no}"></c:if> -->${item.cou_price}</option>
						</c:forEach>
					</select>
				</form>
			</div>


		</div>
		<!-- order-5 쿠폰 사용 끝 -->

		<!-- order-6 총 결제금액 시작 -->
		<div class="order-6">
			<div class="order-payment">
				<p class="sub-title">총 결제금액</p>
			</div>
			<div class="order-payment-body">
				<div class="order-payment-list">
					<table class="payment-list sum">
						<tr>
							<th>총 상품금액</th>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${list_total_price}" />원</td>
						</tr>
						<tr>
							<th>총 배송비</th>
							<td>
								<fmt:formatNumber pattern="###,###,###"
							value="${deli_total}"/>원
							</td>
						</tr>
						<tr>
							<th>총 할인금액</th>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${list_dis_price}" />원</td>
						</tr>
						<tr>
							<th>쿠폰 사용</th>
							<td><input type="text" readonly="readonly" id="couprice" />원
							</td>
						</tr>
						<tr>
							<th>POINT 적립</th>
							<td><fmt:formatNumber pattern="###,###,###"
									value="${list_total_price*0.005}" />P</td>
						</tr>
					</table>
				</div>
				<div class="result">
					총 결제금액 <span><fmt:formatNumber pattern="###,###,###"
							value="${list_total_price}" />원</span>
				</div>

			</div>
		</div>
		<!-- order-6 총 결제금액 종료 -->
		<!-- order-7 총 결제수단 시작 -->
		<form id="myform">
			<div class="order-7">
				<div class="order-payway">
					<p class="sub-title">결제 수단 선택</p>
				</div>
				<div class="order-payway-list">
					<div>
						<span>무통장 입금</span>
					</div>
					<div>
						<label for="ord_bank">은행선택</label> 
						<select name="ord_bank"
							class="form-control" id="ord_bank">

							<option value="">은행선택</option>
							<option value="2">우리은행</option>
							<option value="3">신한은행</option>
							<option value="4">카카오</option>
							<option value="5">기업은행</option>

						</select>

					</div>
					<div>
						<label for="ord_payer">입금자명</label>
						<div class="buyer-name">
							<input type="text" placeholder="구매자 이름" id="ord_payer"
								name="ord_payer">
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- order-7 총 결제수단 종료 -->
		<!-- checklist 시작-->
		<div class="checklist" id="checklist">
            <label> <input type="checkbox" class="agree" id="ck02"></label>
            주문상품, 가격, 할인, 배송정보에 동의합니다.<br />
            <label> <input type="checkbox" class="agree" id="ck03"></label>
            개인정보 수집 및 이용에 동의합니다.
        </div>
		<!-- checklist 끝-->
		<!-- button-box 시작-->
		<div class="button-box">
			<button type="button" id="orderresult">결제하기</button>
		</div>
		<!-- button-box 끝-->
	</div>

	<!--고정 footer-->
	<%@ include file="../inc/footer.jsp"%>

	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="../plugins/sweetalert/sweetalert2.min.js"></script>

	
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

            $("#coupon-content").change(function() {
				var cou_list = parseInt($("#coupon-content option:selected").text());
				var coupri = cou_list/100 * ${list_total_price}
				$("#couprice").val(coupri);
			});



        /* 조건달기 */
        	$("#orderresult").click(function() {
            	var subject = $("#ord_bank").val();
            	if (!subject) {
                	swal({
                    	title: "은행을 선택해 주세요.",
     	            	confirmButtonColor: "#620080",
                    	cancelButtonColor: "#888",
                    	reverseButtons: true,

                	})
            	} else if ($("#ck02").prop('checked') == false || $("#ck03").prop('checked') == false) {
                	swal({
                    	title: "필수 약관에 동의하셔야 합니다.",
                    	confirmButtonColor: "#620080",
                    	cancelButtonColor: "#888",
                    	reverseButtons: true,
                	})
            	} else {
            		$("#orderresult").click(function() {
                		const cartNo = new Array;
                    	const obj = $(".cart_id");
                    	var ordMemo = $("#ord_memo").val();
                  		var ordDel = ${deli_total};
                    	var ordPayer = $("#ord_payer").val();
                    	var ordBank = $("#ord_bank").val();
                     	 
                    	var ordmeen = encodeURI(ordMemo, "UTF-8");
                    	var ordpaen = encodeURI(ordPayer, "UTF-8");
                     	 
                    	jQuery.ajaxSettings.traditional = true;
                    
						swal({
                    		title: '확인',
                        	text: '결제 하시겠습니까?', 
                        	type: "question",
                        	showCancelButton: true
                    	}).then(function(result) {
                        	if (result.value) {
                        		obj.each(function(i, v) {
                            	cartNo.push($(v).val());
                            	});

                        	location.href = "${pageContext.request.contextPath}/order/orders_ok.do?cart_no="+cartNo + "&ord_memo="+ ordmeen + "&ord_delivery="+ ordDel + "&ord_payer=" +ordpaen + "&ord_bank=" +ordBank;
                        	}       
                    	});
                	});
            	}
        	});
    	});     

    </script>
	
</body>

</html>

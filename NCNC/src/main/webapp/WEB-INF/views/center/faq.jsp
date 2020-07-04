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
<title>FAQ</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />
<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">
<!-- bootstrap -->

<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/faq.css">
</head>

<body>
	<div id="container">

		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요 끝-->

		<div class="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>
			<!-- -------------햄버거 메뉴 끝------------ -->

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- -------------최근 본 상품 끝----------- -->

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능 끝-->

			<!----------------faq 화면 시작--------------------->
			<!-- 제목 / 뒤로가기 -->
			<div id="faq-header">
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>FAQ</h2>
			</div>
			<!-- end 제목 / 뒤로가기 -->
			<div id="faq-content">
				<!-- 내용 제목-->
				<div class="row" id="cs-faq-header">
					<div class="col-sm-8 col-xs-8">
						<h3>FAQ</h3>
					</div>
				</div>
				<!--end 내용 제목-->

				<!--FAQ 탭 버튼 영역 / 탭에 해당하는 중분류 나열-->
				<div id="faq-kind" class="clear">
					<ul class="nav nav-tabs" id="tab-ul">
						<li class=" btn-button-item pull-left"><a href="#tab-1"
							data-toggle="tab" class="selected btn-button-item-link">전체</a></li>
						<li class="btn-button-item pull-left"><a href="#tab-2"
							data-toggle="tab" class="selected btn-button-item-link">주문/결제</a>
						</li>
						<li class="btn-button-item pull-left"><a href="#tab-3"
							data-toggle="tab" class="selected btn-button-item-link">취소/반품</a>
						</li>
						<li class="btn-button-item pull-left"><a href="#tab-4"
							data-toggle="tab" class="selected btn-button-item-link">상품/배송</a>
						</li>
						<li class="btn-button-item pull-left clear"><a href="#tab-5"
							data-toggle="tab" class="selected btn-button-item-link">서비스/<br>회원혜택
						</a></li>
						<li class="btn-button-item pull-left "><a href="#tab-6"
							data-toggle="tab" class="selected btn-button-item-link">쿠폰/<br>이벤트
						</a></li>
						<li class="btn-button-item pull-left"><a href="#tab-7"
							data-toggle="tab" class="selected btn-button-item-link">사이트이용</a>
						</li>
						<li class="btn-button-item pull-left"><a href="#tab-8"
							data-toggle="tab" class="selected btn-button-item-link">기타</a></li>
					</ul>
				</div>
				<!--FAQ 탭 버튼 영역 / 탭에 해당하는 중분류 나열 끝-->

				<!--중분류 / 소분류 아코디언 기능-->
				<div class="tab-content" id="faq-subtitle">
					<div class="tab-pane fade in active sub-list" id="tab-1">
						<ul>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">할부 결제가 가능한가요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>신용카드로 5만원이상 결제할 경우 할부로 결제 가능합니다.<br> 카드사마다
												무이자할부 조건이 다르므로 결제 전 카드사 혜택 부분을 반드시 확인해주시길 바랍니다. 보다
												더 자세한 내용은 고객센터로 문의해 주시기 바랍니다.
												<p>&nbsp;</p> *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시
												(주말, 공휴일 휴무)</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">법인 카드로 결제하는데 할부가 안되네요.</a>
								</h3>
								<ul>
									<li>법인카드는 할부결제가 되지 않습니다. 일시불로 결제 부탁드립니다.</li>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">오늘 반품접수를 했습니다. 언제 상품을 회수해 가나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>반품 접수하신 후 최대 5일 이내로 택배 기사가 방문합니다. (주말/공휴일 제외)<br> 상품이 훼손되지 않도록 잘 포장하셔서 방문하는 택배 기사님 편으로 반송하여 주세요. 반품에 대한 운송장은 반품 완료 때까지 보관하여 주세요.</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">상품에 대한 문의는 어떻게 하나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>상품에 대한 문의는 1:1상담 혹은 Q&A를 이용 부탁드립니다.</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">주문한 상품을 아직 받지 못했는데, 배송현황에 배송완료로 표시되어 있어요.</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>마이페이지에서 보여지는 시스템 배송상황과 실제 배송상황은 차이가 있을 수 있습니다.<br> 배송완료로 조회되나, 상품 수령이 이루어지지 않았을 경우 니컴내컴 고객센터로 문의해 주시기 바랍니다.
										 <p>&nbsp;</p> *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시
												(주말, 공휴일 휴무)</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">이벤트 상품 주문시에도 POINT 적립/사용이나 할인이 가능한가요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>POINT 적립/ 사용이 가능합니다.</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">주문을 취소했는데 신용카드 결제 취소가 안되었어요. 어떻게 해야 하나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>카드매출 취소는 즉시 접수되나, 카드사 사정에 따라 매출취소가 이루어질 때까지 약 3~7일 영업일 정도 소요될 수 있습니다.<br> 각 신용카드사 청구 작업이 끝난 이후에 취소 처리가 된 경우, 카드 대금 납부 후 다음달 카드 대금에서 상계처리 될 수 있습니다.</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">결제 후 POINT 적립은 어떻게 되나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>주문 및 취소/반품 건에 대한 포인트는 익일 적립/차감됩니다.<br> 단, 휴일의 주문 및 취소/반품 건에 대한 행사 포인트는 휴일 경과 직후 영업일에 적립 및 차감됩니다. (예 : 주말 주문 건에 대한 행사 포인트는 월요일에 적립 예정)</li>
									</div>
								</ul>
							</li>
							
							<li>
								<h3 class="faq-acco-title">
									<a href="#">쿠폰 사용은 어떻게 해야 하나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>쿠폰은 최종 결제 금액을 기준으로 조건 충족 시 사용이 가능하며, <br>제품 주문시 ‘주문서작성/결제’ 단계에서 장바구니 쿠폰을 적용하시면 됩니다. 주문 건 당 1개의 쿠폰만 적용이 가능합니다.</li>
									</div>
								</ul>
							</li>
							
							<li>
								<h3 class="faq-acco-title">
									<a href="#">회원정보를 변경하려면 어떻게 해야 하나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>로그인 하신 후, 마이페이지의 '내 정보 수정' 메뉴에서 회원정보를 수정하실 수 있습니다. 회원정보 수정 시 개인정보 보호를 위해 비밀번호 입력이 필요합니다.</li>
									</div>
								</ul>
							</li>
							
							<li>
								<h3 class="faq-acco-title">
									<a href="#">쿠폰사용 후 주문 취소/반품하면 쿠폰이 다시 지급되나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>쿠폰 사용 후 행사 기간내 취소/ 반품 시에는 ‘마이페이지> 내 쿠폰함’ 에서 확인이 가능합니다.<br> 다만, 주문 익일 이후 결제 취소 시 취소일 기준으로 D+1 시점에 복원되며, 취소/반품 후 재구매시 쿠폰 적용은 쿠폰 사용기간에 한해서만 할인이 가능합니다.</li>
									</div>
								</ul>
							</li>
							
							<li>
								<h3 class="faq-acco-title">
									<a href="#">계정의 비밀번호는 어떻게 변경하나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>마이페이지를 이용해주세요.</li>
									</div>
								</ul>
							</li>
							<li>
								<h3 class="faq-acco-title">
									<a href="#">로그인이 안되는데 어떻게 해야 하나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>앱스토어/구글플레이에서 앱 삭제 후 재 설치 부탁드립니다.<br> 재 설치 후에도 로그인 오류가 발생 시, *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시(주말, 공휴일 휴무) 로 문의해주세요.</li>
									</div>
								</ul>
							</li>				
							<li>
								<h3 class="faq-acco-title">
									<a href="#">장바구니 담긴 상품은 얼마동안 보관되나요?</a>
								</h3>
								<ul class="faq-acco-content">
									<div class="s-content">
										<li>장바구니는 최대 30일까지 보관됩니다. 오랫동안 장바구니에 보관된 상품을 주문하실 경우, 가격이나 혜택이 변동될 수 있습니다.</li>
									</div>
								</ul>
							</li>
						</ul>
					</div>
					<div class="tab-pane fade sub-list" id="tab-2">
						<div id="tab-2">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">할부 결제가 가능한가요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>신용카드로 5만원이상 결제할 경우 할부로 결제 가능합니다.<br> 카드사마다
												무이자할부 조건이 다르므로 결제 전 카드사 혜택 부분을 반드시 확인해주시길 바랍니다. 보다
												더 자세한 내용은 고객센터로 문의해 주시기 바랍니다.
												<p>&nbsp;</p> *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시
												(주말, 공휴일 휴무)
											</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">법인 카드로 결제하는데 할부가 안되네요.</a>
									</h3>
									<ul>
										<li>법인카드는 할부결제가 되지 않습니다. 일시불로 결제 부탁드립니다.</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade sub-list" id="tab-3">
						<div id="tab-3">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">오늘 반품접수를 했습니다. 언제 상품을 회수해 가나요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>반품 접수하신 후 최대 5일 이내로 택배 기사가 방문합니다. (주말/공휴일 제외)<br> 상품이 훼손되지 않도록 잘 포장하셔서 방문하는 택배 기사님 편으로 반송하여 주세요. 반품에 대한 운송장은 반품 완료 때까지 보관하여 주세요.</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">주문을 취소했는데 신용카드 결제 취소가 안되었어요. 어떻게 해야 하나요?</a>
									</h3>
									<ul>
										<li>카드매출 취소는 즉시 접수되나, 카드사 사정에 따라 매출취소가 이루어질 때까지 약 3~7일 영업일 정도 소요될 수 있습니다.<br> 각 신용카드사 청구 작업이 끝난 이후에 취소 처리가 된 경우, 카드 대금 납부 후 다음달 카드 대금에서 상계처리 될 수 있습니다.</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade sub-list" id="tab-4">
						<div id="tab-4">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">상품에 대한 문의는 어떻게 하나요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>상품에 대한 문의는 1:1상담 혹은 Q&A를 이용 부탁드립니다.</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">주문한 상품을 아직 받지 못했는데, 배송현황에 배송완료로 표시되어 있어요.</a>
									</h3>
									<ul>
										<li>마이페이지에서 보여지는 시스템 배송상황과 실제 배송상황은 차이가 있을 수 있습니다.<br> 배송완료로 조회되나, 상품 수령이 이루어지지 않았을 경우 니컴내컴 고객센터로 문의해 주시기 바랍니다.
										 <p>&nbsp;</p> *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시
												(주말, 공휴일 휴무)</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade sub-list" id="tab-5">
						<div id="tab-5">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">결제 후 POINT 적립은 어떻게 되나요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>주문 및 취소/반품 건에 대한 포인트는 익일 적립/차감됩니다.<br> 단, 휴일의 주문 및 취소/반품 건에 대한 행사 포인트는 휴일 경과 직후 영업일에 적립 및 차감됩니다. (예 : 주말 주문 건에 대한 행사 포인트는 월요일에 적립 예정)</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">회원정보를 변경하려면 어떻게 해야 하나요?</a>
									</h3>
									<ul>
										<li>로그인 하신 후, 마이페이지의 '내 정보 수정' 메뉴에서 회원정보를 수정하실 수 있습니다. 회원정보 수정 시 개인정보 보호를 위해 비밀번호 입력이 필요합니다.</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade sub-list" id="tab-6">
						<div id="tab-6">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">쿠폰 사용은 어떻게 해야 하나요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>쿠폰은 최종 결제 금액을 기준으로 조건 충족 시 사용이 가능하며, <br>제품 주문시 ‘주문서작성/결제’ 단계에서 장바구니 쿠폰을 적용하시면 됩니다. 주문 건 당 1개의 쿠폰만 적용이 가능합니다.</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">쿠폰사용 후 주문 취소/반품하면 쿠폰이 다시 지급되나요?</a>
									</h3>
									<ul>
										<li>쿠폰 사용 후 행사 기간내 취소/ 반품 시에는 ‘마이페이지> 내 쿠폰함’ 에서 확인이 가능합니다.<br> 다만, 주문 익일 이후 결제 취소 시 취소일 기준으로 D+1 시점에 복원되며, 취소/반품 후 재구매시 쿠폰 적용은 쿠폰 사용기간에 한해서만 할인이 가능합니다.</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade sub-list" id="tab-7">
						<div id="tab-7">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">계정의 비밀번호는 어떻게 변경하나요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>마이페이지를 이용해주세요.</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">로그인이 안되는데 어떻게 해야 하나요?</a>
									</h3>
									<ul>
										<li>앱스토어/구글플레이에서 앱 삭제 후 재 설치 부탁드립니다.<br> 재 설치 후에도 로그인 오류가 발생 시, *니컴내컴 고객센터: 1234-5678 / 상담시간: 오전 9시 ~ 오후 6시(주말, 공휴일 휴무) 로 문의해주세요.</li>
									</ul> 
								</li>
							</ul>
						</div>
					</div>
					<div class="tab-pane fade sub-list" id="tab-8">
						<div id="tab-8">
							<ul>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">장바구니 담긴 상품은 얼마동안 보관되나요?</a>
									</h3>
									<ul class="faq-acco-content">
										<div class="s-content">
											<li>장바구니는 최대 30일까지 보관됩니다. 오랫동안 장바구니에 보관된 상품을 주문하실 경우, 가격이나 혜택이 변동될 수 있습니다.</li>
										</div>
									</ul>
								</li>
								<li>
									<h3 class="faq-acco-title">
										<a href="#">이벤트 상품 주문시에도 POINT 적립/사용이나 할인이 가능한가요?</a>
									</h3>
									<ul>
										<li>POINT 적립/ 사용이 가능합니다.</li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 아코디언 기능 끝 -->
			</div>
		</div>

		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!--고정 footer 끝-->

		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img
				src="${pageContext.request.contextPath}/img/arrow-up2.png"></a>
		</div>
		<!--탑버튼 끝-->
	</div>
</body>

</html>
<!-- Javascript -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
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

	/* 아코디언 메뉴 액션 */
	$(function() {
		$("#faq-subtitle h3").click(function() {
			$("#faq-subtitle ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			}
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

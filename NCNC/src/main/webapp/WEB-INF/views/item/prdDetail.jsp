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
<title>상품 상세페이지</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />

<!-- 각 페이지 별로 css 넣기-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/prdDetail.css">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">


<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">

<!-- swiper 삼품사진 -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">

<!-- ㅇㄴㅁ -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


</head>

<body>
	<div id="container">

		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>

		<div id="proD-content">


			<!--각페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
			<div id="proD-header">
				<!--뒤로 가기 버튼-->
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>상품정보</h2>
			</div>

			<div id="proD-body">
				<div id="proD-inner">
					<!-- 상품 상세페이지 Swiper -->
					<div class="swiper-container">

						<div class="swiper-wrapper">

							<div class="swiper-slide slide-area">

								<span class="img-area"
									style="background-image: url(${output.origin_name})"> </span>
							</div>

							<c:forEach var="img" items="${img}" varStatus="status">
								<div class="swiper-slide slide-area">
									<span class="img-area"
										style="background-image: url(${img.origin_name})"> </span>
								</div>
							</c:forEach>

						</div>
						<div class="swiper-pagination"></div>

						<!-- Add Pagination -->


					</div>
					<div id="proD-text">
						<p id="proD-brand">${output.item_brand}</p>
						<p id="proD-title">${output.item_name}</p>
						<span class="proD-badgi">세일</span>

						<p id="star-icon-review"></p>
						<div id="proD-preice">
							판매가<span class="proD-preice-num"><fmt:formatNumber
									pattern="###,###,###" value="${output.item_payment}" /></span>원


						</div>
					</div>
					<div id="proD-order-section">
						<span class="pull-left">배송</span> <span
							class="proD-order-de pull-right">2500원/니컴내컴배송</span>
					</div>
				</div>

				<!-- 탭 메뉴 있는 부분은 넣기 -->
				<div class="tab" id="tab-btn">
					<ul class="nav nav-tabs" id="tab-ul">
						<li class="pull-left active"><a href="#pro-inpomation"
							data-toggle="tab">상품정보</a></li>
						<li class="pull-left"><a href="#order-inpomation"
							data-toggle="tab">구매정보</a></li>
						<li class="pull-left"><a href="#proD-review"
							data-toggle="tab">상품후기</a></li>
						<li class="pull-left"><a
							href="${pageContext.request.contextPath}/mypage/cnct.do">1:1문의</a></li>
					</ul>
				</div>
				<!-- 페이지 본문 영역 넣기 -->
				<div class="tab-content">
					<div id="pro-inpomation" class="tab-pane fade in active">
						<div class="pro-inpomation-img">
							<img id="img-detail"
								src="${pageContext.request.contextPath}/img/${img1.origin_name}"
								alt="${img1.origin_name}"> <span class="more-btn-wrap">
							</span>
						</div>

					</div>
					<div id="order-inpomation" class="tab-pane in fade">
						<h3>구매정보</h3>
						<div id="order-inpomation-txt">
							<h4 class="text-left">배송정보</h4>
							<table class="order-table">
								<tbody>
									<tr>
										<th>배송방법</th>
										<td>순차배송</td>
										<th rowspan="2">배송비</th>
										<td rowspan="2">무료배송 - 로켓배송 상품 중 19,800원 이상 구매 시 무료배송 -
											도서산간 지역 추가비용 없음</td>
									</tr>

									<tr>
										<th>묶음배송 여부</th>
										<td>가능</td>
									</tr>
									<tr>
										<th>배송기간</th>
										<td colspan="3">ㆍ쿠팡맨 배송 지역 : 주문 및 결제 완료 후, 1-2일 이내 도착<br>
											ㆍ쿠팡맨 미배송 지역 : 주문 및 결제 완료 후, 2-3일 이내 도착<br> - 도서 산간 지역 등은
											하루가 더 소요될 수 있습니다. 곧 고객님께도 쿠팡맨이 찾아갈 수 있도록 노력하겠습니다<br>

											ㆍ천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해 부탁드립니다.
										</td>
									</tr>
								</tbody>
							</table>

							<h4 class="text-left">교환/반품 안내</h4>
							<table class="change-table">
								<tbody>
									<tr>
										<th>교환/반품 비용</th>
										<td>5,000원<br> - 단, 고객 변심의 경우에만 발생<br> - 부분반품
											시, 남은금액이 무료배송 조건을 유지하면 일부 반품비용이 부과
										</td>
									</tr>
									<tr>
										<th>교환/반품 신청 기준일</th>
										<td>ㆍ단순변심에 의한 로켓배송 상품의 교환/반품은 제품 수령 후 30일 이내까지만 가능
											(교환/반품비용 고객부담) ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월
											이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능</td>
									</tr>
								</tbody>
							</table>


						</div>
					</div>
					<div id="proD-review" class="tab-pane in fade">
						<h3>상품후기</h3>
						<div class="proD-review-num text-center">
							<span class="review-num">${count}</span>개의 상품리뷰
						</div>
						<div id="proD-review-list">
							<ul>

								<c:forEach var="item" items="${review}" varStatus="status">

									<li>
										<!-- ***************************************************************** -->

										<!-- ***************************************************************** -->

										<div class="top-area1 dis-root">
											<div class="star-box pull-left">
												<c:if test="${item.rev_star == 1}">
													<span class="onstar"></span>
												</c:if>
												<c:if test="${item.rev_star == 2}">
													<span class="onstar"></span>
													<span class="onstar"></span>
												</c:if>
												<c:if test="${item.rev_star == 3}">
													<span class="onstar"></span>
													<span class="onstar"></span>
													<span class="onstar"></span>
												</c:if>
												<c:if test="${item.rev_star == 4}">
													<span class="onstar"></span>
													<span class="onstar"></span>
													<span class="onstar"></span>
													<span class="onstar"></span>
												</c:if>
												<c:if test="${item.rev_star == 5}">
													<span class="onstar"></span>
													<span class="onstar"></span>
													<span class="onstar"></span>
													<span class="onstar"></span>
													<span class="onstar"></span>
												</c:if>
											</div>
											<span class="review-userid pull-left">${item.mem_id}</span> <span
												class="review-date pull-right">${item.reg_date}</span>
										</div> <span class="proD-review-txt clear">${item.rev_contents}</span>
									</li>
								</c:forEach>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="option-wrap">

				<!-- -------------- 하단 fixed 옵션버튼--------- -->
				<div class="show-wrap">
					<div id="show-btn">
						<a href="#" class="top-option"> <span class="hide">
								옵션버튼 </span>
						</a>
					</div>
					<div class="show-inner">
						<a href="#" id="sendurl" class="orderbtn pull-left text-center">구매하기</a>
						<a href="#" id="jjim-btn"
							class="pull-right proD-jjim-btn jjim jjim-off">찜</a>
					</div>
				</div>
				<div class="hide-wrap">
					<div class="btn-wrap">
						<a href="#" class="bottom-option"> <span class="hide">
								옵션버튼 </span>
						</a>
					</div>
					<div class="hide-inner">
						<div id="proD-option-hidden">
							<p>옵션</p>
							<form>
								<select name="options" id="options">
									<option value="" label="-------필수선택사항-------" disabled selected></option>
									<c:forEach var="item" items="${output1}" varStatus="status">
										<option value="${item.opt_no}" label="${item.opt_name}">${item.opt_price}</option>
									</c:forEach>
								</select>
							</form>
							<div id="option-check" class="div dis-root">
								<p class="pull-left">
									<span class="option-num"></span>
								</p>

								<p class="won pull-right">원</p>
								<input type="text" readonly="readonly" id="textarea1" size=50 />

								<p class="total pull-left">옵션가격</p>
								<!--     상품금액<span class="option-all-price">원</span>-->

							</div>

							<div id="option-check-section" class="div dis-root">
								<p class="pull-left">
									<span class="option-num"></span>
								</p>

								<p class="won pull-right">원</p>
								<input type="text" readonly="readonly" id="textarea2" size=50 />

								<p class="total pull-left">총가격</p>
								<!--     상품금액<span class="option-all-price">원</span>-->

							</div>
							<div id="option-inner-btn">
								<a href="cartList.html"></a> <a href="order.html"></a>
							</div>

							<div id="option-order-btn">
								<a href="#" id="sendurl1" class="pro-cart pull-left text-center">장바구니</a>
								<a href="#" id="sendurl2"
									class="pro-order pull-left text-center">구매하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--고정 footer-->
			<%@ include file="../inc/footer.jsp"%>
			<!--탑버튼-->
			<div id="top_wrap">
				<a href="#top"><img src="../img/arrow-up2.png"></a>
			</div>
		</div>
	</div>

	<!-- 부트 스트랩 Javascript // 탭 메뉴 필요할때만, 아니면 빼기 -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>

	<!-- Swiper JS -->
	<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>


	<script type="text/javascript">

   
      $(function() {
         $(".hide-wrap").hide();

         $(".top-option").click(function() {
            $(".hide-wrap").show();
            $(".show-wrap").hide();

         });

         $(".bottom-option").click(function() {
            $(".hide-wrap").hide();
            $(".show-wrap").show();

         });
         
         var swiper = new Swiper('.swiper-container', {
            pagination : {
               el : '.swiper-pagination',
            },
         });

         
         // 찜 스위치 
         $(function(){
            $("#jjim-btn").click(function(){
               if(${member == null}) {
                  alert("로그인 후 이용해주세요");
                  location.href = "${pageContext.request.contextPath}/login/login.do";
               }
            })
         });
         
         $("#jjim-btn").on('click',function(e){
            if($("#jjim-btn").hasClass("jjim-off")){
               $("#jjim-btn").removeClass('jjim-off');
               $("#jjim-btn").addClass("jjim-on");
               e.preventDefault();
               itemnum = ${output.item_no};
               
               $.ajax({
                  url:"${pageContext.request.contextPath}/mypage/jjim_select.do?item_no="+itemnum,
                  type:'POST'
               });
            } else {
               $("#jjim-btn").removeClass("jjim-on");
               $("#jjim-btn").addClass("jjim-off");
               e.preventDefault();
               itemnum = ${output.item_no};
               
               $.ajax({
                  url:"${pageContext.request.contextPath}/mypage/jjim_cancel.do?item_no="+itemnum,
                  type:'DELETE'
               });
            }
         })
      });

      
      



      /************* 옵션창 클릭시 *************/

      $(function(){
         $("#sendurl").click(function(e){
            e.preventDefault();
            var opt = $("#options").val();
            if(!opt) {
               alert("옵션을 선택해주세요");
            }          
            else { 
               $(function(){
                  $("#sendurl").click(function(e){
                           e.preventDefault();
                           var itemnum = new Array();
                           itemnum = ${output.item_no};
                           location.href = "${pageContext.request.contextPath}/order/order.do?item_no="+itemnum;
                        });
               });
            }
         });
      });
      
      $(function(){
         $("#sendurl2").click(function(e){
            e.preventDefault();
            var opt = $("#options").val();
            if(!opt) {
               alert("옵션을 선택해주세요");
            }          
            else { 
               $(function(){
                  $("#sendurl2").click(function(e){
                           e.preventDefault();
                           swal({
                                    title : "장바구니로 이동하여 구매 가능합니다.",
                                    confirmButtonColor : "#620080",
                                    showCancelButton : true,
                                    cancelButtonColor : "#888",
                                    confirmButtonText : "확인",
                                    cancelButtonText : "닫기",
                                    reverseButtons : true
                                 }).then(function(result) {
                                    // 확인 버튼 클릭 시 페이지 이동
                                    if (result.value) {
                                       var itemnum = ${output.item_no};
                                 var opt_select=$("#options option:selected").val();
                                 location.href = "${pageContext.request.contextPath}/mypage/cartList.do?item_no="+itemnum+"&opt_no="+opt_select;
                                    }
                                 });
                  });
                        });
            
            }
         });
      });
      
      /*************** 옵션선택 *****************/
      $(function(){
         $("#sendurl1").click(function(e){
            e.preventDefault();
            var opt = $("#options").val();
            if(!opt) {
               alert("옵션을 선택해주세요");
            }          
            else { 
               $(function(){
                  $("#sendurl1").click(function(e){
                           e.preventDefault();
                           var itemnum = ${output.item_no};
                           var opt_select=$("#options option:selected").val();
                           location.href = "${pageContext.request.contextPath}/mypage/cartList.do?item_no="+itemnum+"&opt_no="+opt_select;
                        });
               });
            }
         });
      });
      
      /************* 옵션창 클릭시 종료 *************/

      $(function(){
      $("#options").change(function(){
         var opt_select=$("#options option:selected").text();
         $("#textarea1").val(opt_select);
      });
   });
         $(function(){
      $("#options").change(function(){
         var val=parseInt($("#options option:selected").text());
         var price= parseInt(${output.item_price-(output.item_price*output.item_discount/100)});
         var total= (val+price);


         $("#textarea2").val(total);
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
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
<title>취소신청</title>
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
   href="${pageContext.request.contextPath}/css/myOrderCancel.css">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
   <div id="container">
      <!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
      <%@ include file="../inc/head.jsp"%>
      <div id="private-header">
         <button type="button" class="btn-back"
            onclick="history.back();return false;">뒤로가기</button>
         <h2>취소신청</h2>
      </div>
	<div id="cancel-product-date">
         <span>${output.orders_date} [${orders_number}]</span>
      </div>
      <div id="content">
         <!-- -------------햄버거 메뉴 시작------------ -->
         <%@ include file="../inc/hamMenu.jsp"%>
         
         <!-- -------------최근 본 상품 시작------------ -->
         <%@ include file="../inc/recentItem.jsp"%>
         <!-- -------------최근 본 상품 끝----------- -->
         
         <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
         <%@ include file="../inc/fixed.jsp"%>

         <!-- 오더 취소 페이지 시작 -->
         <div id="cancel-product">
            <div id="cancel-product-title">주문상품</div>
            <ul>

               <li>
                  <div class="list-thumbnail left-area">
                     <span class="img-area"
								style="background-image: url(${item.origin_name})"></span>
                  </div>
                  <div class="list-desc">
                     <p class="list-brand">[${output.item_brand}]</p>
                     <p class="list-product-name">${output.item_name}</p>
                     <p class="list-product-desc">${spec}</p>
                     <p class="list-product-price">
                        <fmt:formatNumber pattern="###,###,###"
                           value="${output.item_price}" />
                        원
                     </p>
                  </div>
               </li>

            </ul>
         </div>
         <div id="cancel-price">
            <div id="cancel-price-title">
               <span>취소상품 총 환불금액</span>
            </div>
            <div id="total-product-price">
               <div id="inner-price-info">총 상품금액</div>
               <div id="inner-price-desc">
                  <fmt:formatNumber pattern="###,###,###"
                     value="${output.item_paymen}" />
                  원
               </div>
            </div>
            <div id="total-deliver-price">
               <div id="inner-deliver-info">총 배송비</div>
               <div id="inner-deliver-desc">
                  <fmt:formatNumber pattern="###,###,###"
                     value="${output.ord_delivery}" />
                  원
               </div>
            </div>
         </div>
         <div id="cancel-link-button">
            <div id="cancel-back">
               <a
                  href="${pageContext.request.contextPath}/mypage/myOrderDetail.do"
                  class="offbtn1">취소</a>
            </div>
            <div id="link-cancel-submit">
               <button type="button" class="okbtn">취소신청</button>
            </div>
         </div>
      </div>
      <!--고정 footer-->
      <%@ include file="../inc/footer.jsp"%>
   </div>
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
   <script type="text/javascript">
      $(function() {
         $("#link-cancel-submit").click(function(e) {
        	 	e.preventDefault();
                        swal({
                           title : "취소하시겠습니까?",
                           text : "주문이 취소됩니다",
                           showCancelButton : true,
                           confirmButtonColor : '#620080',
                           cancelButtonColor : '#888',
                           confirmButtonText : '주문취소',
                           cancelButtonText : '닫기',
                           reverseButtons : true,
                        })
                              .then(
                                    function(result) {
                                       if (result.value) {
                                          location.href="${pageContext.request.contextPath}/myPage/myOrderCancle_ok.do?ord_no=" + ${output.ord_no};
                                       }
                                    });
                     });
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
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
<title>주문상세</title>
<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon"
   href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
   href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
<!--bootstrap-->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
<!-- 가격 구분 폰트 -->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
   rel="stylesheet">

<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
   rel="stylesheet">

<!-- 각 페이지 별로 css 넣기-->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/myOrderDetail.css">

</head>

<body>
   <div id="container">
      <%@ include file="../inc/head.jsp"%>
      
      <!--각페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
      <div id="private-header">
         <button type="button" class="btn-back"
            onclick="history.back();return false;">뒤로가기</button>
         <h2>주문 상세</h2>
      </div>
      
         <!-- -------------햄버거 메뉴 시작------------ -->
         <%@ include file="../inc/hamMenu.jsp"%>
         <!-- -------------햄버거 메뉴 끝------------ -->
      
      
         <!-- -------------최근 본 상품 시작------------ -->
         <%@ include file="../inc/recentItem.jsp"%>
         <!-- -------------최근 본 상품 끝----------- -->
         
         <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
         <%@ include file="../inc/fixed.jsp"%>


         <!-- 오더 상세페이지 시작 -->
         <div id="order-detail-title">
            <div id="order-id">
               <div>${output.orders_date}</div>
               <div>[${orders_number}]</div>
            </div>
            <div id="order-status">
               <div id="order-status-option">배송완료</div>
               <div id="order-deliver-date">${output.orders_date}</div>
            </div>
         </div>
         <div id="address-info">
            <div id="address-info-title">
               <div>배송지</div>
            </div>
            <div id="address-info-detail">
               <div id="info">
                  <div>받으실분</div>
                  <div>연락처</div>
                  <div>배송주소</div>
                  <div>베송메모</div>
               </div>
               <div id="desc">
                  <div>${output.mem_name}</div>
                  <div>${output.mem_tel}</div>
                  <div>${output.mem_postcode},${output.mem_addr1},${output.mem_addr2}</div>
                  <div>${output.ord_memo}</div>
               </div>
            </div>
         </div>
         <div id="order-product">
            <div id="order-product-title">
               <div>주문상품</div>
            </div>
            <ul>

               <li>
                  <div class="list-thumbnail left-area">
                     <span class="img-area" style="background-image: url(${output.origin_name})"></span>
                  </div>
                  <div class="list-desc">
                     <p class="list-brand">${output.item_brand}</p>
                     <p class="list-product-name">${output.item_name}</p>
                     <p class="list-product-desc">${spec}</p>
                     <p class="list-pro-option">옵션 : ${output.opt_name}</p>
                    <c:if test="${output.ord_status == 'F' }">
                           <p class="status-cel">취소상품</p>
                        </c:if>
                        
                        <div class="link-button-parent">
                           <a
                              href="${pageContext.request.contextPath}/review/write.do?ord_no=${output.ord_no}">상품평
                              작성</a> <a
                              href="${pageContext.request.contextPath}/myPage/myOrderCancle.do?ord_no=${output.ord_no}">상품
                              취소</a>
                        </div>
                     <p class="list-product-price"><fmt:formatNumber pattern="###,###,###"
                              value="${output.item_price}" />원</p>
                  </div>
               </li>


            </ul>
         </div>
         <div id="payment-info">
            <div id="payment-title">결제정보</div>
            <div id="payment-credit">
               <p id="credit-card">
                  <c:choose>
                     <c:when test="${output.ord_bank == '1'}">우리은행</c:when>
                     <c:when test="${output.ord_bank == '2'}">신한은행</c:when>
                     <c:when test="${output.ord_bank == '3'}">카카오은행</c:when>
                     <c:when test="${output.ord_bank == '4'}">기업은행</c:when>
                  </c:choose>
               </p>
               <div id="credit-card-desc">${output.ord_payer}</div>
            </div>
         </div>
         <div id="total-price">
            <div id="total-price-title">총 결제금액</div>
            <div id="total-price-detail">
               <div id="price-info">
                  <div>총 상품금액</div>
                  <div>총 배송비</div>
                  <div>총 할인금액</div>
                  <div>POINT 적립</div>
               </div>
               <div id="price-desc">
                  <div><fmt:formatNumber pattern="###,###,###"
                              value="${output.item_price}" />원</div>
                  <div><fmt:formatNumber pattern="###,###,###"
                              value="${output.ord_delivery}" />원</div>
                  <div><fmt:formatNumber pattern="###,###,###"
                              value="${output.dis_price}" />원</div>
                  <div><fmt:formatNumber pattern="0.0" type="number" maxFractionDigits="0" 
                              value="${output.total_price*0.005}" />P</div>
               </div>
            </div>
            <div id="total-price-view">
               <div id="view-info">총 결제금액</div>
               <div id="view-price"><fmt:formatNumber pattern="###,###,###"
                              value="${output.total_price}" />원</div>
            </div>
         </div>
         <div id="payment-info-detail">
            <nav id="accordian">
               <ul>
                  <li id="accordian-detail"><a>결제상세<img class="item"
                        src="../img/arrow-down.png" data-over="../img/arrow-up.png"></a>
                     <ul>
                        <li>
                           <div id="accordian-detail-info">
                              <div>상품금액</div>
                              <div>배송비</div>
                              <div class="info-small">- 기본 배송비</div>
                              <div>총 할인금액</div>
                              <div class="info-small">- 쿠폰</div>
                              <div class="info-small">- 카드할인</div>
                              <div>POINT 적립</div>
                           </div>
                           <div id="accordian-detail-desc">
                              <div><fmt:formatNumber pattern="###,###,###"
                              value="${output.item_price}" />원</div>
                              <div><fmt:formatNumber pattern="###,###,###"
                              value="${output.ord_delivery}"/>원</div>
                              <div class="info-small">+2,500원</div>
                              <div><fmt:formatNumber pattern="###,###,###"
                              value="${output.dis_price}" />원</div>
                              <div class="info-small">0원</div>
                              <div class="info-small">0원</div>
                              <div><fmt:formatNumber pattern="0.0" type="number" maxFractionDigits="0" 
                              value="${output.total_price*0.005}" />P</div>
                           </div>
                        </li>
                     </ul></li>
               </ul>
            </nav>
         </div>
         <div id="go-to-backpage">
            <a href="${pageContext.request.contextPath}/mypage/myOrderList.do"
               class="okbtn1">목록</a>
         </div>
      </div>
      <!--고정 footer-->
   <%@ include file="../inc/footer.jsp"%>
   
   <!-- 부트 스트랩 Javascript // 탭 메뉴 필요할때만, 아니면 빼기 -->
   <script
      src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
   <script>
      $(function() {
         $("#accordian a").click(function() {
            var temp = $(".item").attr('src');
            var over = $(".item").data('over');
            $(".item").attr('src', over);
            $(".item").data('over', temp);
            $("#accordian ul ul").slideUp();
            if (!$(this).next().is(":visible")) {
               $(this).next().slideDown();
            }
         })
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
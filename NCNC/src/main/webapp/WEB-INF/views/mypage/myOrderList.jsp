<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,
            maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <title>주문배송내역</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <!-- 가격 구분 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myOrderList.css" />
</head>

<body>
    <div id="container">
       <%@ include file="../inc/head.jsp"%>
       
        <div id="private-header">
            <button type="button" class="btn-back" onclick="history.back();return false;">뒤로가기</button>
            <h2>주문/배송내역</h2>
        </div>
       <!--  <div id="myorder-select">
            <div id="dropdown-container">
                <div id="dropdown1">
                    <select class="form-control" id="select-date">
                        <option>주문내역 기간</option>
                        <option>1일전</option>
                        <option>1주일전</option>
                        <option>1개월전</option>
                        <option>6개월전</option>
                    </select>
                </div>
                <div id="dropdown2">
                    <select class="form-control" id="select-status">
                        <option>주문상태</option>
                        <option>결제완료</option>
                        <option>배송중</option>
                        <option>배송완료</option>
                    </select>
                </div>
            </div>
            <div id="order-search-bar">
                <input type="text" name="order-search-bar" />
                <a href="#" class="btn-search-icon">검색</a>
            </div>
        </div> -->
        <div id="myorder-content">
          <!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>
			<!-- -------------햄버거 메뉴 끝------------ -->
			
           <!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- -------------최근 본 상품 끝----------- -->
			
            <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
            <div class="myorder-title">
                <div class="myorder-detail">
                     <c:choose>
                    	<%-- 구매한 제품이 없는 경우 --%>
                    	<c:when test="${output == null || fn:length(output) == 0}">
                    		<p style="padding:15px;text-align:center;"> <br/><br/>구매한 상품이 없습니다.<br/><br/> </p>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="item" items="${output}" varStatus="status">
                    		<div class="myorder-date">
			                    <div class="myorder-day">${item.orders_date}</div>
                    			<div class="detail-link">
                    				<c:url value="/mypage/myOrderDetail.do" var="modetail">
                    					<c:param name="ord_no" value="${item.ord_no}"></c:param>
                    				</c:url>
                       				 <a href="${pageContext.request.contextPath}/mypage/myOrderDetail.do?ord_no=${item.ord_no}">
                           				 주문상세<img src="../img/arrow-right.png">
                        			 </a>
                    			</div>
                    			</div>
                   	 <div id="myorder-list">
             		   <ul>
                  		  <li>
                    		<%-- 조회결과에 따른 반복처리 --%>
                    		
                    		<div class="list-thumbnail left-area">
                    			<span class="img-area"
								style="background-image: url(${item.origin_name})"></span>
                    		</div>
                    		<div class="list-desc">
                    			<p class="list-brand">${item.item_brand}</p>
                           		 <p class="list-product-name">${item.item_name}</p>
                           		 <p class="list-product-desc">${item.item_cpu}/${item.item_inch}/${item.item_ram}/${item.item_os}/${item.item_weight}/${item.item_graphic}/${item.item_ssd}/${item.item_hdd}</p>
                           		 <p class="list-product-price"><fmt:formatNumber pattern="###,###,###"
										value="${item.total_price}"/>원</p>
                           	 </div>
							</li>
							
               			 </ul>
         			   </div>
         			   </c:forEach>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
       <%@ include file="../inc/footer.jsp" %>
    </div>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
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
            $(function(){
 	           $("#keyword").click(function(){
 	              location.href="${pageContext.request.contextPath}/search/search.do";
 	           });
 	        });
    </script>
</body></html>
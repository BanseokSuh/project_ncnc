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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <title>주문완료</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <!-- 가격 구분 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">
 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderResult.css">
</head>

<body>
    <div id="container">
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
       
        <div id="private-header">
            
            <h2>주문완료</h2>
        </div>
        <div id="order-success">
            <div>상품 주문이<br>완료되었습니다.</div>
        </div>
        <div id="order-desc">
            <p>주문 확인 및 취소는<br />주문 내역 페이지에서 확인하실 수 있습니다.</p>
        </div>
        <div id="order-link-button">
            <div id="link-orderList">
                <a href="${pageContext.request.contextPath}/mypage/myOrderList.do" class="offbtn1">주문내역 보기</a>
            </div>
            <div id="link-index">
                <a href="${pageContext.request.contextPath}/home.do" class="okbtn">홈으로 가기</a>
            </div>
        </div>
        <div id="review-point-desc">
            <span>상품평을 남겨주시면 point 100p를 적립해 드립니다.</span>
        </div>
        <!--고정 footer-->
	<%@ include file="../inc/footer.jsp"%>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js">
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>

</html>
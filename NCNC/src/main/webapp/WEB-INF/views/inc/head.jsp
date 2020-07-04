<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<title>Insert title here</title>
</head>
<body>
	<!-- 고정 header -->
      <div id="header" class="header-wrap">
            <div class="logo-search-wrap">
                <h1 class="logo">
                	<a href="${pageContext.request.contextPath}/home.do" data-sc-action="topbar.click" data-dimension-name="topbar.name" data-dimension-value="Topbar^lalavla">
                		<img src="${pageContext.request.contextPath}/img/logo4.png" alt="랄라블라 로고">
                	</a>
                </h1>
                <form method="get" class="inp-search">
                    <input type="search" name="keyword" placeholder="니컴이 내컴이고 내컴이 니컴이다." id="keyword" value="${keyword}"/>
                    <button type="submit" class="btn-search">검색</button>
                </form>
                <a href="${pageContext.request.contextPath}/mypage/cartList.do" class="btn-basket">장바구니 바로가기</a>
            </div>
        </div>
</body>
</html>
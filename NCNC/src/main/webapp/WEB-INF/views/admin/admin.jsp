<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html lang="ko">

<head>

<!-- ??? -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Bootstrap -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<!-- jQuery -->
<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- 모바일 웹 페이지 아이콘 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />

<!-- 가격 구분 폰트 참조 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">

<!--외부 css 참조-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />

<!--중고거래 스와이프 폴러그인-->
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<title>니컴내컴 관리자</title>

</head>

<body>
	<div id="container">
		<div>
			<a href="#">회원관리</a>
		</div>
		<div>
			<a href="#">상품관리</a>
		</div>
		<div>
			<a href="#">뉴스관리</a>
		</div>
		<div>
			<a href="#">이벤트관리</a>
		</div>
	</div>

</body>
</html>
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
	<div id="fixed-q-menu">
         <ul>
            <li><a href="#" id="hamburger" class="show_hide"><img
                  src="../img/menu.png"></a></li>
            <li><a href="${pageContext.request.contextPath}/qmenu/qEvent.do"><img
                  src="../img/event.png"></a></li>
            <li><a href="${pageContext.request.contextPath}/mypage/myPage.do"><img
                  src="../img/mypage.png"></a></li>
            <li><a href="${pageContext.request.contextPath}/mypage/jjim.do"><img src="../img/jjim.png"></a></li>
            <li><a href="#" id="newpro"><img
                  src="../img/chronometer.png"></a></li>
         </ul>
      </div>
</body>
</html>
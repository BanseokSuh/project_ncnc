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
	<div id="footer">
		<div id="footer-button">
			<!--로그인되어있으면 로그아웃/ 로그아웃 되어있으면 로그인-->
			<c:choose>
				<c:when test="${member == null}">
					<div class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/login/login.do">로그인</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="pull-left text-center">
				<a href="${pageContext.request.contextPath}/login/login.do">로그아웃</a>
			</div>
				</c:otherwise>
			</c:choose>
			
			<div class="pull-left text-center">
				<a href="${pageContext.request.contextPath}/center/customService.do">고객센터</a>
			</div>
		</div>
		<div id="footer-explain" class="clear">
			<ul>
				<li class="pull-left"><a href="#">이용약관</a></li>
				<li class="pull-left"><a href="#">개인정보처리방침</a></li>
				<li class="pull-left"><a href="#">청소년보호정책</a></li>
			</ul>
		</div>
		<div id="copyright" class="clear">
			<address>
				대표 : 김나래<br> 사업자 등록번호 : 000-00-00000<br> 주소 : 울릉군 울릉읍 독도리<br>
				통신판매업 등록번호 : 2014-서울강남-00000호<br> 대표전화 : 1566-5588
			</address>
			<p>copyright ⓒ all ncnc all right.<br/>( 학생용 포프폴리오 입니다. 실제 운영을 위한 사이트가 아님에 착오 없으시길 바랍니다.)</p>
		</div>
	</div>
</body>
</html>
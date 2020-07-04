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
	<div id="side-wrap" class="side-wrap">
		<nav id="sidenav">
			<span class="close-sidenav">&times;</span>
			<div id="ham-container">
				<div id="ham-header">
					<div id="ham-first">
						<!--ham-name은 로그인 했을때 해당 회원이름-->
						<div id="ham-name">
							<c:choose>
								<c:when test="${member == null }">
									<span class="welcom">로그인 해주세요</span>
								</c:when>
							<c:otherwise>
								<strong class="ham-name-big">${member.mem_name}</strong>
								<span class="welcom">님 안녕하세요.</span>
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div id="ham-second">
						<ul id="ham-second-inner">
							<li id="link-mypage"><a href="${pageContext.request.contextPath}/mypage/myPage.do"> <span
									class="link-desc">마이페이지</span>
							</a></li>
							<li id="link-jjim"><a href="${pageContext.request.contextPath}/mypage/jjim.do"> <span class="link-desc">찜한상품</span>
									
							</a></li>
							<li id="link-coupon"><a href="${pageContext.request.contextPath}/mypage/myCoupon.do"> <span
									class="link-desc">쿠폰</span> 
							</a></li>
						</ul>
					</div>
				</div>
				<div id="ham-content">
					<div id="ham-body">
						<ul>
							<li><a href="${pageContext.request.contextPath}/item/hPrdList/hPrdUni.do">대학생용</a></li>
							<li><a href="${pageContext.request.contextPath}/item/hPrdList/hPrdBuss.do">비지니스용</a></li>
							<li><a href="${pageContext.request.contextPath}/item/hPrdList/hPrdGaming.do">게이밍</a></li>
							<li><a href="${pageContext.request.contextPath}/item/hPrdList/hPrdGraphic.do">그래픽작업</a></li>
							<li><a href="${pageContext.request.contextPath}/item/hPrdList/hPrdLight.do">초경량</a></li>
							<li><a href="${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do">영상편집</a></li>
						</ul>
					</div>
					<div id="ham-footer">
						<div id="ham-footer-first">
							<ul class="list-inline">
								<li><a href="${pageContext.request.contextPath}/qmenu/qNews.do">뉴스</a></li>
								<li><a href="${pageContext.request.contextPath}/center/customService.do">공지사항</a></li>
								<li><a href="${pageContext.request.contextPath}/qmenu/qEvent.do">이벤트</a></li>
							</ul>
						</div>
						<div id="ham-footer-second">
							<ul class="ham-footer-inner">
							<c:choose>
								<c:when test="${member == null }">
									<li><a href="${pageContext.request.contextPath}/login/login.do">로그인</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageContext.request.contextPath}/login/login.do">로그아웃</a></li>
								</c:otherwise>
							</c:choose>
								
								<li><a href="${pageContext.request.contextPath}/center/customService.do">고객센터</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
	</div>
</body>
</html>
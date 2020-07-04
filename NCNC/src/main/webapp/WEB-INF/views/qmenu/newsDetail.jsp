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
    <title>뉴스 상세페이지</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <!-- 가격 구분 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">
    <!-- 외부 파일 참조 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/newsDetail.css">
</head>

<body>
    <div id="container">
    
    <!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp" %>
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요 끝-->
		
        <div class="nD-content">      
        <!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp" %>
			<!-- -------------햄버거 메뉴 끝------------ -->

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp" %>
			<!-- -------------최근 본 상품 끝----------- -->

			<!--메인 퀵메뉴/ 햄버거 상품목록페이지에서는 숨기기 / 스크롤을 밑으로 내릴때 헤더는 사라지고 퀵메뉴만 노출 -->
			<div id="quick-menu" class="text-center clear">
				<!--탭 기능-->
				<ul>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/home.do">홈</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qPrdList.do">노트북</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qNews.do" class="atvthis">뉴스</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qBest.do">베스트</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qEvent.do">이벤트</a>
					</li>
				</ul>
				<!--탭 기능 끝-->
			</div>
			<!--메인 퀵메뉴/ 햄버거 상품목록페이지에서는 숨기기 / 스크롤을 밑으로 내릴때 헤더는 사라지고 퀵메뉴만 노출 끝-->
			
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp" %>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능 끝-->

			<!----------------newsDetail 화면 시작--------------------->                      
        	<!-- 헤더 시작-->
        	<div id="news-detail-header">
            	<button type="button" class="btn-back" onclick="history.back(); return false;">뒤로가기</button>
            	<h2>니컴 뉴스</h2>
        	</div>
        	<!-- 헤더 끝 -->
        
        	<!-- 내용 시작-->
        	<div id="news-detail-section">
            	<div id="news-detail-title">
                	<div class="news-title">${output.doc_title}</div>
                	<div id="news-detail-body" class="dis-root">
                    	<p class="news-writer">관리자</p>
                    	<p class="news-date pull-left">${output.reg_date}</p>
                    	<p class="see-tit pull-left">조회: <span class="see-num">${output.doc_hit}</span></p>
                	</div>
            	</div>
            	<div id="news-detail-content">
                	<div id="news-detail-img">
                    	<img src="${pageContext.request.contextPath}/img/${output.origin_name}" alt="뉴스">
                	</div>
                	<div id="news-detail-text">
                	
                    	${output.doc_contents}<br>
                    
                	</div>
            	</div>

            </div>
			<!-- 내용 끝 -->     
			<!----------------newsDetail 화면 끝--------------------->

            <!--고정 footer-->
		<%@ include file="../inc/footer.jsp" %>
		<!--고정 footer 끝-->

			<!--탑버튼-->
			<div id="top_wrap">
				<a href="#top"><img src="../img/arrow-up2.png"></a>
			</div>
			<!--탑버튼 끝-->
			
		</div><!-- //content -->
	</div><!-- //container -->

    <!-- Javascript -->
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function() {
        	
            /* -----햄버거 사이드 메뉴 열기----  */

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
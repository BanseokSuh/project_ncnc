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
    <title>이벤트</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">
    <!-- bootstrap -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qEvent.css" />
    <!-- 모달창 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
    <div id="container">
        
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp" %>
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요 끝-->
		
		<div class="qE-content">
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
						<a href="${pageContext.request.contextPath}/qmenu/qNews.do">뉴스</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qBest.do">베스트</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qEvent.do" class="atvthis">이벤트</a>
					</li>
				</ul>
				<!--탭 기능 끝-->
			</div>
			<!--메인 퀵메뉴/ 햄버거 상품목록페이지에서는 숨기기 / 스크롤을 밑으로 내릴때 헤더는 사라지고 퀵메뉴만 노출 끝-->
			
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp" %>
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능 끝-->

			<!----------------qEvent 화면 시작--------------------->
            <div id="pE-header">
                <h2>니컴 이벤트</h2>
            </div>
            <div class="tab comtab" id="tab-btn">
                <ul class="nav nav-tabs" id="tab-ul">
                    <li class="pull-left active"><a href="#p-open-event-list" data-toggle="tab">진행중인 이벤트</a></li>
                    <li class="pull-left"><a href="#p-close-event-list" data-toggle="tab">종료된 이벤트</a></li>
                </ul>
            </div>
            <div class="cnct-content tab-content">
                <div id="p-open-event-list" class="tab-pane fade in active">
                	<c:forEach var="open" items="${output}" varStatus="status">
						<%-- 상세페이지로 이동하기 위한 URL --%>
						<c:url value="/qmenu/eventDetail.do" var="viewUrl">
							<c:param name="doc_no" value="${open.doc_no}" />
						</c:url>
                    	<ul>
							<li>
								<a href="${viewUrl}">
									<span class="title-area pull-left">
										<strong class="title pull-left">${open.doc_title}</strong>									
										<!--<span class="sub-txt clear">${open.doc_contents}</span>-->
									</span>
									<span class="date-area pull-right">
										<span class="cust-event-time" id="d-day">진행중</span>
									</span> 
									<span>
										<img src="${pageContext.request.contextPath}/img/${open.origin_name}" alt="이벤트 썸네일">
									</span>
								</a>
							</li>
						</ul>
                    </c:forEach>
                </div>
                <!-- 종료된 이벤트 컨텐츠 -->
                <div id="p-close-event-list" class="tab-pane in fade">
                	<c:forEach var="close" items="${output2}" varStatus="status">
                	<%-- 상세페이지로 이동하기 위한 URL --%>
						<c:url value="/qmenu/eventDetail.do" var="viewUrl">
							<c:param name="doc_no" value="${close.doc_no}" />
						</c:url>
                    	<ul>
                        	<li>
                            	<a href="#">
                                	<span class="title-area pull-left">
                                		<strong class="title pull-left">${close.doc_title}</strong>
                                		<!--<span class="sub-txt clear">${close.doc_contents}</span>-->
                                	</span>                               
                                	<span class="date-area pull-right">
                                		<span class="cust-event-time">종료</span>
                                	</span>                                   
                                	<span>
                                		<img src="${pageContext.request.contextPath}/img/${close.origin_name}" alt="이벤트 썸네일">
                                	</span>
                                </a>    
                            </li>   
                         </ul>   
                    </c:forEach>  
                 </div>
            </div>       
            <!----------------qEvent 화면 끝--------------------->            
                        
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
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>
    <!--내가 쓰는 자바스크립트-->
    <script type="text/javascript">
    $(function() {

        $("#p-close-event-list a").click(function() {
            swal('종료된 이벤트', '다음 이벤트를 이용해주세요', 'info');
        });
        
        /* 
        
        var countDownDate = new Date("${open.doc_day}").getTime();
        
        setInterval(function() {
        
        	// 오늘 날짜 등록 
        	var now = new Date().getTime(); 
        
        	// 종료일자에서 현재일자를 뺀 시간 
        	var distance = countDownDate - now;

        	var d = Math.floor(distance / (1000 * 60 * 60 * 24));

        	//id가 d-day인 HTML코드에 내용 삽입
        	document.getElementById("d-day").innerHTML = "D-" + d;
        });  
        
        */

        	
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

        /* -----`#all_check`의 선택 상태가 변경되었을 때의 이벤트----  */
        
        $("#all_check").change(function() {
            // 모든 `.hobby`의 선택 상태를 `#all_check`와 동일하게 맞춘다.
            $(".del-check").prop('checked', $(this).prop('checked'));
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
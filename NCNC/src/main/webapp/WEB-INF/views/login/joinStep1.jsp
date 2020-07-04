<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport"
   content="width=device-width, initial-scale=1.0,
            maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Bootstrap -->
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>joinStep1.jsp</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href=".../img/logo4.png" />

<!-- 나눔고딕 웹 폰트 적용 -->

<!--<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">-->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
   rel="stylesheet">

<!-- CSS 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/joinStep1.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
   <div id="container">
   		<!-- 공통 헤더 -->
      	<%@ include file="../inc/head.jsp" %>

      <!-- 뒤로가기 포함한 top -->
      <div class="top">
         <button type="button" class="btn-back" onclick="history.back();">뒤로가기</button>
         <h2>약관동의</h2>
      </div>

      <!-- 이용약관, 회원가입 탭 -->
      <div class="tab comtab" id="tab-btn">
         <ul class="nav nav-tabs" id="tab-ul">
            <li class="pull-left active"><a href="#" data-toggle="tab"
               disabled="true">이용약관</a></li>
            <li class="pull-left" disabled="true"><a href="#"
               data-toggle="tab">회원가입</a></li>
         </ul>
      </div>

      <!-- 메인 컨텐츠 -->
      <div class="contents">
         <div class="contents_wrap">
            <div class="inner">
               <div class="text">
                  <p class="main_text">
                     니컴내컴 홈페이지<br>회원가입을 환영합니다.
                  </p>
                  <p class="sub_text">
                     니컴내컴 홈페이지의 회원이 되시면 다양한 정보와 포인트, 쿠폰을 이용하실 수 있으며, 회원등급에 따라 혜택을 받으실
                     수 있습니다.<br> <br> 회원가입 절차가 연령에 따라 다르오니, 해당되는 회원가입 유형을
                     선택하여 진행하여 주세요.
                  </p>
               </div>

               <!-- 하단 버튼 -->
               <div class="btn">
                  <a href="${pageContext.request.contextPath}/login/joinStep2_child.do" class="offbtn1">만 14세 미만 회원가입</a> <a
                     class="okbtn" href="${pageContext.request.contextPath}/login/joinStep2_adult.do">만 14세 이상 회원가입</a>
               </div>
               <div class="notice">
                  <p>* 만 14세 미만 개인 여러분도 누구나 회원으로 가입하실 수 있습니다. 부모님(법정대리인)과 함께 가입을
                     진행해주세요.</p>
               </div>
            </div>
         </div>
      </div>

      <!--고정 footer-->
      <%@ include file="../inc/footer.jsp" %>

      <!--탑버튼-->
      <div id="top_wrap">
         <a href="#top"><img src="${pageContext.request.contextPath}/img/arrow-up2.png"></a>
      </div>


      <!-- -------------햄버거 메뉴 시작------------ -->
      <%@ include file="../inc/hamMenu.jsp" %>

      <!-- -------------햄버거 메뉴 끝------------ -->


      <!-- -------------최근 본 상품 시작------------ -->
      <%@ include file="../inc/recentItem.jsp" %>
      <!-- -------------최근 본 상품 끝----------- -->


      <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
      <%@ include file="../inc/fixed.jsp" %>
      
   </div>
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

         /* `#all_check`의 선택 상태가 변경되었을 때의 이벤트 */
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
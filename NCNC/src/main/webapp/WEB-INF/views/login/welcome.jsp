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

<title>welcome.jsp</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="../img/logo4.png" />

<!-- 나눔고딕 웹 폰트 적용 -->
<!--<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">-->
<link
   href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
   rel="stylesheet">

<!-- CSS 참조 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/welcome.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
   <div id="container">
      <!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
      <%@ include file="../inc/head.jsp" %>
      <div class="top">
         <button type="button" class="btn-back" onclick="history.back();">뒤로가기</button>

         <h2>가입완료</h2>
         <hr>
      </div>
      <div class="contents">
         <div class="contents_wrap">
            <div class="inner">
               <div class="input_img">
                  <img src="../img/logo4.png" />
               </div>
               <div class="text">
                  <p class="main_text">
                     축하합니다!<br>가입이 완료되었습니다.
                  </p>
                  <p class="sub_text">
                     니컴내컴 고객님을 위해<br>최선을 다하겠습니다.
                  </p>
               </div>
               <div class="btn">
                  <a class="okbtn" href="#">홈으로</a>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!--고정 footer-->
   <%@ include file="../inc/footer.jsp" %>
   <!--탑버튼-->
   <div id="top_wrap">
      <a href="#top"><img src="../img/arrow-up2.png"></a>
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


   <script src="../assets/js/jquery.min.js"></script>
   <script src="../assets/js/bootstrap.min.js"></script>
   <script src="../plugins/sweetalert/sweetalert2.all.min.js"></script>
   <script src="../plugins/sweetalert/sweetalert2.min.js"></script>
   <script type="text/javascript">
     $(function(){
    	 $(".okbtn").click(function(e){
    		 e.preventDefault();
    		 swal({
                 title : "홈으로 이동하시겠습니까?",
                 text : "홈으로 이동합니다.",
                 showCancelButton : true,
                 confirmButtonColor : "#620080",
                 cancelButtonColor : "#888",
                 confirmButtonText : "확인",
                 cancelButtonText : "닫기",
                 reverseButtons : true,
    		 }).then(function(result){
    			 if(result.value)
    		 		location.href="${pageContext.request.contextPath}/home.do";
    		 });
    	 });
     });

      $(function() {
         $(".offbtn1").click(function() {
            swal({
               title : "로그인하시겠습니까?",
               text : "로그인 페이지로 이동합니다.",
               showCancelButton : true,
               confirmButtonColor : "#620080",
               cancelButtonColor : "#888",
               confirmButtonText : "로그인페이지로",
               cancelButtonText : "닫기",
               reverseButtons : true,
            }).then(function(result) {
               if (result.value) {
                  location.href = "../KE/login.html";
               }
            });
         });

         /******************* 하단 바 *******************/
         /* -----햄버거 사이드 메뉴 열기----  */

         $("#hamburger").click(function() {
            $("#sidenav").css("left", "0");
            $("#side-wrap").addClass("dark");
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

         /* ——최근 본 상품 > 휴지통——  */

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
         /******************* 하단 바 끝 *******************/
      });
      $(function(){
          $("#keyword").click(function(){
             location.href="${pageContext.request.contextPath}/search/search.do";
          });
       });
   </script>
</body>
</html>
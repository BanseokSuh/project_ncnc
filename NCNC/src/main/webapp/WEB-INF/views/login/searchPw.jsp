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
    <title>비밀번호 찾기</title>
    <!--모바일 웹 페이지 설정-->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <!--구글 웹 폰트 적용-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">
    <!-- 가격 구분 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">
    <!--외부 CSS 파일 참조-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/searchPw.css">
    <!--Sweetalert CSS-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
    <div id="container">
        <!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
       <%@ include file="../inc/head.jsp" %>
        <!-- //고정 header-->
        <div id="content">
           <!-- -------------햄버거 메뉴 시작------------ -->
            <%@ include file="../inc/hamMenu.jsp" %>
            <!-- -------------햄버거 메뉴 끝------------ -->
           

            <!-- -------------최근 본 상품 시작------------ -->
            <%@ include file="../inc/recentItem.jsp" %>
            <!-- -------------최근 본 상품 끝----------- -->


            <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
            <%@ include file="../inc/fixed.jsp" %>
            <!--각 페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
            <div id="page-header">
                <button type="button" class="btn-back" onclick="history.back(); return false;">뒤로가기</button>
                <h2>아이디/비밀번호 찾기</h2>
            </div>
            <!-- 탭 메뉴 시작 -->
            <div class="search-tab">
                <ul>
                    <li>아이디 찾기</li>
                    <!--
                    -->
                    <li class="on">비밀번호 찾기</li>
                </ul>
            </div>
            <!--탭의 내용 시작-->
            <div class="tab-content">
                <div class="tab-pane fadein active" id="searchPw">
                    <h4 class="header-tab"><br>본인명의 이메일주소로 인증</h4>
                    <p class="lead-tab">
                        회원님의 명의로 등록된 이메일로<br>
                        가입여부 및 본인여부를 확인합니다.
                    </p>
                    <form name="log_form" id="log_form" method="post" action="${pageContext.request.contextPath}/login/searchPw_ok.do">
                        <div class="form-group">
                            <input type="text" id="user_id" name="mem_id" class="form-control" placeholder="아이디" />
                            <input type="text" id="user_name" name="mem_name" class="form-control" placeholder="이름" />
                            <div class="email">
                                <input type="text" id="random-inp" name="mem_email" placeholder="이메일주소" />
                            </div>
                            <div id="search_pw" class="form-group">
                                <button type="submit" class="okbtn">확인</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><!-- //탭의 내용 끝-->
        </div><!-- //content-->
        <!--고정 footer-->
        <%@ include file="../inc/footer.jsp" %>
        <!-- //고정 footer-->
        <!--탑버튼-->
        <div id="top_wrap">
            <a href="#top"><img src="../img/arrow-up2.png"></a>
        </div>
    </div>
    <!-- Javascript -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!-- Sweetalert JS -->
    <script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>
    <script type="text/javascript">
    var form = document.getElementById("log_form");

        $(function() {
            /* -----햄버거 사이드 메뉴 열기---- */
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



            
            /* -----입력창 다 채우고 확인 버튼---- */
            $("#log_form").submit(function(e) {
                e.preventDefault(); // 데이터 전송 강제 중단

                var id = $("#user_id").val();
                var name = $("#user_name").val();
                var mail2 = $("#random-inp").val();
                var random = $("#random-re").val();

                if (!id) { // 입력값이 없다면?
                    swal({
                        title: "",
                        text: "아이디를 입력하세요.",
                        confirmButtonColor: "#620080",
                        type: "error"
                    }).then(function(result) {
                        $("#user_id").focus();
                    });

                } else if (!name) { // 입력값이 없다면?
                    swal({
                        title: "",
                        text: "이름을 입력하세요.",
                        confirmButtonColor: "#620080",
                        type: "error"
                    }).then(function(result) {
                        $("#user_name").focus();
                    });
                    
                } else if (!mail2) { // 입력값이 없다면?
                    swal({
                        title: "",
                        text: "이메일을 입력하세요.",
                        confirmButtonColor: "#620080",
                        type: "error"
                    }).then(function(result) {
                        $("#random-inp").focus();
                    });
                    
                } else {
                    swal({
                        title: "",
                        text: "메일을 확인해 주세요.",
                        confirmButtonColor: "#620080",
                        type: "success"
                    }).then(function(result) {
                        if (result.value) {
                        	form.action = "${pageContext.request.contextPath}/login/searchPw_ok.do";
                        	form.submit();
                        }
                    });
                }

            }); // end submit()

        });
        $(function(){
	           $("#keyword").click(function(){
	              location.href="${pageContext.request.contextPath}/search/search.do";
	           });
	        });
    </script>
</body>
</html>

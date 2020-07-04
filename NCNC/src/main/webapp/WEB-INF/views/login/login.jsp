<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />

<!--bootstrap-->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<!--구글 웹 폰트 적용-->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">

<!-- 가격 구분 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">

<!--외부 CSS 파일 참조-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">

<!--Sweetalert CSS-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">

<!-- google sign in api -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="517239946643-4dlaem270d345nlpdtopbt6slpqhkf7b.apps.googleusercontent.com">
<script>
	//google login
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		console.log('Name: ' + profile.getName());
		console.log('Image URL: ' + profile.getImageUrl());
		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	}
</script>

<title>로그인</title>
</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>
		
		<!-- //고정 header-->
		<div id="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 / 스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
			
			<!--각 페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
			<c:choose>
				<c:when test="${member == null}">
					<div id="page-header">
						<button type="button" class="btn-back" onclick="history.back(); return false;">뒤로가기</button>
						<h2>로그인</h2>
					</div>
					<div id="page-content">
						<!--아이디&비밀번호 입력란 영역-->
						<form name="log_form" id="log_form" action="${pageContext.request.contextPath}/login/login_ok.do" method="post">
							<div class="form-group">
								<input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="아이디" value="${cookie.remember.value}" /> 
								<input type="password" id="mem_pw" name="mem_pw" class="form-control" placeholder="비밀번호" />
								
								<div id="go-to-mypage">
									<button type="submit" class="okbtn">로그인</button>
								</div>
								
								<div class="checkbox chk-ui-wrap">
									<label class="chk-allSelect"><input type="checkbox" id="rememberCheck" name="remember_user_info" value="N">아이디 저장</label>
								</div>

								<!-- google sign-in button -->
								<div class="g-signin2" data-onsuccess="onSignIn"></div>

								<!-- 관리자 로그인 -->
								<div>
									<a href="${pageContext.request.contextPath}/admin/login_ok.do" id="admin_login">관리자 로그인</a>
								</div>

								<hr />
							</div>
						</form>
						
						<ul class="list-inline">
							<li><a href="${pageContext.request.contextPath}/login/searchId.do">아이디찾기</a></li>
							<li><a href="${pageContext.request.contextPath}/login/searchPw.do">비밀번호찾기</a></li>
							<li><a href="${pageContext.request.contextPath}/login/joinStep1.do">회원가입</a></li>
						</ul>
						<div class="thumb">
							<a href="${pageContext.request.contextPath}/qmenu/qEvent.do"><img src="../img/slide1.jpg"></a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div id="page-header">
						<button type="button" class="btn-back" onclick="history.back(); return false;">뒤로가기</button>
						<h2>로그아웃</h2>
					</div>
					<div>
						<h2>로그아웃 하시겠습니까?</h2>
						<div id="go-to-logout">
							<button type="submit" class="okbtn" id="logout">로그아웃</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<!-- //page-content-->
		</div>
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
	</div>
	
	<!--Javascript-->
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- Sweetalert JS -->
	<script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>

	<script type="text/javascript">
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

			$("#rememberCheck").click(unction() {
				if ($('input:checkbox[name="remember_user_info"]').val() == "N") {
					$('input:checkbox[name="remember_user_info"]').val("Y");
				} else {
					$('input:checkbox[name="remember_user_info"]').val("N");
				}
			});

			$("#logout").click(function(e) {
				e.preventDefault();
				location.href = "${pageContext.request.contextPath}/login/logout.do";
			});

			/* -----로그인 버튼---- */
			/* $("#log_form").submit(function(e) {
			    e.preventDefault(); // 데이터 전송 강제 중단

			    var mem_id = $("#mem_id").val(); // 입력값 가져오기
			    var mem_pw = $("#mem_pw").val(); // 입력값 가져오기
			    if (mem_id.equals("")) { // 입력값이 없다면?
			        swal({
			            title: "",
			            text: "아이디를 입력하세요.",
			            confirmButtonColor: "#620080",
			            type: "error"
			        }).then(function(result) {
			            $("#mem_id").focus();
			        });

			    } else (mem_pw.equals("")) { // 입력값이 없다면?
			        swal({
			            title: "",
			            text: "비밀번호를 입력하세요.",
			            confirmButtonColor: "#620080",
			            type: "error"
			        }).then(function(result) {
			            $("#mem_pw").focus();
			        });
			    } 
			});
			*/
		});
		
		// 검색어 입력
		$(function() {
			$("#keyword").click(function() {
				location.href = "${pageContext.request.contextPath}/search/search.do";
			});
		})
		
		// 관리자 로그인
		$(function() {
			$("admin_login").click(function() {
				location.href = "${pageContext.request.contextPath}/admin/login.do";
			});	 
		})

	</script>
</body>

</html>
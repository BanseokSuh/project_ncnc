<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,
            maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>비밀번호 변경</title>
<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
<!--bootstrap-->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<!--구글 웹 폰트 적용-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">
<!-- 가격 구분 폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap"
	rel="stylesheet">
<!--외부 CSS 파일 참조-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/changePw.css">
<!--Sweetalert CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>

		<div id="content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>
			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>
			<!-- -------------최근 본 상품 끝----------- -->
			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
			<!-- ============================================================================================ -->
			<!--각 페이지 헤더부분 넣기(0000에 해당 페이지이름 넣기)-->
			<form method="post"
				action="${pageContext.request.contextPath}/mypage/changePw_ok.do">
				<div id="page-header">
					<button type="button" class="btn-back"
						onclick="location.href='memInfoChange.html'">뒤로가기</button>
					<h2>비밀번호 변경</h2>
				</div>
				<div id="page-content">
					<div id="page-content-title">
						<h3>
							<br>새로운 비밀번호를 입력하세요.
						</h3>
					</div>
					<div class="form-group">
						<input type="password" name="mem_pw" id="user_pw"
							class="form-control pw" placeholder="새 비밀번호 입력" />
						<!-- <input
							type="password" name="mem_pw_re" id="user_pw_re"
							class="form-control pw" placeholder="새 비밀번호 확인" /> -->
						<div id="reset_pw">
							<button type="submit" class="okbtn">확인</button>
						</div>
					</div>
				</div>
			</form>
			<!-- //page-content-->
		</div>
		<!-- //content-->
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!-- //고정 footer-->
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
	</div>
	<!--Javascript-->
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<!-- 정규표현식 검사 객체를 참조한다. -->
	<script
		src="${pageContext.request.contextPath}/plugins/validate/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/validate/additional-methods.min.js"></script>
	<!-- Sweetalert JS -->
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>
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

			/* -----새로운 비밀번호 확인 버튼---- */
			$('.form-control').focusout(function() {
				var pwd1 = $("#user_pw").val();
				var pwd2 = $("#user_pw_re").val();

				/** pwd1과 pwd2가 공란이면 통과함(확인필요!!)*/

				if (pwd1 == pwd2 && pwd1 != '') {
					// 비밀번호 일치 이벤트 실행
					swal({
						title : "",
						text : "정상적으로 변경되었습니다.",
						confirmButtonColor : "#620080",
						type : "success"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						if (result.value) {
							location.href = "myPage.do";
						}
					});
				}
			}); // end focusout()
			/** 플러그인의 기본 설정 옵션 추가 */
			jQuery.validator.setDefaults({
				onkeyup : false, // 키보드입력시 검사 안함
				onclick : false, // <input>태그 클릭시 검사 안함
				onfocusout : false, // 포커스가 빠져나올 때 검사 안함
				showErrors : function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
					// 에러가 있을 때만..
					if (this.numberOfInvalids()) {
						// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
						//alert(errorList[0].message);
						// 0번째 에러 발생 항목에 포커스 지정
						//$(errorList[0].element).focus();
						swal({
							title : "",
							text : errorList[0].message,
							confirmButtonColor : "#620080",
							type : "error"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {
								$(errorList[0].element).val('');
								$(errorList[0].element).focus();
							}, 100);
						});
					}
				}
			}); // end setDefaults()
			/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
			$("#confirm_pw").validate({
				/** 입력검사 규칙 */
				rules : {
					// [비밀번호] 필수 + 글자수 길이 제한
					user_pw : {
						required : true,
						minlength : 4,
						maxlength : 20
					},
					// [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
					user_pw_re : {
						required : true,
						equalTo : "#user_pw"
					},
				},
				/** 규칙이 맞지 않을 경우의 메시지 */
				messages : {
					user_pw : {
						required : "비밀번호를 입력하세요.",
						minlength : "비밀번호는 4글자 이상 입력하셔야 합니다.",
						maxlength : "비밀번호는 최대 20자까지 가능합니다."
					},
					user_pw_re : {
						required : "비밀번호 확인값을 입력하세요.",
						equalTo : "비밀번호 확인이 잘못되었습니다."
					},
				}
			}); // end validate()
		});
		$(function(){
	           $("#keyword").click(function(){
	              location.href="${pageContext.request.contextPath}/search/search.do";
	           });
	        });
	</script>
</body>

</html>

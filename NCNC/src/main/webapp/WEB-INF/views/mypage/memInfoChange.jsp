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
<title>회원 정보 수정</title>
<!--모바일 웹 페이지 설정-->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
<!-- Bootstrap -->
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
	href="${pageContext.request.contextPath}/css/meminfoChange.css">
<!--Sweetalert CSS-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
<!--정규표현식 검사 객체 참조-->
<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
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

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>

			<div id="page-header">
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>내 정보 수정</h2>
			</div>


			<!--수정할 정보 입력란 영역-->
			<form class="horizontal" name="join-form" id="join_form"
				method="post"
				action="${pageContext.request.contextPath}/mypage/memInfoChange_ok.do">
				<div class="contents_wrap">

					<div class="form-group">
						<div class="id">
							<label for="user_id">아이디</label> <input type="text"
								name="user_id" id="user_id" value="&nbsp ${output.mem_id}"
								disabled /> <a
								href="${pageContext.request.contextPath}/mypage/changePw.do">비밀번호변경
								&#62;</a>
						</div>
					</div>
					<div class="form-group">
						<div class="name">
							<label for="user_name">이름</label> <input type="text"
								name="user_name" id="user_name" value="&nbsp ${output.mem_name}"
								disabled />
						</div>
					</div>
					<div class="form-group">
						<div class="birthday">
							<label for="user_birth">생년월일</label> <input type="text"
								name="user_birth" id="user_birth"
								value="&nbsp ${output.mem_birth}" disabled />
						</div>
					</div>
					<div class="form-group">
						<div class="gender">
							<label for="user_gender">성별</label> <input type="text"
								name="user_gender" id="user_gender" value="&nbsp ${gender}"
								disabled />
						</div>
					</div>
					<div class="form-group">
						<div class="email">
							<label for="mem_email">이메일</label> <input type="text"
								name="mem_email" id="user_email2" />
							<!-- <div class="email-ch-btn" id="email-ch-btn">
								<a href="#" class="btn_chk">이메일변경 &gt;</a>
							</div> -->
						</div>
					</div>
					<div class="form-group">
						<div class="mobile">
							<label for="mem_tel">연락처</label> <input type="text"
								name="mem_tel" id="user_mobile" />
						</div>
					</div>
					<div class="form-group">
						<div class="addr">
							<label for="mem_addr">주소</label>
						</div>
						<div class="addr_info">
							<div class="user_addr_zip">
								<input type="text" name="mem_postcode" id="user_zip" />
								<div class="zip-btn" id="zip-btn">
									<a href="#" id="confirm-add">우편번호찾기</a>
								</div>
							</div>
							<input type="text" name="mem_addr1" id="user_addr" /> <input
								type="text" name="mem_addr2" id="user_detail_addr" />
						</div>
					</div>

					<div class="bottom_check">
						<span class="checkbox2"><label for="ck02"> 알림 서비스
								설정 </label> </span>
						<p>*니컴내컴에 이벤트나 문의답변의 알림을 받으실 수 있습니다.</p>
						<span class="checkbox3"> <input id="ck03" type="checkbox"
							checked /> <label for="ck03"> 이메일 </label>
						</span>
					</div>
					<div id="mem_out">
						<h4>회원탈퇴</h4>
						<p>*회원탈퇴시, 해당 아이디는 영구 사용 중지되어 더 이상 이용하실 수 없습니다. 재가입시 새로운 아이디로
							가입해주세요.</p>
						<a
							href="${pageContext.request.contextPath}/mypage/memInfo_delete.do">&nbsp;회원탈퇴
							&gt;</a>
						<!-- id="out_btn" -->
					</div>
					<div class="btn-wrap-flex">
						<div class="col-sm-6 col-xs-6 text-center">
							<a href="${pageContext.request.contextPath}/mypage/myPage.do"
								class="offbtn1">취소</a>
						</div>
						<div class="col-sm-6 col-xs-6 text-center">
							<!-- <a href="/mypage/memInfoChange_ok" class="button okbtn"
								onclick="formSubmit(); return false;">확인</a> -->
							<button type="submit" class="button okbtn">확인</button>
						</div>

					</div>
				</div>
				<!-- //contents_wrap-->
			</form>
		</div>
		<!-- //content-->

		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
	</div>
	<!-- //container-->
	<!-- Javascript -->
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
	<!-- 우편번호 검색-->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

			/* -----정규표현식 검사(이메일)---- */
			var email2 = document.getElementById("user_email2");

			var checkEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

			$(".btn_chk").click(function() {

				if (!email2) { // 입력값이 없다면?
					swal({
						title : "",
						text : "이메일을 입력하세요.",
						confirmButtonColor : "#620080",
						type : "error"
					}).then(function(result) {
						$("#user_email2").focus();
					});

				} else if (!checkEmail.test(email2.value) && email2 != "") {
					swal({
						title : '',
						text : '이메일 형식이 잘못되었습니다.',
						confirmButtonColor : "#620080",
						type : 'error'
					}).then(function(result) {
						$("#user_email2").focus();
					});
				}
			});

			/* -----우편번호 찾기---- */
			$("#confirm-add").click(function() {
				new daum.Postcode({
					oncomplete : function(data) {
						jQuery("#user_zip").val(data.zonecode); // 우편번호
						jQuery("#user_addr").val(data.address); // 주소
					}
				}).open();
				$("#user_detail_addr").focus(); // 상세주소 포커스
			});

			/* -----회원탈퇴---- */
			/* $("#out_btn").click(function() {
				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '', // 제목
					text : '정말 탈퇴하시겠습니까?', // 내용
					type : 'question', // 종류
					confirmButtonText : 'Yes', // 확인버튼 표시 문구
					confirmButtonColor : "#620080",
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : 'No', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal({
							$.get("${pageContext.request.contextPath}/memInfo_delete"),
							title : '',
							text : '성공적으로 틸퇴되었습니다.',
							type : 'success',
							confirmButtonText : 'OK', // 확인버튼 표시 문구
							confirmButtonColor : "#620080"
						});
					} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
						swal({
							title : '',
							text : '탈퇴가 취소되었습니다.',
							type : 'error',
							confirmButtonText : 'OK', // 확인버튼 표시 문구
							confirmButtonColor : "#620080"
						});
					}
				});
			}); */
			
			$(".offbtn1").click(function(e) {
				alert("마이페이지로 돌아갑니다.");
			}).then(function(result) {
				location.href("${pageContext.request.contextPath}/mypage/myPage.do");
			});
			
			$("#keyword").click(function(){
			    location.href="${pageContext.request.contextPath}/search/search.do";
			});
		});
		
	</script>
</body>
</html>
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

<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<title>joinStep3_form_c.jsp</title>

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed" href="../img/logo4.png" />

<!-- 나눔고딕 웹 폰트 적용 -->
<!--<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">-->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">

<!-- CSS 참조 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/joinStep3_form_a.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.css">
</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp" %>
		
		<div class="top">
			<button type="button" class="btn-back" onclick="history.back();">뒤로가기</button>

			<h2>회원가입</h2>
		</div>

		<div class="tab comtab" id="tab-btn">
			<ul class="nav nav-tabs" id="tab-ul">
				<li class="pull-left"><a href="#p-open-event-list"
					data-toggle="tab">이용약관</a></li>
				<li class="pull-left active"><a href="#p-close-event-list"
					data-toggle="tab">회원가입</a></li>
			</ul>
		</div>

		<div class="contents">
			<div class="contents_wrap">
				<form class="horizontal" name="join-form" id="join_form"
					method="post">
					<span class="checkbox1"> <input id="ck01" type="checkbox" />
						<label for="ck01">(사람인증) 나는 로봇이 아닙니다.</label>
					</span>
					<div class="form-group">
						<div class="id">
							<input type="text" id="mem_id" name="mem_id" class="input_id"
								placeholder="아이디를 입력해주세요" />
						</div>
						<div class="id">
							<button type="button" id="confirm-id" class="button50">아이디
								중복확인</button>
						</div>
					</div>
					<div class="form-group">
						<input type="password" id="mem_pw" name="mem_pw" class="clear"
							placeholder="비밀번호를 영문과 숫자를 조합하여 입력해주세요" />
					</div>
					<div class="form-group">
						<input type="password" id="input-pw-re" placeholder="비밀번호를 확인해주세요" />
					</div>
					<div class="form-group">
						<input type="text" id="input-name2" name="mem_name"
							placeholder="이름을 입력해주세요" />
					</div>
					<div class="form-group email">
						<div class="input_email">
							<input type="text" id="input_email" name="mem_email"
								placeholder="이메일을 입력해주세요" />
						</div>
					</div>
					<div class="form-group">
						<input type="text" id="input-mobile" name="mem_tel" class="clear"
							placeholder="휴대전화번호를 '-'를 제외하고 입력해주세요" />
					</div>
					<div class="form-group">
						<div class="input_jumin">
							<input type="text" id="input_jumin1" name="mem_birth"
								placeholder="생년월일을 입력해주세요" />
						</div>
						<div>
							<div class="dash">-</div>
						</div>
						<div class="input_jumin2">
							<input type="password" id="input_jumin2" name="mem_gender"
								maxlength="1" />
						</div>
						<div class="input_jumin3">
							<div id="input_jumin3">* * * * * *</div>
						</div>
					</div>
					<div class="form-group">
						<div class="input_add">
							<input type="text" id="input_add" name="mem_postcode"
								class="clear" placeholder="우편번호" />
							<button type="button" id="confirm-add" name="zip"
								class="button50">우편번호 찾기</button>
						</div>
					</div>
					<div class="form-group clear">
						<input type="text" id="add-detail" name="mem_addr1"
							placeholder="주소를 입력해주세요" />
					</div>
					<div class="form-group clear">
						<input type="text" id="add-detail2" name="mem_addr2"
							placeholder="상세주소를 입력해주세요" />
					</div>
				</form>
				<div class="bottom_check">
					<span class="checkbox2"><label for="ck02"> 알림 서비스 설정
					</label> </span>
					<p>*니컴내컴에 이벤트나 문의답변의 알림을 받으실 수 있습니다.</p>
					<span class="checkbox3"> <input id="ck03" name="mem_reply"
						type="checkbox" checked /> <label for="ck03"> 이메일 </label>
					</span>
				</div>
				<div class="btn">
					<a href="#" class="offbtn1">취소</a>
					<button type="submit" class="submitbtn">가입하기</button>
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
	</div>

	<!-- jQuery Script CND방식 참조 -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sweetalert/sweetalert2.min.js"></script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
      var id = document.getElementById("mem_id");
      var pw = document.getElementById("mem_pw");
      var pw_re = document.getElementById("input-pw-re");
      var name2 = document.getElementById("input-name2");
      var email = document.getElementById("input_email");
      var mobile = document.getElementById("input-mobile");
      var jumin1 = document.getElementById("input_jumin1");
      var jumin2 = document.getElementById("input_jumin2");
      var add = document.getElementById("input_add");
      var con_add = document.getElementById("confirm-add");
      var add_detail = document.getElementById("add-detail");
      var add_detail2 = document.getElementById("add-detail2");
      var form = document.getElementById("join_form");

      // 정규표현식 객체 생성
      var checkId = /^[a-zA-Z0-9]{4,12}$/;
      var checkPw = /^[a-zA-Z0-9]{4,12}$/;
      var checkName = /^[ㄱ-ㅎ가-힣]*$/;
      var checkEmail = /^[a-zA-Z0-9]{4,12}$/;
      var checkMobile = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
      var checkJumin2 = /[1-4]/;

      /**********************************/
      $(function() {
    	  /* 아이디 중복확인 버튼 클릭 시 */
          // 사전에 아이디 수정하기 버튼 숨김 처리
          $("#change-id").hide();

          $("#confirm-id").click(function() {
 			// 아이디 입력값 받아오기
            var mem_id = $("#mem_id").val();
 			if(mem_id == ""){
 				swal({
                 	title : "아이디를 입력하세요.",
                     confirmButtonColor : "#620080",
                     showCancelButton : true,
                     confirmButtonText : "확인",
                     reverseButtons : true
         		});
 				$("#mem_id").focus();
 			} else{
             $.ajax({
             	url:"${pageContext.request.contextPath}/login/idCheck.do?mem_id=" + mem_id,
                 type:"get",
                 success:function(data){
                 	if(data == 1){
                 		swal({
                         	title : "중복된 아이디 입니다.",
                             confirmButtonColor : "#620080",
                             showCancelButton : true,
                             confirmButtonText : "확인",
                             reverseButtons : true
                 		}).then(function(result){
                 			$("#mem_id").val("");
                 			$("#mem_id").focus();
                 		})
                 	} else{
                 		swal({
                             title : "사용가능 합니다.",
                             confirmButtonColor : "#620080",
                             showCancelButton : true,
                             confirmButtonText : "확인",
                             reverseButtons : true
                 		}).then(function(result){
                 			$("#mem_pw").focus();
                 		})
                 	}
                 }
              });
 			}
          });
          /* 아이디 중복확인 끝 */
         /*********** 제일 하단 가입하기 버튼 시작***********/
         $(".submitbtn").click(function(e) {
        	 e.preventDefault();
             // 사람인증 체크박스에 체크가 안 되어 있을 때
             if ($("#ck01").prop('checked') == false) {
             	swal({
                	title : "사람인증란에 체크하셔야 합니다.",
                    confirmButtonColor : "#620080",
                    reverseButtons : true
                 });

                 // 아이디가 공백이거나 입력박스가 활성화되어 있을 경우
                 // 비활성화(아이디 중복확인) 되어야만 다음 단계로 넘어가도로 설정함
                 // 아이디 입력박스에 포커스
             } else if (id.value == "") {
             		swal({
                    title : "아이디 중복 확인해주세요.",
                    confirmButtonColor : "#620080",
                    reverseButtons : true
                 }).then(function(result) {
                    $("#mem_id").focus();
                 });

                     // 비밀번호가 공백일 때
                     // 입려란에 포커스
              } else if (pw.value == "") {
                     swal({
                        title : "비밀번호를 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_pw").focus();
                     });

                     // 비밀번호가 정규표현식에 맞지 않을 경우
              } else if (!checkPw.test(pw.value)) {
                     swal({
                        title : "비밀번호는 4~12자의 영문 대소문자와 숫자로 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_pw").focus();
                        $("#mem_pw").val("");
                     });

                     // 비밀번호가 공백일 경우
              } else if (pw_re.value == "") {
                     swal({
                        title : "비밀번호를 확인해주세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#input-pw-re").focus();
                     });

                     // 재입력 비밀번호가 맞지 않을 경우
              } else if (pw_re.value != pw.value) {
                     swal({
                        title : "비밀번호가 맞지 않습니다.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#input-pw-re").focus();
                        $("#input-pw-re").val("");
                     });

                     // 이름을 입력하지 않았을 경우
              } else if (name2.value == "") {
                     swal({
                        title : "이름을 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#input-name2").focus();
                     });

                     // 이름이 한국어로 입력되지 않을 경우
              } else if (!checkName.test(name2.value)) {
                     swal({
                        title : "이름은 한국어로 입력하세요",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_name").focus();
                        $("#mem_name").val("");
                     });

                     // 이메일을 입력하지 않을 경우
              } else if (email.value == "") {
                     swal({
                        title : "이메일을 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_email").focus();
                     });

                     // 이메일 주소를 입력하지 않을 경우
              } else if (mobile.value == "") {
                     swal({
                        title : "휴대전화번호를 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#input-mobile").focus();
                     });

                     // 휴대전화번호가 정규표현식에 맞지 않을 경우
              } else if (!checkMobile.test(mobile.value)) {
                     swal({
                        title : "휴대전화번호를 정확히 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_tel").focus();
                        $("#mem_tel").val("");
                     });

                     // 주민등록번호 앞자리를 입력하지 않을 경우
              } else if (jumin2.value == "") {
                     swal({
                        title : "성별코드를 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_gender").focus();
                     });

                     // 주민번호 뒷자리가 정규표현식에 맞지 않을 경우
              } else if (!checkJumin2.test(jumin2.value)) {
                     swal({
                        title : "성별코드를 정확히 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_gender").focus();
                        $("#mem_gender").val("");
                     });

                     // 우편번호를 입력하지 않을 경우
              } else if (add.value == "") {
                     swal({
                        title : "우편번호를 검색해주세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_postcode").focus();
                     });

                     // 상세주소1을 입력하지 않은 경우
              } else if (add_detail.value == "") {
                     swal({
                        title : "주소를 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_addr1").focus();
                     });

                     // 상세주소2를 입력하지 않은 경우
              } else if (add_detail2.value == "") {
                     swal({
                        title : "상세주소를 입력하세요.",
                        confirmButtonColor : "#620080",
                        reverseButtons : true
                     }).then(function(result) {
                        $("#mem_addr2").focus();
                     });

                     // 모든 조건을 충족했을 경우
              } else {
                     swal({
                        title : "회원가입을 하시겠습니까?",
                        confirmButtonColor : "#620080",
                        showCancelButton : true,
                        cancelButtonColor : "#888",
                        confirmButtonText : "확인",
                        cancelButtonText : "닫기",
                        reverseButtons : true
                     }).then(function(result) {
                        // 확인 버튼 클릭 시 페이지 이동
                        if (result.value) {
                        	form.action = "${pageContext.request.contextPath}/login/joinStep3_form_c_ok.do";
                        	form.submit();
                        }
                     });
                  }
               });
         /***********가입하기 버튼 끝***********/

         /* 우편번호 찾기 버튼 클릭 시 */
         $("#confirm-add").click(function() {
            // 다음 우편번호 API 연동
            new daum.Postcode({
               oncomplete : function(data) {
                  // $("#input_add").val(data.input_add);
                  // 우편번호 입력칸에 입력값 받아오기
                  jQuery("#input_add").val(data.zonecode);
                  // 주소 입력칸에 입력값 받아오기
                  jQuery("#add-detail").val(data.address);
               }
            }).open();
            // 상세주소 입력칸에 포커스
            $("#add-detail2").focus();
         });
         /* 우편번호 찾기 끝 */

         /* 회원가입 취소 버튼 클릭 시 */
         $(".offbtn1").click(function() {
            swal({
               title : "회원가입을 취소하시겠습니까?",
               showCancelButton : true,
               confirmButtonColor : "#620080",
               cancelButtonColor : "#888",
               confirmButtonText : "홈으로",
               cancelButtonText : "닫기",
               reverseButtons : true,
            }).then(function(result) {
               // 확인 버튼 클릭 시 홈으로 이동
               if (result.value) {
                  location.href = "${pageContext.request.contextPath}/login/login.jsp";
               }
            });
         });
         /* 회원가입 취소 끝 */

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
            $("#side-wrap2").addClass("dark");
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
      });
      /**********************************/
      $(function(){
	           $("#keyword").click(function(){
	              location.href="${pageContext.request.contextPath}/search/search.do";
	           });
	        });
   </script>

</body>
</html>
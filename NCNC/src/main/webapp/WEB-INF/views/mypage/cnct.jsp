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
<title>1:1문의</title>
<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="../img/logo3.png" />
<link rel="apple-touch-icon-precomposed"
	href="../img/apple-touch-icon-144-logo3.png" />
<!-- bootstrap -->


<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="../css/common.css" />
<link rel="stylesheet" type="text/css" href="../css/cnct.css">


</head>

<body>
	<div id="container">
		<!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
		<%@ include file="../inc/head.jsp"%>

		<div id="cnct-content">
			<!-- -------------햄버거 메뉴 시작------------ -->
			<%@ include file="../inc/hamMenu.jsp"%>

			<!-- -------------최근 본 상품 시작------------ -->
			<%@ include file="../inc/recentItem.jsp"%>

			<!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
			<%@ include file="../inc/fixed.jsp"%>
			<!-- ====================================================================================== -->

			<div id="private-header">
				<button type="button" class="btn-back"
					onclick="history.back(); return false;">뒤로가기</button>
				<h2>1 : 1 문의</h2>
			</div>
			<div class="tab" id="tab-btn">
				<ul class="nav nav-tabs" id="tab-ul">
					<li class="pull-left active"><a href="#private-write"
						data-toggle="tab">문의하기</a></li>
					<li class="pull-left"><a href="#private-list"
						data-toggle="tab">문의내역</a></li>
				</ul>
			</div>


			<div class="cnct-content tab-content">

				<div id="private-write" class="tab-pane fade in active">
					<form method="post"
						action="${pageContext.request.contextPath}/mypage/cnct_ok.do">
						<div id="input-cust-width">
							<select id="selCnctType" name="qna_type">
								<!-- <option value="">질문 유형을 선택해주세요</option> -->

								<option value="0">---- 선택하세요 ----</option>
								<option value="1">주문/결제</option>
								<option value="2">취소/반품</option>
								<option value="3">서비스/회원혜택</option>
								<option value="4">쿠폰/이벤트</option>
								<option value="5">사이트이용</option>
								<option value="6">기타</option>
							</select>
							<textarea id="txtCnct" name="qna_contents"
								placeholder="문의내용을 입력 해 주세요 (10자 이상 2000자 이내)" maxlength="2000"></textarea>
						</div>


						<div class="btn-wrap-flex">
							<div class="col-sm-6 col-xs-6 text-center">
								<a
									href="${pageContext.request.contextPath}/mypage/cnct_cancel.do"
									id="btnCnc1" class="offbtn1">취소</a>
							</div>
							<div class="col-sm-6 col-xs-6 text-center">
								<button type="submit" id="btnReg" class="okbtn">등록</button>
							</div>
						</div>
					</form>
				</div>


				<div id="private-list" class="tab-pane in fade">

					<!--부트스트랩에서 가져온 아코디언 기능-->
					<div id="cnctlist-new">

						<c:choose>
							<c:when test="${output[0] == null}">
								<div>
									<div>
										<br> <br> <br> <br> <br>
										<h4>작성글이 없습니다.</h4>
										<br> <br> <br> <br> <br>
									</div>
								</div>
							</c:when>

							<c:otherwise>

								<c:forEach var="output" items="${output}" varStatus="status">
									<div id="cnct-day-state">
										<div id="cnct-state">
											<c:choose>
												<c:when test="${output.qna_status == 'N'}">답변미완료</c:when>
												<c:when test="${output.qna_status == 'Y'}">답변완료</c:when>
											</c:choose>
										</div>
										<div id="cnct-date">${output.reg_date}</div>
									</div>
									<div id="cnct-aco-list">
										<nav id="accordian">
											<ul>
												<li id="accordian-detail" class="text-left"><a
													class="q-title"> <span> <c:set var="TextValue"
																value="${output.qna_contents}" />
															${fn:substring(TextValue,0,20) }
													</span> <img class="item text-right" src="../img/arrow-down.png"></a>
													<ul>
														<li id="collapseOne">
															<div id="question-wrap">
																<p id="category">
																	<span class="question-kind">질문유형 :</span>
																	<c:choose>
																		<c:when test="${output.qna_type == 1}">주문/결제</c:when>
																		<c:when test="${output.qna_type == 2}">취소/반품</c:when>
																		<c:when test="${output.qna_type == 3}">서비스/회원혜택</c:when>
																		<c:when test="${output.qna_type == 4}">쿠폰/이벤트</c:when>
																		<c:when test="${output.qna_type == 5}">사이트이용</c:when>
																		<c:when test="${output.qna_type == 6}">기타</c:when>
																	</c:choose>
																</p>
																<p class="txt">${output.qna_contents}</p>
																<div id="Cbtn">
																	<a
																		href="${pageContext.request.contextPath}/mypage/cnct_delete.do?qna_no=${output.qna_no}">삭제</a>
																</div>
															</div>
														</li>
													</ul></li>
											</ul>
										</nav>
									</div>
									<hr />
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!--부트스트랩에서 가져온 아코디언 기능 끝-->
				</div>
			</div>
		</div>
		<!--고정 footer-->
		<%@ include file="../inc/footer.jsp"%>
		<!--탑버튼-->
		<div id="top_wrap">
			<a href="#top"><img src="../img/arrow-up2.png"></a>
		</div>
	</div>
	<!-- Javascript -->
	<script src="../assets/js/jquery.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#accordian a").click(function() {
				var temp = $(".item").attr('src');
				var over = $(".item").data('over');
				$(".item").attr('src', over);
				$(".item").data('over', temp);
				$("#accordian ul ul").slideUp();
				if (!$(this).next().is(":visible")) {
					$(this).next().slideDown();
				}
			})

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
		$(function() {
			$("#keyword")
					.click(
							function() {
								location.href = "${pageContext.request.contextPath}/search/search.do";
							});
		});
	</script>
</body>

</html>

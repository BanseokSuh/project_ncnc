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
    <title>상품평 쓰기</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/writeReview.css">
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
            
            <!-- ============================================================================================== -->
            <div id="page-header">
                <button type="button" class="btn-back" onclick="history.back(); return false;">뒤로가기</button>
                <h2>상품평 쓰기</h2>
            </div>
            <div id="page-content">
                <ul id="review">
                    <li>
                        <a href="#">
                            <!-- 이미지, 제목, 요약글 -->
                            <span class="thumb left-area">
                               <span class="img-area" style="background-image: url(${output.origin_name})"></span>
                            </span>
                            <span class="text">
                                <span class="title">${output.item_brand}</span>
                                <span class="title">${output.item_name}</span>
                                <span class="desc">${output.item_cpu}/${output.item_ram}/${output.item_ssd}/${output.item_inch}/${output.item_os}</span>
                           
                            </span>
                        </a>
                    </li>
                </ul>
                <div class="star-box">
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                    <span class="star star_left"></span>
                    <span class="star star_right"></span>
                </div>
                <div class="text-box"> 별점을 등록해주세요.</div>
                <form id="review_form">
                    <div id="input-review">
                        <input type="text" id="input_title" name="rev_title" placeholder="제목" />
                        <textarea id="input_content" name="rev_content" placeholder="내용을 입력해주세요 (10자 이상 2000자 이내)" maxlength="2000"></textarea>
                    </div>
                    
                        
                    <div class="btn-wrap-flex">
                        <div class="col-sm-6 col-xs-6 text-center"><a href="#" class="offbtn1">취소</a></div>
                        <div class="col-sm-6 col-xs-6 text-center"><button type="submit" class="okbtn">등록</button></div>
                    </div>
                </form>
            </div>
            <!--고정 footer-->
            <%@ include file="../inc/footer.jsp" %>
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
				
                
                var starCount = 0;
                $(".star").on('click', function() {
               		starCount = 0;
                    var idx = $(this).index();
                    $(".star").removeClass("on");
                    for (var i = 0; i <= idx; i++) {
                        $(".star").eq(i).addClass("on");
                    }
                    for(var i = 0; i < 10; i++ ){
                    	if($(".star").eq(i).hasClass("on")){
                    		starCount++;
                    	}
                    }
                });
				
                /* -----등록/취소 버튼---- */
                $("#review_form").submit(function(e) {
                    e.preventDefault(); // 데이터 전송 강제 중단

                    var ttl = $("#input_title").val(); // 입력값 가져오기
                    var cnt = $("#input_content").val(); // 입력값 가져오기
                    if (!ttl) { // 입력값이 없다면?
                        swal({
                            title: "",
                            text: "제목을 입력하세요.",
                            confirmButtonColor: "#620080",
                            type: "error"
                        }).then(function(result) {
                            $("#input_title").focus();
                        });

                    } else if (!cnt) { // 입력값이 없다면?
                        swal({
                            title: "",
                            text: "내용을 입력하세요.",
                            confirmButtonColor: "#620080",
                            type: "error"
                        }).then(function(result) {
                            $("#input_content").focus();
                        });
                    } else {
                        swal({
                            title: "",
                            text: "등록되었습니다.",
                            confirmButtonColor: "#620080",
                            type: "success"
                        }).then(function(result) {
                            if (result.value) {
                            	var rev_title = $('input[name=rev_title]').val();
                                var rev_content = $("textarea#input_content").val();
                            	var item_no = ${itemno.item_no};
                            	var mem_no = ${output.mem_no};
                                location.href = "${pageContext.request.contextPath}/review/write_ok.do?rev_star=" + starCount/2 +"&rev_title=" + rev_title +"&rev_content=" + rev_content +"&item_no=" + item_no +"&mem_no=" + mem_no;
                            }
                        });
                    }
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

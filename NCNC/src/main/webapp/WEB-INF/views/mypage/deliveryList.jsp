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
    <title>배송지관리</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <!-- 가격 구분 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/myDelivery.css">
</head>

<body>
    <div id="container">
        <div id="header" class="header-wrap">
            <div class="logo-search-wrap">
                <h1 class="logo"><a href="../LDE/index.html" data-sc-action="topbar.click" data-dimension-name="topbar.name" data-dimension-value="Topbar^lalavla"><img src="../img/logo4.png" alt="랄라블라 로고"></a></h1>
                <div class="inp-search">
                    <input type="text" placeholder="니컴이 내컴이고 내컴이 니컴이다." id="keyword" readonly="true"><a href="../LCS/search.html" class="btn-search">검색</a>
                </div>
                <a href="cartlist.html" class="btn-basket">장바구니 바로가기<span class="badge">3</span></a>
            </div>
        </div>
        <div id="private-header">
            <button type="button" class="btn-back" onclick="history.back();return false;">뒤로가기</button>
            <h2>배송지관리</h2>
        </div>
        <div class="tab" id="tab-btn">
            <ul class="nav nav-tabs" id="tab-ul">
                <li class="pull-left active"><a href="#default-delivery" data-toggle="tab">기본배송지 선택</a></li>
                <li class="pull-left"><a href="#add-delivery" data-toggle="tab">배송지 추가</a></li>
            </ul>
        </div>
        <div id="myDelivery-inner" class="tab-content">
            <div id="side-wrap" class="side-wrap">
                <nav id="sidenav">
                    <span class="close-sidenav">&times;</span>
                    <div id="ham-container">
                        <div id="ham-header">
                            <div id="ham-first">
                                <!--ham-name은 로그인 했을때 해당 회원이름-->
                                <div id="ham-name">
                                    <strong class="ham-name-big">김나래</strong><span class="welcom">님 안녕하세요.</span>
                                </div>

                            </div>
                            <div id="ham-second">
                                <ul id="ham-second-inner">
                                    <li id="link-mypage">
                                        <a href="myPage.html">
                                            <span class="link-desc">마이페이지</span>
                                        </a>
                                    </li>
                                    <li id="link-jjim">
                                        <a href="#">
                                            <span class="link-desc">찜한상품</span>
                                            <span class="badge">5</span>
                                        </a>
                                    </li>
                                    <li id="link-coupon">
                                        <a href="myPage.html">
                                            <span class="link-desc">쿠폰</span>
                                            <span class="badge">5</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div id="ham-content">
                            <div id="ham-body">
                                <ul>
                                    <li><a href="#">대학생용</a></li>
                                    <li><a href="#">비지니스용</a></li>
                                    <li><a href="#">초경량</a></li>
                                    <li><a href="#">맥북</a></li>
                                    <li><a href="#">그래픽작업</a></li>
                                    <li><a href="#">게이밍</a></li>
                                    <li><a href="#">최저가</a></li>
                                    <li><a href="#">디자인작업</a></li>
                                </ul>
                            </div>
                            <div id="ham-footer">
                                <div id="ham-footer-first">
                                    <ul class="list-inline">
                                        <li><a href="../LCS/qNews.html">뉴스</a></li>
                                        <li><a href="../SBS/qResell.html">중고거래</a></li>
                                        <li><a href="../SBS/notice.html">공지사항</a></li>
                                    </ul>
                                </div>
                                <div id="ham-footer-second">
                                    <ul class="ham-footer-inner">
                                        <li>
                                            <a href="../KE/login.html">로그인/로그아웃</a>
                                        </li>
                                        <li>
                                            <a href="customService.html">고객센터</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <!-- -------------최근 본 상품 시작------------ -->
            <div id="side-wrap2">

                <div id="sidenav-right">
                    <span class="close-sidenav">&times;</span>
                    <span class="del-pro">상품 삭제하기</span>
                    <div id="newpro-container">
                        <div id="newpro-header">
                            <h3>최근 본 상품</h3>
                            <div class="latelyItem-ui-wrap">
                                <label class="chk-allSelect">
                                    <input type="checkbox">
                                    전체선택
                                </label>
                                <button type="button" class="btn-del" name="button">삭제</button>
                            </div>
                        </div>
                        <div id="sidemenu-scroll-latelyItem">
                            <div class="scroll-wrap">
                                <ul class="list-latelyItem">
                                    <li>
                                        <a href="#">
                                            <img src="../img/v01.jpg" alt="썸네일 이미지">
                                        </a>
                                        <label class="ui-chk select">
                                            <input type="checkbox">
                                        </label>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="../img/v01.jpg" alt="썸네일 이미지">
                                        </a>
                                        <label class="ui-chk select">
                                            <input type="checkbox">
                                        </label>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="../img/v01.jpg" alt="썸네일 이미지">
                                        </a>
                                        <label class="ui-chk select">
                                            <input type="checkbox">
                                        </label>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="../img/v01.jpg" alt="썸네일 이미지">
                                        </a>
                                        <label class="ui-chk select">
                                            <input type="checkbox">
                                        </label>
                                    </li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- -------------최근 본 상품 끝----------- -->
            <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
            <div id="fixed-q-menu">
                <ul>
                    <li>
                        <a href="#" id="hamburger" class="show_hide"><img src="../img/menu.png"></a>
                    </li>
                    <li><a href="../LDE/qEvent.html"><img src="../img/event.png"></a></li>
                    <li><a href="../LDE/myPage.html"><img src="../img/mypage.png"></a></li>
                    <li><a href="../LCS/jjim.html"><img src="../img/jjim.png"></a></li>
                    <li><a href="#" id="newpro"><img src="../img/chronometer.png"></a></li>
                </ul>
            </div>
            
            <!-- ==================================================================================== -->
            <c:choose>
				<c:when test="${member == null}">
					<h2>session 없음</h2>
				</c:when>
				<c:otherwise>
					<h2>session=${member.mem_no}</h2>
				</c:otherwise>
			</c:choose>
            
            
            <div id="default-delivery" class="tab-pane fade in active">
                <div class="delivery-list">
                    <ul>
                        <li>
                            <input type="radio" name="mydelivery" id="mydelivery" checked>
                            <div class="delivery-info">
                                <p>${output.mem_addr1}</p>
                                <p>${output.mem_addr2}</p>
                                <p>010-1111-1111</p>
                            </div>
                            <div class="delete-delivery">
                                <img src="${pageContext.request.contextPath}/assets/img/close.png">
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="add-delivery" class="tab-pane fade in">
                <div class="delivery-form">
                    <form method="post">
                        <div class="form-info">
                            <p>주소별칭</p>
                            <p>받으실 분</p>
                            <p>연락처</p>
                            <p>배송주소</p>
                        </div>
                        <div class="form-detail">
                            <input type="text" name="del-nick" id="del-nick" placeholder="주소 별칭">
                            <input type="text" name="del-receiver" id="del-receiver" placeholder="받으실 분">
                            <input type="tel" name="del-tel" id="del-tel">
                            <div class="del-post">
                                <input type="text" name="del-postcode" id="del-postcode">
                                <button type="button" class="del-find" id="del-find">주소찾기</button>
                            </div>
                            <input type="text" name="del-address" id="del-address">
                            <input type="text" name="del-address-detail" id="del-address-detail">
                        </div>
                    </form>
                </div>
                <div id="cancel-link-button">
                    <div id="cancel-back">
                        <a href="${pageContext.request.contextPath}/mypage/memInfoChange.do" class="offbtn1">취소</a>
                    </div>
                    <div id="link-add-submit">
                        <a href="#">추가</a>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <div id="footer-button">
                <!--로그인되어있으면 로그아웃/ 로그아웃 되어있으면 로그인-->
                <div class="pull-left text-center">
                    <a href="${pageContext.request.contextPath}/login/login.do">로그아웃/로그인</a>
                </div>
                <div class="pull-left text-center">
                    <a href="${pageContext.request.contextPath}/center/customService.do">고객센터</a>
                </div>
            </div>
            <div id="footer-explain" class="clear">
                <ul>
                    <li class="pull-left"><a href="#">이용약관</a></li>
                    <li class="pull-left"><a href="#">개인정보처리방침</a></li>
                    <li class="pull-left"><a href="#">청소년보호정책</a></li>
                </ul>
            </div>
            <div id="copyright" class="clear">
                <address>
                    대표 : 김나래<br>
                    사업자 등록번호 : 000-00-00000<br>
                    주소 : 울릉군 울릉읍 독도리<br>
                    통신판매업 등록번호 : 2014-서울강남-00000호<br>
                    대표전화 : 1566-5588
                </address>
                <p>copyright ⓒ all ncnc all right.</p>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js">
    </script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        /* 아코디언 메뉴 액션 */
        $(function() {
            /* -----햄버거 사이드 메뉴 열기---- */

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

            /* 우편번호 찾기 버튼 클릭 시 */
            $("#del-find").click(function() {
                // 다음 우편번호 API 연동
                new daum.Postcode({
                    oncomplete: function(data) {
                        // $("#input_add").val(data.input_add);
                        // 우편번호 입력칸에 입력값 받아오기
                        jQuery("#del-postcode").val(data.zonecode);
                        // 주소 입력칸에 입력값 받아오기
                        jQuery("#del-address").val(data.address);
                    }
                }).open();
                // 상세주소 입력칸에 포커스
                $("#del-address-detail").focus();
            });
            /* 우편번호 찾기 끝 */
        })
    </script>
</body></html>

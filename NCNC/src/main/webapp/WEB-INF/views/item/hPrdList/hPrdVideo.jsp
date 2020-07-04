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
    <title>상품 목록 보기</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/hPrdList.css" />
    <!--Swiper CSS-->
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <!-- handlebar plugin -->
    <script src="${pageContext.request.contextPath}/plugins/handlebars/handlebars-v4.0.5.js"></script>
    <!-- js파일 외부 참조 -->
    <script src="../data.js"></script>
</head>

<body>
    <div id="container">
        <!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
	<!-- 고정 header -->
      <div id="header" class="header-wrap">
            <div class="logo-search-wrap">
                <h1 class="logo">
                	<a href="${pageContext.request.contextPath}/home.do" data-sc-action="topbar.click" data-dimension-name="topbar.name" data-dimension-value="Topbar^lalavla">
                		<img src="${pageContext.request.contextPath}/img/logo4.png" alt="랄라블라 로고">
                	</a>
                </h1>
                <form method="get" class="inp-search">
                    <input type="search" name="keyword" placeholder="니컴이 내컴이고 내컴이 니컴이다." id="keyword" value="${keyword}"/>
                    <button type="submit" class="btn-search">검색</button>
                </form>
                <a href="${pageContext.request.contextPath}/mypage/cartList.do" class="btn-basket">장바구니 바로가기</a>
            </div>
        </div>

<h2 class="mini-title">영상편집/노트북</h2>
        <!-- //고정 header-->
        <div id="content">
            <!-- -------------햄버거 메뉴 시작------------ -->
            <%@ include file="/WEB-INF/views/inc/hamMenu.jsp" %>
            <!-- -------------햄버거 메뉴 끝------------ -->
            
            
            <!-- -------------최근 본 상품 시작------------ -->
            <%@ include file="/WEB-INF/views/inc/recentItem.jsp" %>
            <!-- -------------최근 본 상품 끝----------- -->
            
            
            <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
            			<div id="fixed-q-menu">
				<ul>
					<li>
						<a href="#" id="hamburger" class="show_hide"><img src="${pageContext.request.contextPath}/img/menu.png"></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/qmenu/qEvent.do"><img src="${pageContext.request.contextPath}/img/event.png"></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/mypage/myPage.do"><img src="${pageContext.request.contextPath}/img/mypage.png"></a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/mypage/jjim.do"><img src="${pageContext.request.contextPath}/img/jjim.png"></a>
					</li>
					<li>
						<a href="#" id="newpro"><img src="${pageContext.request.contextPath}/img/chronometer.png"></a>
					</li>
				</ul>
			</div>
            <!--본문 영역-->
            <div id="search-list">
                <!-- 대분류 카테고리 탭 메뉴 시작 -->
                <div id="search-title" class="swiper-container">
                    <ul class="swiper-wrapper nav nav-tabs">
                        <li class="swiper-slide active"><a href="#search-category-1" data-toggle="tab">제조사</a></li>
                        <li class="swiper-slide"><a href="#search-category-2" data-toggle="tab">CPU 종류</a></li>
                        <li class="swiper-slide"><a href="#search-category-3" data-toggle="tab">화면크기</a></li>
                        <li class="swiper-slide"><a href="#search-category-4" data-toggle="tab">메모리용량</a></li>
                        <li class="swiper-slide"><a href="#search-category-5" data-toggle="tab">운영체제</a></li>
                        <li class="swiper-slide"><a href="#search-category-6" data-toggle="tab">무게</a></li>
                    </ul>
                </div>
                <!-- 카테고리 탭 메뉴 끝 -->
                <!-- 중분류 탭 화면 시작 -->
                <div class="tab-content" id="search-subtitle">
                    <div class="tab-pane fade in active sub-list" id="search-category-1">
                        <ul class="search-category-1-list">
                          <!--    <li><a href="#" class="select">ASUS</a></li>-->
                            <li><a href="#" class="select">HP</a></li>
                            <li><a href="#" class="select">Lenovo</a></li>
                            <li><a href="#" class="select">LG</a></li>
                            <li><a href="#" class="select">SAMSUNG</a></li>
                            <li><a href="#" class="select">APPLE</a></li>
                          <!--   <li><a href="#" class="select">한성컴퓨터</a></li> -->
                            <!--  <li><a href="#" class="select">기타</a></li>  -->
                        </ul>
                    </div>
                    <div class="tab-pane fade sub-list" id="search-category-2">
                        <ul class="search-category-2-list">
                            <li><a href="#" class="select1">퀼컴</a></li>
     <!-- 인텔 이름 -->      <li><a href="#" class="select1">인텔 i3</a></li>
                            <li><a href="#" class="select1">인텔 i5</a></li>
                            <li><a href="#" class="select1">인텔 i7</a></li>
                            <li><a href="#" class="select1">인텔 i9</a></li>
                            <li><a href="#" class="select1">인텔 펜티엄 골드</a></li>
                            <li><a href="#" class="select1">AMD</a></li>
                         <!--    <li><a href="#" class="select">라이젠 7</a></li>  -->
                        </ul>
                    </div>
                    <div class="tab-pane fade sub-list" id="search-category-3">
                        <div id="search-category-3">
                            <ul>
                               <li><a href="#" class="select2">13.3</a></li>
                                <li><a href="#" class="select2">14</a></li>
                                <li><a href="#" class="select2">15.4</a></li>
                                <li><a href="#" class="select2">15.6</a></li>
                                <li><a href="#" class="select2">17</a></li>
                                <li><a href="#" class="select2">17.3</a></li>
                              <!--   <li><a href="#" class="select">표준노트북</a></li>  -->
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade sub-list" id="search-category-4">
                        <div id="search-category-4">
                            <ul>
                                <li><a href="#" class="select3">4</a></li>
                                <li><a href="#" class="select3">8</a></li>
                                <li><a href="#" class="select3">16</a></li>
                                <li><a href="#" class="select3">32</a></li>
                                <li><a href="#" class="select3">64</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade sub-list" id="search-category-5">
                        <div id="search-category-5">
                            <ul>
                                <li><a href="#" class="select4">윈도우10</a></li>
                                <li><a href="#" class="select4">리눅스</a></li>
								<li><a href="#" class="select4">macOs</a></li>
                                <li><a href="#" class="select4">Sierra</a></li>
                                <li><a href="#" class="select4">Catalina</a></li>
								 <li><a href="#" class="select4">Yosemite</a></li>
                         		 <li><a href="#" class="select4">운영체제 미포함</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade sub-list" id="search-category-6">
                        <div id="search-category-6">
                            <ul><!-- 이름값 바꿔주고 범위설정 -->
                                <li><a href="#" class="select5">0.9Kg</a></li>
                                <li><a href="#" class="select5">1.0Kg</a></li>
                                <li><a href="#" class="select5">1.1Kg</a></li>
                                <li><a href="#" class="select5">1.2Kg</a></li>
                                <li><a href="#" class="select5">1.3Kg</a></li>
                                <li><a href="#" class="select5">1.4Kg</a></li>
                                <li><a href="#" class="select5">1.5Kg</a></li>
                                <li><a href="#" class="select5">1.6Kg</a></li>
                                <li><a href="#" class="select5">1.7Kg</a></li>
                                <li><a href="#" class="select5">1.8Kg</a></li>
                                <li><a href="#" class="select5">2.0Kg</a></li>
                                <li><a href="#" class="select5">2.1Kg</a></li>
                                <li><a href="#" class="select5">2.2Kg</a></li>
                                <li><a href="#" class="select5">2.3Kg</a></li>
                                <li><a href="#" class="select5">2.4Kg</a></li>                                
                                
                            </ul>
                        </div>
                    </div>
                </div> 
                <!-- //중분류 탭 화면-->
                <!--인기순/최신순/높은가격/낮은가격 중분류 탭 버튼-->
                <div id="pro-content-list">
                    <!--내용영역-->
                    <div id="pro-content-list-inner" class="tab-content thum-list-comm">
                        <div id="qpro-list-best" class="tab-pane fade in active univer-favorite-list">
  						 <ul>
                            	<c:choose>
                         	<c:when test="${VideoHot == null || fn:length(VideoHot) == 0}">
                         	<h2>조회결과가 없습니다.</h2>
                        		<!-- 조회결과없습니다. -->
                        		</c:when>
                		<c:otherwise>
                			<c:forEach var="item" items="${VideoHot}" varStatus="status" >
                			<c:set var="name" value="${item.item_name}"/>
                			
                			<c:url value="/item/prdDetail.do" var="viewUrl">
                				<c:param name="item_no" value="${item.item_no}"/>
                			</c:url>
	
                         
                                <li class="pull-left">
                                    <a href="${viewUrl}">
                                        <span class="top-area">
					<span class="img-area" id="img-detail" style="background-image: url(${item.origin_name})"></span>	
                                                
                                                <span class="best-pro-num"></span>
                                            </span>
                                        
                                        <span class="bottom-area">
                                            <span class="pro-brand">[<span class="ro-brand-title">${item.item_brand}</span>]</span>
                                            <span class="pro-title">${item.item_name}</span>
                                            <span class="pro-price">
                                                <span class="per">${item.item_discount}%</span>
                                                <span class="price">
                                                    <span class="pre-price"><fmt:formatNumber pattern="###,###,###" value="${item.item_price}" /></span><fmt:formatNumber pattern="###,###,###" value="${item.item_payment}" />
                                                    <span class="won">원</span>
                                                </span>
                                            </span>
                                        </span>
                                    </a>
                                </li>
                      </c:forEach>
                		</c:otherwise>
                	</c:choose>
                            </ul>

                        </div>
                        
                        
                        
                    </div><!-- //pro-content-list-inner-->
                </div><!-- //pro-content-list-->
            </div><!-- //search-list-->
        </div><!-- //content-->
        <!--고정 footer-->
        <%@ include file="/WEB-INF/views/inc/footer.jsp" %>
        <!-- //고정 footer-->
        <!--탑버튼-->
        <div id="top_wrap">
           <a href="#top"><img src="${pageContext.request.contextPath}/img/arrow-up2.png"></a>
        </div>
    </div><!-- //container-->
    <!--Javascript-->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <!--Swiper JS -->
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
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


        $(function(){
	           $("#keyword").click(function(){
	              location.href="${pageContext.request.contextPath}/search/search.do";
	           });
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



        /* -----대분류 카테고리 탭 메뉴(제조사) Swiper----  */
        var swiper_1 = new Swiper('.swiper-container', {
            pagination: '.swiper-pagination',
            slidesPerView: 5, //한 번에 보여질 갯 수
            paginationClickable: true,
            spaceBetween: 0,
            freeMode: true,
            pagination: false,
            mousewheelControl: true, // 마우스 휠로 슬라이드 움직임
            nextButton: '.swiper-button-next', //다음페이지 이동
            prevButton: '.swiper-button-prev' //이전페이지 이동
        });

        $('.tabs > li > a').on('click', function(e) {
            $(this).parent().addClass('active').siblings().removeClass('active');
            var tabIdx = $(this).parent().index();
        });
    });
        
        
        
       /* -----상품 더보기----  */
        function get_list() {
            var template = Handlebars.compile($(".data_tmpl").html());
            var html = template(data);
            $(".result").append(html);
        }
        $(function() {
            $(".more-view>a").click(function() {
                get_list();

            });
        });
 
        
        // 클릭한 텍스트 가져오기 tostring으로 묶일것은 클래이름 이름 다른것 주고 따로 표현하기.
		$(function(){
			$(".select").click(function(){
				var select = $(this).html();
				/** 이름을 바꾸고싶다면. */
				if(select == "APPLE") {
					select = "AP"
				}
				location.href = "${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do?item_brand="+select;
			})
		})
		
				$(function(){
			$(".select1").click(function(){
				var select = $(this).html();

				location.href = "${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do?&item_cpu="+select;
			})
		})
		
			$(function(){
			$(".select2").click(function(){
				var select = $(this).html();

				location.href = "${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do?&item_inch="+select;
			})
		})
		
					$(function(){
			$(".select3").click(function(){
				var select = $(this).html();

				location.href = "${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do?&item_ram="+select;
			})
		})
		
							$(function(){
			$(".select4").click(function(){
				var select = $(this).html();

				location.href = "${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do?&item_os="+select;
			})
		})
		
		$(function(){
			$(".select5").click(function(){
				var select = $(this).html();
				/** 이름을 바꾸고싶다면. */
				if(select == "0.9Kg") {
					select = "0.9";
				} else if( select == "1.0Kg" ){
					select = "1.0";
				} else if( select == "1.1Kg" ){
					select = "1.1";
				} else if( select == "1.2Kg" ){
					select = "1.2";
				} else if( select == "1.3Kg" ){
					select = "1.3";
				} else if( select == "1.4Kg" ){
					select = "1.4";
				} else if( select == "1.5Kg" ){
					select = "1.5";
				} else if( select == "1.6Kg" ){
					select = "1.6";
				} else if( select == "1.7Kg" ){
					select = "1.7";
				} else if( select == "1.8Kg" ){
					select = "1.8";
				} else if( select == "2.0Kg" ){
					select = "2.0";
				} else if( select == "2.1Kg" ){
					select = "2.1";
				} else if( select == "2.2Kg" ){
					select = "2.2";
				} else if( select == "2.3Kg" ){
					select = "2.3";
				} else if( select == "2.4Kg" ){
					select = "2.4";
				} 
				
				location.href = "${pageContext.request.contextPath}/item/hPrdList/hPrdVideo.do?&item_weight="+select;
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
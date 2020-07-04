<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>퀵메뉴 노트북</title>
    <!-- 모바일 웹 페이지 설정 -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/logo3.png" />
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/img/apple-touch-icon-144-logo3.png" />
    <!--bootstrap-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <!--나눔고딕 웹 폰트 적용-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400|Ubuntu&display=swap&subset=korean" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qPrdList.css" />
    <!-- 가격 구분 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:700|Ubuntu:500&display=swap" rel="stylesheet">
    <!--swiper CSS-->
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    <!-- handlebar plugin -->
    <script src="../plugins/handlebars/handlebars-v4.0.5.js"></script>
</head>

<body>
    <div id="container">
        <!--고정 header / 햄버거 상품목록페이지에서는 다른 헤더 필요-->
        <%@ include file="../inc/head.jsp" %>
        <div id="qpro-content">
            <!-- -------------햄버거 메뉴 시작------------ -->
            <%@ include file="../inc/hamMenu.jsp" %>
            <!-- -------------햄버거 메뉴 끝------------ -->
            
            
			<div id="quick-menu" class="text-center clear">
				<!--탭 기능-->
				<ul>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/home.do">홈</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qPrdList.do" class="atvthis">노트북</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qNews.do">뉴스</a>
					</li>
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qBest.do" >베스트</a>
					</li>
				<!--<li class="pull-left text-center">
                        <a href="../SBS/qResell.html">중고거래</a>
                    </li> 추후구현-->
					<li class="pull-left text-center">
						<a href="${pageContext.request.contextPath}/qmenu/qEvent.do">이벤트</a>
					</li>
				</ul>
				<!--탭 기능 끝-->
			</div>
            <!-- -------------최근 본 상품 시작------------ -->
           <%@ include file="../inc/recentItem.jsp" %>
            <!-- -------------최근 본 상품 끝----------- -->
            <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
            <%@ include file="../inc/fixed.jsp" %>
            <!--메인 퀵메뉴/ 햄버거 상품목록페이지에서는 숨기기 / 스크롤을 밑으로 내릴때 헤더는 사라지고 퀵메뉴만 노출 -->
            <%@ include file="../inc/hamMenu.jsp" %>
            <!-- 따라다니는 fixed 퀵메뉴 / 상품 상세페이지에서는 숨기기 /
            스크롤을 올릴때 위로 올라오는 기능-->
            
            <div id="qpro-header">
                <h2>노트북</h2>
            </div>
            <div id="q-pr-list">
                <!--대학생/비즈니스/게이밍/디자인/초경량/그래픽 대분류 탭버튼-->
                <div class="swiper-container tab" id="q-list-top-tab">
                   <ul class="swiper-wrapper nav nav-tabs">
                        <li class="swiper-slide active">
                            <a class="tab-button-item-link selected" href=".univer-favorite-list"  
                            data-toggle="tab">
                                <i class="icon" id="icon_uni">
                                    <img src="../img/qnot/qnot_01_2.png">
                                </i>
                                <span>대학생</span>
                            </a>
                        </li>
                        <li class="swiper-slide tab-pane in fade">
                            <a class="tab-button-item-link " href=".business-favorite-list"
                            data-toggle="tab">
                                <i class="icon" id="icon_buss">
                                    <img src="../img/qnot/qnot_02_2.png">
                                </i>
                                <span>비즈니스</span>
                            </a>
                        </li>
                        <li class="swiper-slide tab-pane in fade">
                            <a class="tab-button-item-link " href=".gaming-favorite-list"
                            data-toggle="tab">
                                <i class="icon">
                                    <img src="../img/qnot/qnot_03_2.png">
                                </i>
                                <span>게이밍</span>
                            </a>
                        </li>
                        <li class="swiper-slide tab-pane in fade">
                            <a class="tab-button-item-link " href=".Graphic-favorite-list"
                            data-toggle="tab">
                                <i class="icon">
                                    <img src="../img/qnot/qnot_04_2.png">
                                </i>
                                <span>그래픽</span>
                            </a>
                        </li>
                        <li class="swiper-slide tab-pane in fade">
                            <a class="tab-button-item-link " href=".Light-favorite-list"  
                            data-toggle="tab">
                                <i class="icon">
                                    <img src="../img/qnot/qnot_05_2.png">
                                </i>
                                <span>초경량</span>
                            </a>
                        </li>
                        <li class="swiper-slide tab-pane in fade">
                            <a class="tab-button-item-link " href=".Video-favorite-list"  data-toggle="tab">
                                <i class="icon">
                                    <img src="../img/qnot/qnot_06_2.png">
                                </i>
                                <span>영상편집</span>
                            </a>
                        </li>
                    </ul>
                </div>
                
			<!-- 내용영역 -->
                <div id="pro-content-list" class="tab-pane fade in active">
                
                    <!--내용영역-->
                    <div id="pro-content-list-inner" class="tab-content thum-list-comm">

                        <div id="qpro-list-best" class="tab-pane fade in active univer-favorite-list">
  						 <ul>
                            	<c:choose>
                         	<c:when test="${UniHot == null || fn:length(UniHot) == 0}">
                         	<h2>조회결과가 없습니다.</h2>
                        		<!-- 조회결과없습니다. -->
                        		</c:when>
                		<c:otherwise>
                			<c:forEach var="item" items="${UniHot}" varStatus="status" >
                			<c:set var="name" value="${item.item_name}"/>
                			
                			<c:url value="/item/prdDetail.do" var="viewUrl">
                				<c:param name="item_no" value="${item.item_no}"/>
                			</c:url>
	
                         
                                <li class="pull-left">
                                    <a href="${viewUrl}">
                                        <span class="top-area">
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
                                            
                                            
                                                
                                                <span class="best-pro-num"></span>
                                            </span>
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
                         <div id="qpro-list-best1" class="tab-pane fade business-favorite-list">
                            	 <ul>
                            	<c:choose>
                         	<c:when test="${BussinessHot == null || fn:length(BussinessHot) == 0}">
                         	<h2>조회결과가 없습니다.</h2>
                        		<!-- 조회결과없습니다. -->
                        		</c:when>
                		<c:otherwise>
                			<c:forEach var="item" items="${BussinessHot}" varStatus="status" >
                			<c:set var="name" value="${item.item_name}"/>
                			
                			<c:url value="/item/prdDetail.do" var="viewUrl">
                				<c:param name="item_no" value="${item.item_no}"/>
                			</c:url>

                           
                                <li class="pull-left">
                                    <a href="${viewUrl}">
                                        <span class="top-area">
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
                                                <span class="best-pro-num"></span>
                                            </span>
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
      
                         <div id="qpro-list-best2" class="tab-pane fade gaming-favorite-list">
                            	<ul>
                            	<c:choose>
                         	<c:when test="${GamingHot == null || fn:length(GamingHot) == 0}">
                         	<h2>조회결과가 없습니다.</h2>
                        		<!-- 조회결과없습니다. -->
                        		</c:when>
                		<c:otherwise>
                			<c:forEach var="item" items="${GamingHot}" varStatus="status" >
                			<c:set var="name" value="${item.item_name}"/>
                			
                			<c:url value="/item/prdDetail.do" var="viewUrl">
                				<c:param name="item_no" value="${item.item_no}"/>
                			</c:url>

                            
                                <li class="pull-left">
                                    <a href="${viewUrl}">
                                        <span class="top-area">
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
                                                <span class="best-pro-num"></span>
                                            </span>
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
                        
                        
                        
                        
                                          
                         <div id="qpro-list-best3" class="tab-pane fade Graphic-favorite-list">
                            	 <ul>
                            	<c:choose>
                         	<c:when test="${GraphicHot == null || fn:length(GraphicHot) == 0}">
                        		<!-- 조회결과없습니다. -->
                        		</c:when>
                		<c:otherwise>
                			<c:forEach var="item" items="${GraphicHot}" varStatus="status" >
                			<c:set var="name" value="${item.item_name}"/>
                			
                			<c:url value="/item/prdDetail.do" var="viewUrl">
                				<c:param name="item_no" value="${item.item_no}"/>
                			</c:url>

                           
                                <li class="pull-left">
                                    <a href="${viewUrl}">
                                        <span class="top-area">
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
                                                <span class="best-pro-num"></span>
                                            </span>
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
                        
                        
                        
                        
                                            
                         <div id="qpro-list-best4" class="tab-pane fade Light-favorite-list">
                            <ul>
                            	<c:choose>
                         	<c:when test="${LightHot == null || fn:length(LightHot) == 0}">
                        		<!-- 조회결과없습니다. -->
                        		</c:when>
                		<c:otherwise>
                			<c:forEach var="item" items="${LightHot}" varStatus="status" >
                			<c:set var="name" value="${item.item_name}"/>
                			
                			<c:url value="/item/prdDetail.do" var="viewUrl">
                				<c:param name="item_no" value="${item.item_no}"/>
                			</c:url>

                            
                                <li class="pull-left">
                                    <a href="${viewUrl}">
                                        <span class="top-area">
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
                                                <span class="best-pro-num"></span>
                                            </span>
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
                        
                        
                        
                        
                                            
                         <div id="qpro-list-best5" class="tab-pane fade Video-favorite-list">
                            <ul>
                               <c:choose>
                            <c:when test="${VideoHot == null || fn:length(LightHot) == 0}">
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
                                            <span class="img-area" style="background-image: url(${item.origin_name})">
                                                <span class="best-pro-num"></span>
                                            </span>
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
                    </div>
                    
                </div>                    
                </div>

            <!--고정 footer-->
            <%@ include file="../inc/footer.jsp" %>
        </div>
    </div>
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
    <script type="text/javascript">


    
    $(function() {
        $(".more-view>a").click(function() {
            get_list();

        });
    });
    
    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
         slidesPerView: 5, //한 번에 보여질 갯 수
         paginationClickable: true,
         spaceBetween: 60,
         freeMode: true,
         pagination: false,
         mousewheelControl: true, // 마우스 휠로 슬라이드 움직임
         nextButton: '.swiper-button-next', //다음페이지 이동
         prevButton: '.swiper-button-prev' //이전페이지 이동
     });




    $(function(){
        $("#keyword").click(function(){
           location.href="${pageContext.request.contextPath}/search/search.do";
        });
     });
    
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
	
    </script>
</body>

</html>
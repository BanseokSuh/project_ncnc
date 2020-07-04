<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css" />
<title>Insert title here</title>
</head>
<body>
	<div id="side-wrap2">

         <div id="sidenav-right">
            <span class="close-sidenav">&times;</span> <span class="del-pro">상품
               삭제하기</span>
            <div id="newpro-container">
               <div id="newpro-header">
                  <h3>최근 본 상품</h3>
                  <div class="latelyItem-ui-wrap">
                     <label class="chk-allSelect"> <input type="checkbox"
                        id="all_check"> 전체선택
                     </label>
                     <button type="button" class="btn-del" name="button">삭제</button>
                  </div>
               </div>
               <div id="sidemenu-scroll-latelyItem">
                  <div class="scroll-wrap">
                     <ul class="list-latelyItem">
                        <div style="font-size:20px; text-align:center; margin-top:20px;">서비스 준비 중 입니다.</div>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
</body>
</html>
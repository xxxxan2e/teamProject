<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/free.css">
<meta charset="UTF-8">
<title>Insert title here</title> 
</head><body>

    <div class="w3-container">
        <h3 class="w3-center">${boardName}</h3>
        <table>
          
            <tr>
              	<th>번호</th>
  			  	<th>이름</th>
  				<th>제목</th>
   				<th>파일</th>
   				<th>입력일</th>
  				<th>조회수</th>
  				<c:set var="boardNum"  value="${boardNum}"/>
  <c:forEach  var="b"  items="${list }">
  <tr>
   <td>${boardNum}</td>
   <c:set var="boardNum"  value="${boardNum-1}"/>
  <td>${b.name}</td>
  <td><a  href="${pageContext.request.contextPath}/board/boardComment?num=${b.num}">${b.subject}</a></td>
  <td>${b.file1}</td>
  <td>${b.getRegdate2()}</td>
  <td>${b.readcnt}</td>
   </tr>
  
  </c:forEach>
            </tr>
          
          <tbody>
           
          </tbody>
        </table>
        <div class="row">
        <div class="col">
        <div class="search-bar" style="margin-right: 550px; width: 100%;">
            <input type="text" id="search-input" placeholder="검색">
            <button id="search-button">검색</button>
        </div>
	</div>
	<div class="col">
      <a class="button-wrapper" href="${pageContext.request.contextPath}/board/write"   
      style="text-decoration:none; text-align:right; padding:20px; margin-left: 750px width: 100%;">
        <button type="submit" class="write-button"  >글쓰기</button>
    </a>
    </div>
    </div>
  

	  
      <div class="pagination">
      <c:if test="${start < bottomLine }" >
        <a href="#" class="active">[이전]</a>
        </c:if>
        <c:if test="${start > bottomLine }" >
        <a href="${pageContext.request.contextPath}/board/free?pageNum=${start-bottomLine}"
         class="w3-button">[이전]</a>
        </c:if>
        <c:forEach  var="p"  begin="${start}"  end="${end}">
        <a href="${pageContext.request.contextPath}/board/free?pageNum=${p}"
        class="w3-button <c:if test="${pageInt==p}">w3-red </c:if> ">${p}</a>
        </c:forEach>
        
        <c:if test="${end >= maxPage }" >
        <a href="#" class="w3-button  w3-disabled">다음</a>
        </c:if>
        <c:if test="${end <  maxPage }" >
        <a href="${pageContext.request.contextPath}/board/free?pageNum=${start+bottomLine}"
        class="w3-button ">[다음]</a>
        </c:if>
      </div>
</div>    
</body>
</html>
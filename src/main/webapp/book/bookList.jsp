<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
    .container { max-width: 1000px; margin: 0 auto; background-color: white; }
    .header { border: 2px solid #333; padding: 20px; display: flex; justify-content: space-between; align-items: center; }
    .logo { padding: 10px 20px; font-weight: bold; cursor:pointer; }
    .user-info div { border: 1px solid #666; padding: 8px 15px; cursor: pointer; }
    h2 { text-align: center; margin: 20px 0; }
    .category-links { text-align: center; margin-bottom: 20px; }
    .category-links a { text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px; }
    .result-info { border: 1px solid #666; padding: 15px; margin-bottom: 20px; background-color: #f9f9f9; text-align: center; color: red; font-weight: bold; }
    .book-list { border: 2px solid #333; padding: 20px; }
    .book-item { border: 1px solid #666; padding: 20px; margin-bottom: 15px; display: flex; gap: 20px; cursor:pointer; }
    .book-image { border: 1px solid #ccc; width: 100px; height: 120px; display: flex; align-items: center; justify-content: center; background-color: #f5f5f5; }
    .book-info { flex: 1; }
    .book-title { font-weight: bold; font-size: 18px; margin-bottom: 10px; border: 1px solid #ccc; padding: 8px; }
    .book-details div { margin-bottom: 5px; padding: 5px; border: 1px solid #eee; }
</style>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border:none; outline:none;">
        </div>
        <div class="user-info">
            <div onclick="location.href='${pageContext.request.contextPath}/main'">홈으로</div>
        </div>
    </div>

    <!-- 제목 -->
    <h2>
        <c:choose>
            <c:when test="${not empty selectedCategory}">
                ${selectedCategory} 카테고리 도서 목록
            </c:when>
            <c:otherwise>
                전체 도서 정보
            </c:otherwise>
        </c:choose>
    </h2>

    <!-- 카테고리 링크 -->
    <div class="category-links">
        <a href="bookList">전체</a>
        <a href="bookList?category=소설/문학">소설/문학</a>
        <a href="bookList?category=인문/사회">인문/사회</a>
        <a href="bookList?category=자연과학/기술">자연과학/기술</a>
        <a href="bookList?category=예술/취미">예술/취미</a>
        <a href="bookList?category=아동/청소년">아동/청소년</a>
    </div>

    <!-- 도서 리스트 -->
    <div class="result-info">
    <c:choose>
        <c:when test="${empty bookList}">
            등록된 도서가 없습니다.
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${not empty selectedCategory}">
                    ${selectedCategory} : 총 ${fn:length(bookList)}권
                </c:when>
                <c:otherwise>
                    전체 도서 : 총 ${fn:length(bookList)}권
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
</div>

    <div class="book-list">
        <c:forEach var="book" items="${bookList}">
            <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bookNo=${book.bookNo}'">
                <div class="book-image">
                    <img src="${pageContext.request.contextPath}/image/book/all/${book.bookNo}.jpg" 
                         alt="${book.bookName}" style="width: 100px; height: 120px; object-fit: cover;">
                </div>
                <div class="book-info">
                    <div class="book-title">${book.bookName}</div>
                    <div class="book-details">
                        <div><strong>저자:</strong> ${book.bookAuthor}</div>
                        <div><strong>출판사:</strong> ${book.bookPublisher}</div>
                        <div><strong>카테고리:</strong> ${book.bookCategory}</div>
                        <div><strong>도서번호:</strong> ${book.bookNo}</div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
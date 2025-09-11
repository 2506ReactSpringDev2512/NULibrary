<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 목록 - NU 대학교 중앙도서관</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    body { background-color: #ffffff; }
    .container { width: 100%; margin: 0; background-color: #ffffff; min-height: 100vh; }
    
    /* 기존 CSS 리셋 */
    .page-content * {
        box-sizing: border-box;
    }
    .book-list {
        display: block !important;
    }
    .page-content { 
        padding: 40px 60px; 
        max-width: 1200px; 
        margin: 0 auto; 
        min-height: calc(100vh - 400px);
    }
    .page-title { 
        text-align: center; 
        margin: 30px 0; 
        font-size: 28px; 
        font-weight: 600; 
        color: #2c5282; 
    }
    .category-links { 
        text-align: center; 
        margin-bottom: 30px; 
    }
    .category-links a { 
        text-decoration: none; 
        color: #2c5282; 
        padding: 12px 24px; 
        border: 2px solid #2c5282; 
        background-color: white; 
        margin: 0 8px; 
        border-radius: 8px;
        transition: all 0.3s ease;
        font-weight: 500;
        display: inline-block;
    }
    .category-links a:hover {
        background-color: #2c5282;
        color: white;
        transform: translateY(-2px);
    }
    .result-info { 
        border: 2px solid #2c5282; 
        padding: 20px; 
        margin-bottom: 30px; 
        background-color: #f8f9fa; 
        text-align: center; 
        color: #2c5282; 
        font-weight: bold; 
        border-radius: 8px;
        font-size: 18px;
    }
    .book-list { 
        border: 1px solid #e9ecef; 
        padding: 30px; 
        border-radius: 12px; 
        background-color: white; 
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    .book-item { 
        border: 2px solid #e9ecef; 
        padding: 25px; 
        margin-bottom: 20px; 
        cursor: pointer;
        border-radius: 12px;
        transition: all 0.3s ease;
        background-color: white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        width: 100%;
        overflow: hidden;
    }
    .book-item:hover {
        box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        transform: translateY(-3px);
        border-color: #2c5282;
        background-color: #fafbfc;
    }
    .book-image { 
        border: 1px solid #e9ecef; 
        width: 120px; 
        height: 140px; 
        background-color: #f8f9fa;
        border-radius: 8px;
        overflow: hidden;
        float: left;
        margin-right: 25px;
    }
    .book-image img {
        width: 120px; 
        height: 140px; 
        object-fit: cover;
        display: block;
    }
    .book-info { 
        overflow: hidden;
        padding-left: 0;
    }
    .book-title { 
        font-weight: 600; 
        font-size: 18px; 
        margin-bottom: 15px; 
        color: #2c5282;
        padding: 0 0 10px 0;
        border-bottom: 2px solid #e9ecef;
        line-height: 1.4;
    }
    .book-details {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        gap: 6px;
    }
    .book-detail-item { 
        display: flex;
        align-items: center;
        font-size: 14px;
        line-height: 1.5;
    }
    .book-detail-item .label {
        color: #2c5282;
        font-weight: 600;
        min-width: 70px;
        flex-shrink: 0;
    }
    .book-detail-item .value {
        color: #333;
        margin-left: 8px;
        flex: 1;
    }
</style>
</head>
<body>
<div class="container">
    <%@ include file="../common/header.jsp" %>

    <div class="page-content">
        <!-- 제목 -->
        <div class="page-title">
            <c:choose>
                <c:when test="${not empty selectedCategory}">
                    ${selectedCategory} 카테고리 도서 목록
                </c:when>
                <c:otherwise>
                    전체 도서 정보
                </c:otherwise>
            </c:choose>
        </div>

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
                             alt="${book.bookName}">
                    </div>
                    <div class="book-info">
                        <div class="book-title">${book.bookName}</div>
                        <div class="book-details">
                            <div class="book-detail-item">
                                <span class="label">저자:</span>
                                <span class="value">${book.bookAuthor}</span>
                            </div>
                            <div class="book-detail-item">
                                <span class="label">출판사:</span>
                                <span class="value">${book.bookPublisher}</span>
                            </div>
                            <div class="book-detail-item">
                                <span class="label">카테고리:</span>
                                <span class="value">${book.bookCategory}</span>
                            </div>
                            <div class="book-detail-item">
                                <span class="label">도서번호:</span>
                                <span class="value">${book.bookNo}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>
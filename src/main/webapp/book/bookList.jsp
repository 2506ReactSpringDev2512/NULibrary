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
        padding: 20px 0;
        border-bottom: 3px solid #2c5282;
    }
    
    .category-links { 
        text-align: center; 
        margin-bottom: 30px; 
        padding: 20px 0;
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
        margin-bottom: 10px;
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
    
    .book-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
        gap: 25px;
        width: 100%;
    }
    
    .book-item { 
        border: 2px solid #e9ecef; 
        padding: 20px; 
        cursor: pointer;
        border-radius: 12px;
        transition: all 0.3s ease;
        background-color: white;
        box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
        height: 420px;
    }
    
    .book-item:hover {
        box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        transform: translateY(-3px);
        border-color: #2c5282;
        background-color: #fafbfc;
    }
    
    .book-image { 
        border: 1px solid #e9ecef; 
        width: 140px; 
        height: 180px; 
        background-color: #f8f9fa;
        border-radius: 8px;
        overflow: hidden;
        flex-shrink: 0;
    }
    
    .book-image img {
        width: 100%; 
        height: 100%; 
        object-fit: cover;
        display: block;
    }
    
    .book-info { 
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 10px;
        text-align: center;
        flex: 1;
        overflow: hidden;
    }
    
    .book-title { 
        font-weight: 600; 
        font-size: 15px; 
        color: #2c5282;
        padding: 0 0 8px 0;
        border-bottom: 2px solid #e9ecef;
        line-height: 1.3;
        word-wrap: break-word;
        overflow-wrap: break-word;
        height: 40px;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        -webkit-box-orient: vertical;
        margin-bottom: 5px;
    }
    
    .book-details {
        display: flex;
        flex-direction: column;
        gap: 5px;
        font-size: 12px;
        flex: 1;
        justify-content: flex-start;
    }
    
    .book-detail-item { 
        display: flex;
        justify-content: space-between;
        align-items: center;
        line-height: 1.4;
        width: 100%;
    }
    
    .book-detail-item .label {
        color: #2c5282;
        font-weight: 600;
        min-width: 60px;
        flex-shrink: 0;
    }
    
    .book-detail-item .value {
        color: #333;
        flex: 1;
        text-align: right;
        word-wrap: break-word;
        overflow-wrap: break-word;
        line-height: 1.3;
        max-width: 150px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }
    
    /* 반응형 디자인 */
    @media (max-width: 1200px) {
        .book-grid {
            grid-template-columns: repeat(3, 1fr);
        }
    }
    
    @media (max-width: 768px) {
        .page-content {
            padding: 20px 15px;
        }
        
        .book-grid {
            grid-template-columns: repeat(2, 1fr);
            gap: 15px;
        }
        
        .book-item {
            height: 320px;
        }
        
        .book-image {
            height: 160px;
        }
        
        .category-links a {
            display: block;
            margin: 5px auto;
            max-width: 200px;
        }
    }
    
    @media (max-width: 480px) {
        .page-title {
            font-size: 22px;
        }
        
        .result-info {
            font-size: 16px;
            padding: 15px;
        }
        
        .book-list {
            padding: 15px;
        }
        
        .book-grid {
            grid-template-columns: 1fr;
            gap: 15px;
        }
        
        .book-item {
            height: 300px;
        }
        
        .book-image {
            height: 150px;
        }
        
        .book-title {
            font-size: 14px;
        }
        
        .book-detail-item {
            font-size: 12px;
        }
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
            <div class="book-grid">
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
    </div>
    
    <%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>

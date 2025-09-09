<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 검색 결과 - 도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
        }
        
        .header {
            border: 2px solid #333;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
          
            padding: 10px 20px;
            font-weight: bold;
        }
        
        .user-info div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .search-section {
            border: 2px solid #333;
            padding: 20px;
            background-color: #f9f9f9;
        }
        
        .search-box {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 15px;
        }
        
        .search-input {
            border: 2px solid #333;
            padding: 12px;
            width: 400px;
        }
        
        .search-btn {
            border: 2px solid #333;
            padding: 12px 25px;
            background-color: white;
            cursor: pointer;
        }
        
        .main-content {
            padding: 30px;
        }
        
        .result-info {
            border: 1px solid #666;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #f9f9f9;
        }
        
        .book-list {
            border: 2px solid #333;
            padding: 20px;
        }
        
        .book-item {
            border: 1px solid #666;
            padding: 20px;
            margin-bottom: 15px;
            display: flex;
            gap: 20px;
        }
        
        .book-image {
            border: 1px solid #ccc;
            width: 100px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f5f5f5;
        }
        
        .book-info {
            flex: 1;
        }
        
        .book-title {
            font-weight: bold;
            font-size: 18px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            padding: 8px;
        }
        
        .book-details {
            margin-bottom: 10px;
        }
        
        .book-details div {
            margin-bottom: 5px;
            padding: 5px;
            border: 1px solid #eee;
        }
        
        .book-actions {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-top: 10px;
        }
        
        .status {
            border: 1px solid #666;
            padding: 8px 15px;
            font-weight: bold;
        }
        
        .available {
            background-color: #e8f5e8;
            color: #2d5a2d;
        }
        
        .unavailable {
            background-color: #ffe8e8;
            color: #5a2d2d;
        }
        
        .rent-btn {
            border: 2px solid #333;
            padding: 10px 20px;
            background-color: white;
            cursor: pointer;
            font-weight: bold;
        }
        
        .pagination {
            text-align: center;
            margin-top: 30px;
        }
        
        .pagination div {
            display: inline-block;
            border: 1px solid #666;
            padding: 8px 12px;
            margin: 0 2px;
            cursor: pointer;
        }
        
        .footer {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="user-info">
                <div onclick="location.href='${pageContext.request.contextPath}/main'">홈으로</div>
            </div>
        </div>
        
        <div class="search-section">
            <form action="search" method="get">
                <div class="search-box">
                    <input type="text" name="keyword" class="search-input" value="${keyword}" placeholder="도서명, 저자, 출판사를 입력하세요">
                    <button type="submit" class="search-btn">검색</button>
                </div>
                <div class="search-options" style="text-align: center; margin-top: 10px;">
                </div>
            </form>
        </div>
        
        <div class="main-content">
            <div class="result-info">
                <c:choose>
                    <c:when test="${not empty errorMsg}">
                        <strong style="color: red;">${errorMsg}</strong>
                    </c:when>
                    <c:when test="${not empty keyword}">
                        <strong>"${keyword}"</strong> 검색 결과 <strong>${resultCount}건</strong>
                    </c:when>
                    <c:otherwise>
                        검색어를 입력해주세요.
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="book-list">
                <c:choose>
                    <c:when test="${empty searchResults}">
                        <div style="text-align: center; padding: 50px; font-size: 18px; color: #666;">
                            검색 결과가 없습니다.
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="book" items="${searchResults}">
                            <div class="book-item">
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
                                    <div class="book-actions">
                                        <div class="status ${book.lendYn == 'Y' ? 'unavailable' : 'available'}">
                                            ${book.lendYn == 'Y' ? '대여중' : '대여가능'}
                                        </div>
                                        <c:if test="${book.lendYn != 'Y'}">
                                            <button class="rent-btn" onclick="rentBook('${book.bookNo}')">대여하기</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <script>
            function rentBook(bookNo) {
                // 대여 기능은 나중에 구현
                alert('도서번호 ' + bookNo + ' 대여 기능은 준비 중입니다.');
            }
        </script>
    </body>
</html>
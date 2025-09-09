<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 상세 - 도서관</title>
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
            max-width: 800px;
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
        
        .nav-menu div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .main-content {
            padding: 30px;
        }
        
        .book-detail-container {
            border: 2px solid #333;
            padding: 30px;
        }
        
        .book-header {
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 2px solid #ccc;
        }
        
        .book-image {
            --border: 2px solid #666;
            width: 200px;
            height: 250px;
            display: flex;
            align-items: center;
            justify-content: center;
            --background-color: #f5f5f5;
            font-weight: bold;
        }
        
        .book-image img {
        	border: 2px solid #666;
        	width:100%;
        	height: 100%;
        	object-fit:contain;
        
        }
        
        .book-info {
            flex: 1;
        }
        
        .book-title {
            border: 2px solid #333;
            padding: 15px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        
        .info-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .info-table th,
        .info-table td {
            border: 1px solid #666;
            padding: 12px;
            text-align: left;
        }
        
        .info-table th {
            background-color: #f9f9f9;
            font-weight: bold;
            width: 120px;
        }
        
        .status-section {
            margin-top: 20px;
            text-align: center;
        }
        
        .status {
            border: 2px solid #333;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        
        .available {
            background-color: #e8f5e8;
            color: #2d5a2d;
        }
        
        .unavailable {
            background-color: #ffe8e8;
            color: #5a2d2d;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 20px;
        }
        
        .btn {
            padding: 15px 30px;
            border: 2px solid #333;
            background-color: white;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        
        .btn:hover {
            background-color: #f0f0f0;
        }
        
        .btn:disabled {
            background-color: #f5f5f5;
            color: #999;
            cursor: not-allowed;
        }
        
        .description-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid #ccc;
        }
        
        .section-title {
            border: 1px solid #666;
            padding: 10px;
            font-weight: bold;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }
        
        .description {
            border: 1px solid #666;
            padding: 20px;
            line-height: 1.6;
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
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div>뒤로가기</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="book-detail-container">
                <div class="book-header">
                    <div class="book-image">
                        <img src="${pageContext.request.contextPath}/image/book/all/${book.bookNo}.jpg" alt="이미지">
                    </div>
                    <div class="book-info">
                        <div class="book-title">${book.bookName}</div>
                        
                        <table class="info-table">
                            <tr>
                                <th>저자</th>
                                <td>${book.bookAuthor}</td>
                            </tr>
                            <tr>
                                <th>출판사</th>
                                <td>${book.bookPublisher}</td>
                            </tr>
                            <tr>
                                <th>도서 번호</th>
                                <td>${book.bookNo}</td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>${book.bookCategory}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="status-section">
                    <div class="status available">${book.lendYn }</div>
                    
                    <div class="action-buttons">
                        <button class="btn">대여하기</button>
                        <button class="btn">목록으로</button>
                    </div>
                </div>
                
                <div class="description-section">
                    <div class="section-title">도서 소개</div>
                    <div class="description">
                        ${book.bookDescription}
                    </div>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
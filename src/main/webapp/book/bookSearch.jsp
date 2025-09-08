<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <div class="logo" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">
                <img src="<%= request.getContextPath() %>/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="user-info">
                <div>홈으로</div>
            </div>
        </div>
        
        <div class="search-section">
            <div class="search-box">
                <input type="text" class="search-input" value="자바" placeholder="도서명, 저자, 출판사를 입력하세요">
                <button class="search-btn">검색</button>
            </div>
        </div>
        
        <div class="main-content">
            <div class="result-info">
                <strong>"자바"</strong> 검색 결과 <strong>15건</strong>
            </div>
            
            <div class="book-list">
                <div class="book-item">
                    <div class="book-image">도서 이미지</div>
                    <div class="book-info">
                        <div class="book-title">자바 프로그래밍 완벽 가이드</div>
                        <div class="book-details">
                            <div><strong>저자:</strong> 김자바</div>
                            <div><strong>출판사:</strong> 자바 출판사</div>
                            <div><strong>출간일:</strong> 2024-01-15</div>
                            <div><strong>ISBN:</strong> 978-1234567890</div>
                        </div>
                        <div class="book-actions">
                            <div class="status available">대여가능</div>
                            <button class="rent-btn">대여하기</button>
                        </div>
                    </div>
                </div>
                
                <div class="book-item">
                    <div class="book-image">도서 이미지</div>
                    <div class="book-info">
                        <div class="book-title">실전 자바 웹 개발</div>
                        <div class="book-details">
                            <div><strong>저자:</strong> 박웹개발</div>
                            <div><strong>출판사:</strong> 웹 출판사</div>
                            <div><strong>출간일:</strong> 2024-03-20</div>
                            <div><strong>ISBN:</strong> 978-
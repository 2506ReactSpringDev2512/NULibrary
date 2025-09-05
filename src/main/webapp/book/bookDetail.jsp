<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            border: 1px solid #666;
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
            border: 2px solid #666;
            width: 200px;
            height: 250px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f5f5f5;
            font-weight: bold;
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
            <div class="logo">도서관 로고</div>
            <div class="nav-menu">
                <div>뒤로가기</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="book-detail-container">
                <div class="book-header">
                    <div class="book-image">
                        도서 이미지
                    </div>
                    
                    <div class="book-info">
                        <div class="book-title">자바 프로그래밍 완벽 가이드</div>
                        
                        <table class="info-table">
                            <tr>
                                <th>저자</th>
                                <td>김자바</td>
                            </tr>
                            <tr>
                                <th>출판사</th>
                                <td>자바 출판사</td>
                            </tr>
                            <tr>
                                <th>출간일</th>
                                <td>2024-01-15</td>
                            </tr>
                            <tr>
                                <th>ISBN</th>
                                <td>978-1234567890</td>
                            </tr>
                            <tr>
                                <th>페이지</th>
                                <td>520페이지</td>
                            </tr>
                            <tr>
                                <th>카테고리</th>
                                <td>컴퓨터/IT</td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="status-section">
                    <div class="status available">대여 가능</div>
                    
                    <div class="action-buttons">
                        <button class="btn">대여하기</button>
                        <button class="btn">목록으로</button>
                    </div>
                </div>
                
                <div class="description-section">
                    <div class="section-title">도서 소개</div>
                    <div class="description">
                        자바 프로그래밍의 기초부터 고급 기법까지 체계적으로 학습할 수 있는 완벽 가이드입니다. 
                        실무에서 바로 활용할 수 있는 예제와 함께 객체지향 프로그래밍의 핵심 개념을 
                        쉽게 이해할 수 있도록 구성되었습니다. 초보자부터 중급 개발자까지 
                        모두에게 도움이 되는 필수 도서입니다.
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
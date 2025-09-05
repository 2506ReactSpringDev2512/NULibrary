<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 대여 현황 - 도서관</title>
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
            border: 1px solid #666;
            padding: 10px 20px;
            font-weight: bold;
        }
        
        .user-info {
            display: flex;
            gap: 10px;
        }
        
        .user-info div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .main-content {
            padding: 30px;
        }
        
        .page-title {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        
        .section {
            border: 2px solid #333;
            margin-bottom: 30px;
            padding: 20px;
        }
        
        .section-title {
            border: 1px solid #666;
            padding: 10px;
            font-weight: bold;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }
        
        .table-container {
            border: 1px solid #666;
            padding: 10px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            border: 1px solid #666;
            padding: 12px;
            text-align: center;
        }
        
        th {
            background-color: #f9f9f9;
            font-weight: bold;
        }
        
        .return-btn {
            border: 1px solid #333;
            padding: 5px 10px;
            background-color: white;
            cursor: pointer;
            font-size: 12px;
        }
        
        .no-data {
            text-align: center;
            padding: 30px;
            color: #666;
            border: 1px solid #ccc;
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
            <div class="user-info">
                <div>홍길동님</div>
                <div>로그아웃</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">내 대여 현황</div>
            
            <!-- 현재 대여중인 도서 -->
            <div class="section">
                <div class="section-title">현재 대여중인 도서</div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>도서명</th>
                                <th>저자</th>
                                <th>대여일</th>
                                <th>반납예정일</th>
                                <th>상태</th>
                                <th>반납</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>자바 프로그래밍</td>
                                <td>김자바</td>
                                <td>2024-09-01</td>
                                <td>2024-09-15</td>
                                <td>대여중</td>
                                <td><button class="return-btn">반납</button></td>
                            </tr>
                            <tr>
                                <td>데이터베이스 설계</td>
                                <td>이디비</td>
                                <td>2024-09-02</td>
                                <td>2024-09-16</td>
                                <td>대여중</td>
                                <td><button class="return-btn">반납</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- 대여 이력 -->
            <div class="section">
                <div class="section-title">대여 이력</div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>도서명</th>
                                <th>저자</th>
                                <th>대여일</th>
                                <th>반납일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>웹 프로그래밍</td>
                                <td>박웹</td>
                                <td>2024-08-15</td>
                                <td>2024-08-29</td>
                                <td>반납완료</td>
                            </tr>
                            <tr>
                                <td>알고리즘 기초</td>
                                <td>최알고</td>
                                <td>2024-08-01</td>
                                <td>2024-08-14</td>
                                <td>반납완료</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
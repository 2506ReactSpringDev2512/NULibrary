<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대여 관리 - 관리자</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; background-color: #333; color: white; text-align: center; font-weight: bold; }
        .main-content { display: flex; gap: 20px; padding: 20px; }
        .sidebar { width: 200px; border: 2px solid #333; padding: 20px; }
        .menu-item { border: 1px solid #666; padding: 10px; margin-bottom: 8px; cursor: pointer; }
        .content { flex: 1; }
        .search-box { border: 2px solid #333; padding: 20px; margin-bottom: 20px; }
        .search-input { padding: 10px; border: 1px solid #666; width: 300px; margin-right: 10px; }
        .search-btn { padding: 10px 20px; border: 2px solid #333; background: white; cursor: pointer; }
        .rental-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 10px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .action-btn { padding: 5px 10px; border: 1px solid #333; background: white; cursor: pointer; }
        .overdue { background-color: #ffe6e6; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">대여 관리</div>
        
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item">대시보드</div>
                <div class="menu-item">회원 관리</div>
                <div class="menu-item">도서 관리</div>
                <div class="menu-item" style="background:#f0f0f0;">대여 관리</div>
            </div>
            
            <div class="content">
                <div class="search-box">
                    <input type="text" class="search-input" placeholder="회원명 또는 도서명 검색">
                    <button class="search-btn">검색</button>
                </div>
                
                <table class="rental-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>회원명</th>
                            <th>도서명</th>
                            <th>대여일</th>
                            <th>반납예정일</th>
                            <th>상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>자바 프로그래밍</td>
                            <td>2024-09-01</td>
                            <td>2024-09-15</td>
                            <td>대여중</td>
                            <td><button class="action-btn">반납처리</button></td>
                        </tr>
                        <tr class="overdue">
                            <td>2</td>
                            <td>김철수</td>
                            <td>웹 개발</td>
                            <td>2024-08-20</td>
                            <td>2024-09-01</td>
                            <td>연체</td>
                            <td><button class="action-btn">반납처리</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 관리 - 관리자</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; background-color: #333; color: white; text-align: center; font-weight: bold; }
        .main-content { display: flex; gap: 20px; padding: 20px; }
        .sidebar { width: 200px; border: 2px solid #333; padding: 20px; }
        .menu-item { border: 1px solid #666; padding: 10px; margin-bottom: 8px; cursor: pointer; }
        .content { flex: 1; }
        .top-actions { border: 2px solid #333; padding: 20px; margin-bottom: 20px; display: flex; justify-content: space-between; }
        .search-input { padding: 10px; border: 1px solid #666; width: 300px; margin-right: 10px; }
        .btn { padding: 10px 20px; border: 2px solid #333; background: white; cursor: pointer; }
        .book-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 10px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .action-btn { padding: 5px 10px; border: 1px solid #333; background: white; cursor: pointer; margin: 0 2px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">도서 관리</div>
        
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item">대시보드</div>
                <div class="menu-item">회원 관리</div>
                <div class="menu-item" style="background:#f0f0f0;">도서 관리</div>
                <div class="menu-item">대여 관리</div>
            </div>
            
            <div class="content">
                <div class="top-actions">
                    <div>
                        <input type="text" class="search-input" placeholder="도서명 또는 저자 검색">
                        <button class="btn">검색</button>
                    </div>
                    <button class="btn">도서 추가</button>
                </div>
                
                <table class="book-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>도서명</th>
                            <th>저자</th>
                            <th>출판사</th>
                            <th>상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>자바 프로그래밍</td>
                            <td>김자바</td>
                            <td>자바출판사</td>
                            <td>대여가능</td>
                            <td>
                                <button class="action-btn">수정</button>
                                <button class="action-btn">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>웹 개발</td>
                            <td>박웹</td>
                            <td>웹출판사</td>
                            <td>대여중</td>
                            <td>
                                <button class="action-btn">수정</button>
                                <button class="action-btn">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
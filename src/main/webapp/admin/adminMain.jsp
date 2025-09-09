<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 - 도서관</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; display: flex; justify-content: space-between; align-items: center; background-color: #333; color: white; }
        .logo { font-weight: bold; }
        .admin-info div { border: 1px solid #666; padding: 8px 15px; cursor: pointer; }
        .main-content { display: flex; gap: 20px; padding: 20px; }
        .sidebar { width: 200px; border: 2px solid #333; padding: 20px; }
        .menu-item { border: 1px solid #666; padding: 10px; margin-bottom: 8px; cursor: pointer; }
        .content { flex: 1; }
        .stats-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; }
        .stat-box { border: 2px solid #333; padding: 30px; text-align: center; }
        .stat-number { font-size: 36px; font-weight: bold; margin-bottom: 10px; border: 1px solid #666; padding: 10px; }
        .stat-label { font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">관리자 시스템</div>
            <div class="admin-info">
                <div>관리자님</div>
                <div>로그아웃</div>
            </div>
        </div>
        
        <!-- 회원정보 출력 부분 클릭 시 동작 버튼 작성 -->
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item">대시보드</div>
                <div class="menu-item" onclick="location.href='<%= request.getContextPath() %>/admin/memberManage'">회원 정보 출력</div>
                <div class="menu-item" onclick="location.href='<%= request.getContextPath() %>/admin/notice'">공지사항 관리</div>
                <div class="menu-item" onclick="location.href='<%= request.getContextPath() %>/book/bookList'">도서 관리</div>
                <div class="menu-item">대여 관리</div>
            </div>
            
            <div class="content">
                <div class="stats-grid">
                    <div class="stat-box">
                        <div class="stat-number">1,456</div>
                        <div class="stat-label">총 회원수</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">12,543</div>
                        <div class="stat-label">총 도서수</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">2,722</div>
                        <div class="stat-label">대여중인 도서</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">15</div>
                        <div class="stat-label">연체 도서</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
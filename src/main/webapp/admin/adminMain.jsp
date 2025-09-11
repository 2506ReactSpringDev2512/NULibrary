<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인 - 도서관</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #fff; color: #111; }
        .container { max-width: 1200px; margin: 0 auto; background-color: #fff; box-shadow: 0 0 8px rgba(0,0,0,0.05); }

        /* 헤더 */
        .header { 
            background-color: #2c5282;
            padding: 20px 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .logo { 
            color: white;
            font-size: 28px;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .logo img { height: 60px; width: 100px; border: none; outline: none; }
        .logo-text { display: flex; flex-direction: column; }
        .logo-title { font-size: 18px; font-weight: bold; color: #fff; }
        .logo-subtitle { font-size: 14px; color: #ccc; }

        /* admin info 오른쪽 */
        .admin-info { 
            display: flex; 
            gap: 10px; 
        }
        .admin-info div { 
            border: 1px solid #000; 
            padding: 6px 12px; 
            cursor: pointer; 
            border-radius: 6px;
            background-color: #fff;
            color: #000;
            transition: 0.3s;
        }
        .admin-info div:hover { 
            background-color: #000; 
            color: #fff; 
        }

        /* 메인 레이아웃 */
        .main-content { display: flex; gap: 20px; padding: 20px; }

        /* 사이드바 */
        .sidebar { 
            width: 200px; 
            background-color: #f8f9fa; 
            padding: 20px; 
            border: 1px solid #e9ecef;
            border-radius: 8px;
        }
        .menu-item { 
            padding: 12px 20px;
            cursor: pointer;
            color: #333;
            font-weight: 500;
            border-bottom: 1px solid #f0f0f0;
            transition: all 0.3s ease;
            text-align: center;
            border-radius: 6px;
        }
        .menu-item:hover { 
            background-color: #2c5282; 
            color: #fff; 
        }

        /* 콘텐츠 */
        .content { flex: 1; }
        .stats-grid { 
            display: grid; 
            grid-template-columns: repeat(2, 1fr); 
            gap: 20px; 
        }
        .stat-box { 
            background-color: #fff; 
            padding: 30px 20px; 
            text-align: center; 
            border-radius: 12px; 
            border: 1px solid #ddd; 
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .stat-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        .stat-number { 
            font-size: 36px; 
            font-weight: 700; 
            margin-bottom: 12px; 
            color: #2c5282; 
        }
        .stat-label { 
            font-size: 18px; 
            font-weight: 600; 
            color: #111; 
        }

        /* 반응형 */
        @media (max-width: 768px) {
            .main-content { flex-direction: column; }
            .sidebar { width: 100%; margin-bottom: 20px; }
            .stats-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <!-- 로고 -->
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고">
                <div class="logo-text">
                    <div class="logo-title">NU 대학교 중앙도서관</div>
                    <div class="logo-subtitle">관리자 시스템</div>
                </div>
            </div>
            <!-- 관리자 정보 (오른쪽) -->
            <div class="admin-info">
                <div>${loginAdmin}님</div>
                <div onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item">대시보드</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage'">회원 정보 조회</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/notice'">공지사항 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/bookManage'">도서 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/rentalManage'">대여 관리</div>
            </div>
            
            <div class="content">
                <div class="stats-grid">
                    <div class="stat-box">
                        <div class="stat-number">${totalMemberCount}명</div>
                        <div class="stat-label">총 회원수</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">${totalBookCount}권</div>
                        <div class="stat-label">총 도서수</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">${rentedBookCount}권</div>
                        <div class="stat-label">대여중인 도서</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">${availableBookCount}권</div>
                        <div class="stat-label">대여 가능</div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- footer -->
        <%@ include file="../common/footer.jsp" %>    
    </div>
</body>
</html>

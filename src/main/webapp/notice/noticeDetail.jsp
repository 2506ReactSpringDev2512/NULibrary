<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 - 도서관</title>
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
            cursor: pointer;
        }
        
        .nav-menu div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .main-content {
            padding: 30px;
        }
        
        .notice-container {
            border: 2px solid #333;
            padding: 30px;
        }
        
        .notice-header {
            border-bottom: 2px solid #ccc;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        
        .notice-title {
            border: 2px solid #333;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        
        .notice-info {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
        }
        
        .notice-content {
            border: 1px solid #666;
            padding: 30px;
            line-height: 1.8;
            min-height: 300px;
        }
        
        .button-section {
            text-align: center;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            border: 2px solid #333;
            background-color: white;
            cursor: pointer;
            font-weight: bold;
            margin: 0 10px;
        }
        
        .btn:hover {
            background-color: #f0f0f0;
        }
        
        .footer {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
        }
        
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border: 1px solid #f5c6cb;
            margin: 20px 0;
            text-align: center;
        }
        
        .no-notice {
            text-align: center;
            padding: 50px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">
                <img src="<%= request.getContextPath() %>/image/logo.png" alt="도서관 로고" style="height: 60px; witdh:200px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div onclick="location.href='<%= request.getContextPath() %>/index.jsp'">홈으로</div>
            </div>
        </div>
        
        <div class="main-content">
            <!-- 에러 메시지 표시 -->
            <c:if test="${not empty errorMsg}">
                <div class="error-message">
                    ${errorMsg}
                </div>
            </c:if>
            
            <!-- 공지사항 내용 -->
            <c:choose>
                <c:when test="${not empty notice}">
                    <div class="notice-container">
                        <div class="notice-header">
                            <div class="notice-title">${notice.noticeSubject}</div>
                            <div class="notice-info">
                                <span>작성일: ${notice.formattedDate}</span>
                                <span>조회수: ${notice.viewCount}</span>
                            </div>
                        </div>
                        
                        <div class="notice-content">
                            ${notice.formattedContent}
                        </div>
                        
                        <div class="button-section">
                            <button class="btn" onclick="location.href='<%= request.getContextPath() %>/notice/list'">목록으로</button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="no-notice">
                        <p>공지사항을 찾을 수 없습니다.</p>
                        <br>
                        <button class="btn" onclick="location.href='<%= request.getContextPath() %>/notice/list'">목록으로</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서관 로그인</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            line-height: 1.4;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
        }
        
        /* 헤더 영역 */
        .header {
            border: 2px solid #333;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
        }
        
        .logo {
            
            padding: 10px 20px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .nav-menu {
            display: flex;
            gap: 10px;
        }
        
        .nav-menu div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        /* 로그인 메인 영역 */
        .login-main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 500px;
            padding: 50px 20px;
        }
        
        .login-container {
            border: 2px solid #333;
            padding: 40px;
            width: 400px;
            text-align: center;
            background-color: white;
        }
        
        .login-title {
            border: 1px solid #666;
            padding: 15px;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
        }
        
        .login-form {
            margin-bottom: 20px;
        }
        
        .input-group {
            margin-bottom: 15px;
        }
        
        .input-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #666;
            font-size: 16px;
        }
        
        .login-btn {
            width: 100%;
            padding: 15px;
            border: 2px solid #333;
            background-color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-bottom: 20px;
        }
        
        .login-btn:hover {
            background-color: #f0f0f0;
        }
        
        .login-links {
            display: flex;
            justify-content: space-between;
            padding: 0 10px;
        }
        
        .login-links a {
            text-decoration: none;
            color: #666;
            font-size: 14px;
            border: 1px solid #ccc;
            padding: 8px 12px;
        }
        
        .login-links a:hover {
            background-color: #f0f0f0;
        }
        
        /* 메시지 스타일 */
        .error-message {
            color: red;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid red;
            background-color: #ffe6e6;
        }
        
        /* 푸터 */
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
        <!-- 헤더 -->
        <div class="header">
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div onclick="location.href='${pageContext.request.contextPath}/main'">홈으로</div>
                <div onclick="location.href='${pageContext.request.contextPath}/admin/adminLogin.jsp'">관리자 로그인</div>
            </div>
        </div>
        
        <!-- 로그인 메인 영역 -->
        <div class="login-main">
            <div class="login-container">
                <div class="login-title">회원 로그인</div>
                
                <!-- 에러 메시지 표시 -->
                <c:if test="${not empty errorMsg}">
                    <div class="error-message">
                        ${errorMsg}
                    </div>
                </c:if>
                
                <form class="login-form" action="${pageContext.request.contextPath}/member/login" method="post">
                    <div class="input-group">
                        <input type="text" name="userId" placeholder="아이디를 입력하세요" 
                               value="${not empty userId ? userId : ''}" required>
                    </div>
                    <div class="input-group">
                        <input type="password" name="password" placeholder="비밀번호를 입력하세요" required>
                    </div>
                    <button type="submit" class="login-btn">로그인</button>
                </form>
                
                <div class="login-links">
                    <a href="${pageContext.request.contextPath}/member/join">회원가입</a>
                    <a href="${pageContext.request.contextPath}/member/findPassword">비밀번호 찾기</a>
                </div>
            </div>
        </div>
        
        <!-- 푸터 -->
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
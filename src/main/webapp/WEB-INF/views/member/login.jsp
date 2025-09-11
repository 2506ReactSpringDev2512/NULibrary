<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - NU 대학교 중앙도서관</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
            background-color: #ffffff; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .container { 
            width: 100%; 
            margin: 0; 
            background-color: #ffffff; 
            min-height: 100vh; 
        }
        
        .login-main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 400px);
            padding: 60px 20px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }
        
        .login-container {
            background-color: white;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 450px;
            text-align: center;
            border: none;
        }
        
        .login-title {
            font-size: 32px;
            font-weight: 700;
            color: #2c5282;
            margin-bottom: 40px;
            padding: 0;
            border: none;
            position: relative;
        }
        
        .login-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, #2c5282, #3182ce);
            border-radius: 2px;
        }
        
        .login-form {
            margin-bottom: 30px;
        }
        
        .input-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .input-group input {
            width: 100%;
            padding: 18px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
            outline: none;
        }
        
        .input-group input:focus {
            border-color: #2c5282;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(44, 82, 130, 0.1);
            transform: translateY(-1px);
        }
        
        .input-group input::placeholder {
            color: #a0aec0;
            font-weight: 400;
        }
        
        .login-btn {
            width: 100%;
            padding: 18px 20px;
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(44, 82, 130, 0.3);
        }
        
        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 82, 130, 0.4);
            background: linear-gradient(135deg, #1a365d 0%, #2c5282 100%);
        }
        
        .login-links {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        
        .login-links a {
            text-decoration: none;
            color: #2c5282;
            font-size: 15px;
            font-weight: 500;
            padding: 12px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
            background-color: #f8f9fa;
        }
        
        .login-links a:hover {
            background-color: #2c5282;
            color: white;
            border-color: #2c5282;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(44, 82, 130, 0.2);
        }
        
        .error-message {
            color: #e53e3e;
            background-color: #fed7d7;
            border: 2px solid #feb2b2;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .error-message::before {
            content: '\f071';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 18px;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .login-main {
                padding: 30px 15px;
                min-height: calc(100vh - 300px);
            }
            
            .login-container {
                padding: 30px 25px;
                border-radius: 15px;
            }
            
            .login-title {
                font-size: 28px;
                margin-bottom: 30px;
            }
            
            .login-links {
                flex-direction: column;
                gap: 15px;
            }
        }
        
        @media (max-width: 480px) {
            .login-container {
                padding: 25px 20px;
                margin: 0 10px;
            }
            
            .login-title {
                font-size: 24px;
            }
            
            .input-group input {
                padding: 15px 18px;
                font-size: 15px;
            }
            
            .login-btn {
                padding: 15px 18px;
                font-size: 16px;
            }
            
            .login-links a {
                font-size: 14px;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
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
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
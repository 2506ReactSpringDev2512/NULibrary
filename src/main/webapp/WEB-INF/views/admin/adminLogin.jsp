<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인 - NU 도서관</title>
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
            position: relative;
        }
        
        .login-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, #2c5282, #3182ce);
            border-radius: 2px;
        }
        
        .warning-text {
            color: #e53e3e;
            background-color: #fed7d7;
            border: 2px solid #feb2b2;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-weight: 500;
        }
        
        .login-form {
            margin-bottom: 30px;
        }
        
        .input-group {
            margin-bottom: 25px;
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
            border-color: #c53030;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(44, 82, 130, 0.1);
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
        
        .back-link {
            text-decoration: none;
            color: #2c5282;
            font-size: 15px;
            font-weight: 500;
            padding: 12px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            transition: all 0.3s ease;
            display: inline-block;
            background-color: #f8f9fa;
        }
        
        .back-link:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 82, 130, 0.4);
            background: linear-gradient(135deg, #1a365d 0%, #2c5282 100%);
          color : white;
        }
        
        .error-message {
            color: #e53e3e;
            background-color: #fed7d7;
            border: 2px solid #feb2b2;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-weight: 500;
        }
        
        /* 반응형 */
        @media (max-width: 768px) {
            .login-main {
                padding: 30px 15px;
            }
            
            .login-container {
                padding: 30px 25px;
                border-radius: 15px;
            }
            
            .login-title {
                font-size: 28px;
                margin-bottom: 30px;
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
            
            .back-link {
                font-size: 14px;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
    <!-- header -->
    	<%@ include file="../common/header.jsp" %>
        
        <!-- 관리자 로그인 메인 -->
        <div class="login-main">
            <div class="login-container">
                <div class="login-title">관리자 로그인</div>
                
                <div class="warning-text">
                    ⚠️ 관리자 전용 페이지입니다
                </div>
                
                <!-- 에러 메시지 표시 -->
                <c:if test="${not empty errorMsg}">
                    <div class="error-message">
                        ${errorMsg}
                    </div>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>
                
                <form class="login-form" action="${pageContext.request.contextPath}/admin/login" method="post">
                    <div class="input-group">
                        <input type="text" name="adminId" placeholder="관리자 아이디" required>
                    </div>
                    <div class="input-group">
                        <input type="password" name="adminPassword" placeholder="관리자 비밀번호" required>
                    </div>
                    <button type="submit" class="login-btn">관리자 로그인</button>
                </form>
                
                <a href="${pageContext.request.contextPath}/main" class="back-link">메인 페이지로 돌아가기</a>
            </div>
        </div>
    </div>
    <!-- footer -->
    <%@ include file="../common/footer.jsp" %>
</body>
</html>
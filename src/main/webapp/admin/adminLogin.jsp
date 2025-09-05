<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인 - 도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        
        .container {
            max-width: 500px;
            margin: 0 auto;
            background-color: white;
            margin-top: 100px;
        }
        
        .admin-login-container {
            border: 3px solid #333;
            padding: 50px;
            text-align: center;
            background-color: #f9f9f9;
        }
        
        .login-title {
            border: 2px solid #333;
            padding: 20px;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
            background-color: #333;
            color: white;
        }
        
        .warning-text {
            border: 1px solid #ff6666;
            padding: 10px;
            background-color: #ffe6e6;
            color: #cc0000;
            margin-bottom: 25px;
            font-weight: bold;
        }
        
        .login-form {
            margin-bottom: 20px;
        }
        
        .input-group {
            margin-bottom: 20px;
        }
        
        .input-group input {
            width: 100%;
            padding: 15px;
            border: 2px solid #333;
            font-size: 16px;
            background-color: white;
        }
        
        .login-btn {
            width: 100%;
            padding: 18px;
            border: 2px solid #333;
            background-color: #333;
            color: white;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            margin-bottom: 20px;
        }
        
        .login-btn:hover {
            background-color: #555;
        }
        
        .back-link {
            text-decoration: none;
            color: #666;
            font-size: 14px;
            border: 1px solid #ccc;
            padding: 10px 20px;
            display: inline-block;
        }
        
        .back-link:hover {
            background-color: #f0f0f0;
        }
        
        .footer {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            background-color: #333;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="admin-login-container">
            <div class="login-title">관리자 로그인</div>
            
            <div class="warning-text">
                ⚠️ 관리자 전용 페이지입니다
            </div>
            
            <form class="login-form">
                <div class="input-group">
                    <input type="text" placeholder="관리자 아이디" required>
                </div>
                <div class="input-group">
                    <input type="password" placeholder="관리자 비밀번호" required>
                </div>
                <button type="submit" class="login-btn">관리자 로그인</button>
            </form>
            
            <a href="#" class="back-link">회원 로그인 페이지로 돌아가기</a>
        </div>
    </div>
    
    <div class="footer">
        <div>도서관 관리자 시스템</div>
    </div>
</body>
</html>
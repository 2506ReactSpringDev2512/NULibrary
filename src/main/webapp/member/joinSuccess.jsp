<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 성공</title>
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
        /* 메세지 출력 영역 */
        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 500px;
            padding: 50px 20px;
        }
        
        .message-container {
            border: 2px solid #333;
            padding: 40px;
            width: 400px;
            text-align: center;
            background-color: white;
        }
        
        .message-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        
        .message-text {
            font-size: 18px;
            margin-bottom: 30px;
        }
        
        .btn {
            padding: 15px 30px;
            border: 2px solid #333;
            background-color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .btn:hover {
            background-color: #f0f0f0;
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
            <div class="logo" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">
                <img src="<%= request.getContextPath() %>/image/logo.png" alt="도서관 로고" style="height: 60px; width:200px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div>홈으로</div>
                <div>관리자 로그인</div>
            </div>
        </div>
        
        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="message-container">
                <div class="message-title">회원가입 성공!</div>
                <div class="message-text">
                    회원가입이 완료되었습니다.
                </div>
                <!-- 페이지 상단에 홈버튼이 있어 로그인 페이지로 이동하도록 버튼 수정 -->
                <button class="btn" onclick="location.href='/member/login'">로그인 페이지로 이동하기</button>
            </div>
        </div>
        
        <!-- 푸터 -->
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
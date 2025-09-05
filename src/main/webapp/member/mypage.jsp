<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정 - 도서관</title>
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
            border: 1px solid #666;
            padding: 10px 20px;
            font-weight: bold;
        }
        
        .user-info {
            display: flex;
            gap: 10px;
        }
        
        .user-info div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .main-content {
            padding: 30px;
        }
        
        .page-title {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        
        .form-container {
            border: 2px solid #333;
            padding: 30px;
        }
        
        .form-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        
        .form-group label {
            width: 120px;
            font-weight: bold;
            border: 1px solid #ccc;
            padding: 12px;
            background-color: #f9f9f9;
            margin-right: 15px;
        }
        
        .form-group input {
            flex: 1;
            padding: 12px;
            border: 2px solid #666;
            font-size: 14px;
        }
        
        .readonly {
            background-color: #f5f5f5;
            color: #666;
        }
        
        .button-group {
            text-align: center;
            margin-top: 30px;
            display: flex;
            gap: 20px;
            justify-content: center;
        }
        
        .btn {
            padding: 15px 30px;
            border: 2px solid #333;
            background-color: white;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }
        
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
        <div class="header">
            <div class="logo">도서관 로고</div>
            <div class="user-info">
                <div>남윤우님</div>
                <div>로그아웃</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">개인정보 수정</div>
            
            <div class="form-container">
                <form>
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" value="nam123" class="readonly" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label>현재 비밀번호</label>
                        <input type="password" placeholder="현재 비밀번호를 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label>새 비밀번호</label>
                        <input type="password" placeholder="새 비밀번호를 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label>비밀번호 확인</label>
                        <input type="password" placeholder="새 비밀번호를 다시 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" value="남윤우">
                    </div>
                    
                    <div class="form-group">
                        <label>이메일</label>
                        <input type="email" value="dbsdn@email.com">
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" value="010-1234-5678">
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn">수정 완료</button>
                        <button type="button" class="btn">취소</button>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
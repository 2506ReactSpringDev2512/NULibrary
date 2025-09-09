<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 도서관</title>
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
        }
        
        .nav-menu div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .main-content {
            padding: 40px;
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
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            border: 1px solid #ccc;
            padding: 5px 10px;
            background-color: #f9f9f9;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #666;
            font-size: 14px;
        }

        /* 성별 라디오 전용 스타일 */
        .form-group.gender .radio-group {
            display: flex;
            gap: 20px;
            margin-top: 8px;
        }
       
        .form-group.gender .radio-group label {
            display: flex;
            align-items: left;
            text-align: left;
            gap : 0px;
            border: none;
            font-weight: normal;
            width : 50%;
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
            <div class="logo" onclick="location.href='<%= request.getContextPath() %>/main'">
                <img src="<%= request.getContextPath() %>/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div onclick="location.href='<%= request.getContextPath() %>/main'">홈으로</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">회원가입</div>
            
            <div class="form-container">
               <form action="/member/join" method="post">
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" name="memberId" placeholder="아이디를 입력하세요">
                    </div>
                    
                    <div class="form-group">
					    <label>비밀번호</label>
					    <input type="password" name="memberPw" placeholder="비밀번호를 입력하세요">
					</div>
				
					<div class="form-group">
				   		<label>비밀번호 확인</label>
				   		<input type="password" name="memberPwConfirm" placeholder="비밀번호를 다시 입력하세요">
					</div>
                    
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" name="memberName" placeholder="이름을 입력하세요">
                    </div>
                    
                    <div class="form-group gender">
                        <label>성별</label>
                        <div class="radio-group">
                            <label>
                                <input type="radio" name="memberGender" value="M" checked> 남
                            </label>
                            <label>
                                <input type="radio" name="memberGender" value="F"> 여
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" name="memberPhone" placeholder="전화번호를 입력하세요 ( - 제외 )">
                    </div>
                    
                    <div class="form-group">
    					<label>나이</label>
   				 		<input type="number" name="memberAge" placeholder="나이를 입력하세요">
					</div>
                    
                    
                    <div class="button-group">
                        <button type="submit" class="btn">회원가입</button>
                        <button type="button" class="btn" onclick="location.href='<%= request.getContextPath() %>/'">취소</button>
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
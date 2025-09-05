<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 - 도서관</title>
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
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
        }
        
        .header {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
        }
        
        .logo {
            border: 1px solid #666;
            padding: 10px 20px;
            font-weight: bold;
            display: inline-block;
            cursor: pointer;
        }
        
        .main-content {
            padding: 50px 30px;
            text-align: center;
        }
        
        .page-title {
            border: 2px solid #333;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        
        .form-container {
            border: 2px solid #333;
            padding: 30px;
            text-align: left;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            border: 1px solid #ccc;
            padding: 8px;
            background-color: #f9f9f9;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 2px solid #666;
            font-size: 14px;
        }
        
        .btn-group {
            text-align: center;
            margin-top: 30px;
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        
        .btn {
            padding: 12px 25px;
            border: 2px solid #333;
            background-color: white;
            cursor: pointer;
            font-weight: bold;
        }
        
        .btn:hover {
            background-color: #f0f0f0;
        }
        
        /* 메시지 스타일 */
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border: 2px solid;
            text-align: center;
            font-weight: bold;
        }
        
        .success-message {
            background-color: #d4edda;
            color: #155724;
            border-color: #c3e6cb;
        }
        
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
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
            <div class="logo" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">도서관 로고</div>
        </div>
        
        <div class="main-content">
            <div class="page-title">비밀번호 찾기</div>
            
            <div class="form-container">
                <!-- 메시지 표시 영역 -->
                <%
                    String successMsg = (String)request.getAttribute("successMsg");
                    String errorMsg = (String)request.getAttribute("errorMsg");
                    String foundPassword = (String)request.getAttribute("foundPassword");
                    
                    if(successMsg != null && foundPassword != null) {
                %>
                <div class="message success-message">
                    <%= successMsg %><br>
                    비밀번호: <%= foundPassword %>
                </div>
                <%
                    } else if(errorMsg != null) {
                %>
                <div class="message error-message">
                    <%= errorMsg %>
                </div>
                <%
                    }
                %>
                
                <form action="<%= request.getContextPath() %>/member/findPassword" method="post">
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" name="memberId" placeholder="가입시 입력한 아이디를 입력하세요" 
                               value="<%= request.getAttribute("memberId") != null ? request.getAttribute("memberId") : "" %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" name="memberPhone" placeholder="가입시 입력한 전화번호를 입력하세요 (예: 01012345678)" 
                               value="<%= request.getAttribute("memberPhone") != null ? request.getAttribute("memberPhone") : "" %>" required>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn">비밀번호 찾기</button>
                        <button type="button" class="btn" onclick="location.href='<%= request.getContextPath() %>/member/login'">로그인으로 돌아가기</button>
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
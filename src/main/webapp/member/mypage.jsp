<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.model.vo.MemberVO" %>
<%
    // 로그인 정보 확인
    String loginUser = (String)session.getAttribute("loginUser");
    MemberVO loginMember = (MemberVO)session.getAttribute("loginUserVO");
    
    if(loginUser == null || loginMember == null) {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
        return;
    }
%>
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
                <div><%=loginUser%>님</div>
                <div>로그아웃</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">개인정보 수정</div>
            
            <!-- 에러 메시지 표시 -->
            <%
                String errorMsg = (String)session.getAttribute("errorMsg");
                if(errorMsg != null) {
                    session.removeAttribute("errorMsg");
            %>
            <div id="errorMessage" style="background-color: #f8d7da; color: #721c24; padding: 15px; border: 1px solid #f5c6cb; margin: 20px 0; text-align: center;">
                <%= errorMsg %>
            </div>
            <script>
                setTimeout(function() {
                    var msg = document.getElementById('errorMessage');
                    if(msg) {
                        msg.style.display = 'none';
                    }
                }, 2000);
            </script>
            <%
                }
            %>
            
            <div class="form-container">
                <form action="<%= request.getContextPath() %>/member/update" method="post">
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" value="<%=loginMember.getMemberId()%>" class="readonly" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label>현재 비밀번호</label>
                        <input type="password" name="currentPassword" placeholder="현재 비밀번호를 입력하세요" required>
                    </div>
                    
                    <div class="form-group">
                        <label>새 비밀번호</label>
                        <input type="password" name="newPassword" placeholder="새 비밀번호를 입력하세요 (변경하지 않으려면 비워두세요)">
                    </div>
                    
                    <div class="form-group">
                        <label>비밀번호 확인</label>
                        <input type="password" name="confirmPassword" placeholder="새 비밀번호를 다시 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" name="memberName" value="<%=loginMember.getMemberName()%>">
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" name="memberPhone" value="<%=loginMember.getMemberPhone()%>">
                    </div>
                    
                    <div class="form-group">
                        <label>나이</label>
                        <input type="number" name="memberAge" value="<%=loginMember.getMemberAge()%>">
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn">수정 완료</button>
                        <button type="button" class="btn" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">취소</button>
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
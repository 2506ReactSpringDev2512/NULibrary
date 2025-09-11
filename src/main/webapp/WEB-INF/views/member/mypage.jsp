<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty loginUser or empty loginUserVO}">
    <c:redirect url="/main" />
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정 - NU 대학교 중앙도서관</title>
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
        
        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: calc(100vh - 400px);
            padding: 40px 20px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }
        
        .form-container {
            background-color: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 700px;
            border: none;
        }
        
        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: #2c5282;
            margin-bottom: 40px;
            text-align: center;
            padding: 0;
            border: none;
            position: relative;
        }
        
        .page-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 4px;
            background: linear-gradient(90deg, #2c5282, #3182ce);
            border-radius: 2px;
        }
        
        .form-group {
            margin-bottom: 25px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        
        .form-group label {
            font-weight: 600;
            color: #2c5282;
            font-size: 15px;
            border: none;
            padding: 0;
            background: none;
            width: auto;
            margin: 0;
        }
        
        .form-group input {
            width: 100%;
            padding: 15px 18px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
            outline: none;
        }
        
        .form-group input:focus {
            border-color: #2c5282;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(44, 82, 130, 0.1);
            transform: translateY(-1px);
        }
        
        .form-group input::placeholder {
            color: #a0aec0;
            font-weight: 400;
        }
        
        .readonly {
            background-color: #edf2f7 !important;
            color: #718096;
            border-color: #cbd5e0 !important;
            cursor: not-allowed;
        }
        
        .readonly:focus {
            transform: none !important;
            box-shadow: none !important;
            border-color: #cbd5e0 !important;
        }
        
        .button-group {
            text-align: center;
            margin-top: 40px;
            display: flex;
            gap: 20px;
            justify-content: center;
        }
        
        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            flex: 1;
            max-width: 150px;
        }
        
        .btn[type="submit"] {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(44, 82, 130, 0.3);
        }
        
        .btn[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 82, 130, 0.4);
            background: linear-gradient(135deg, #1a365d 0%, #2c5282 100%);
        }
        
        .btn[type="button"] {
            background-color: #f7fafc;
            color: #4a5568;
            border: 2px solid #e2e8f0;
        }
        
        .btn[type="button"]:hover {
            background-color: #edf2f7;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        
        .error-message {
            color: #e53e3e;
            background: linear-gradient(135deg, #fed7d7, #feb2b2);
            border: 2px solid #feb2b2;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            text-align: center;
            justify-content: center;
        }
        
        .error-message::before {
            content: '\f071';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 18px;
        }
        
        /* 사용자 정보 표시 영역 */
        .user-welcome {
            background: linear-gradient(135deg, #e6f0ff, #f0f8ff);
            border: 2px solid #2c5282;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
            color: #2c5282;
            font-weight: 600;
            font-size: 16px;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 768px) {
            .main-content {
                padding: 30px 15px;
                min-height: calc(100vh - 300px);
            }
            
            .form-container {
                padding: 30px 25px;
                border-radius: 15px;
            }
            
            .page-title {
                font-size: 28px;
                margin-bottom: 30px;
            }
            
            .button-group {
                flex-direction: column;
                gap: 15px;
            }
            
            .btn {
                max-width: none;
            }
        }
        
        @media (max-width: 480px) {
            .form-container {
                padding: 25px 20px;
                margin: 0 10px;
            }
            
            .page-title {
                font-size: 24px;
            }
            
            .form-group input {
                padding: 12px 15px;
                font-size: 14px;
            }
            
            .btn {
                padding: 12px 20px;
                font-size: 15px;
            }
            
            .error-message {
                font-size: 14px;
                padding: 12px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="main-content">
            <div class="form-container">
                <div class="page-title">개인정보 수정</div>
                
                <!-- 사용자 환영 메시지 -->
                <div class="user-welcome">
                    <i class="fas fa-user-circle" style="margin-right: 8px; font-size: 18px;"></i>
                    ${loginUser}님의 개인정보를 수정하실 수 있습니다
                </div>
                
                <!-- 에러 메시지 표시 -->
                <c:if test="${not empty errorMsg}">
                    <div id="errorMessage" class="error-message">
                        ${errorMsg}
                    </div>
                    <script>
                        setTimeout(function() {
                            var msg = document.getElementById('errorMessage');
                            if(msg) {
                                msg.style.opacity = '0';
                                msg.style.transition = 'opacity 0.5s ease';
                                setTimeout(function() {
                                    msg.style.display = 'none';
                                }, 500);
                            }
                        }, 3000);
                    </script>
                    <c:remove var="errorMsg" scope="session" />
                </c:if>
                
                <form action="${pageContext.request.contextPath}/member/update" method="post">
                    <div class="form-group">
                        <label><i class="fas fa-user" style="margin-right: 5px;"></i>아이디</label>
                        <input type="text" value="${loginUserVO.memberId}" class="readonly" readonly>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-lock" style="margin-right: 5px;"></i>현재 비밀번호</label>
                        <input type="password" name="currentPassword" placeholder="현재 비밀번호를 입력하세요" required>
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-key" style="margin-right: 5px;"></i>새 비밀번호</label>
                        <input type="password" name="newPassword" placeholder="새 비밀번호를 입력하세요 (변경하지 않으려면 비워두세요)">
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-check-circle" style="margin-right: 5px;"></i>비밀번호 확인</label>
                        <input type="password" name="confirmPassword" placeholder="새 비밀번호를 다시 입력하세요">
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-id-card" style="margin-right: 5px;"></i>이름</label>
                        <input type="text" name="memberName" value="${loginUserVO.memberName}">
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-phone" style="margin-right: 5px;"></i>전화번호</label>
                        <input type="tel" name="memberPhone" value="${loginUserVO.memberPhone}">
                    </div>
                    
                    <div class="form-group">
                        <label><i class="fas fa-calendar-alt" style="margin-right: 5px;"></i>나이</label>
                        <input type="number" name="memberAge" value="${loginUserVO.memberAge}">
                    </div>
                    
                    <div class="button-group">
                        <button type="submit" class="btn">
                            <i class="fas fa-save" style="margin-right: 5px;"></i>수정 완료
                        </button>
                        <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/main'">
                            <i class="fas fa-times" style="margin-right: 5px;"></i>취소
                        </button>
                    </div>
                </form>
            </div>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기 - NU 대학교 중앙도서관</title>
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
            padding: 60px 20px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }
        
        .form-container {
            background-color: white;
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
            border: none;
        }
        
        .page-title {
            font-size: 32px;
            font-weight: 700;
            color: #2c5282;
            margin-bottom: 40px;
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
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #2c5282;
            font-size: 15px;
            border: none;
            padding: 0;
            background: none;
        }
        
        .form-group input {
            width: 100%;
            padding: 18px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 16px;
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
        
        .btn-group {
            text-align: center;
            margin-top: 40px;
            display: flex;
            gap: 20px;
            justify-content: center;
        }
        
        .btn {
            padding: 18px 30px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            flex: 1;
            max-width: 200px;
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
        
        /* 메시지 스타일 */
        .message {
            padding: 20px 25px;
            margin-bottom: 30px;
            border-radius: 12px;
            text-align: center;
            font-weight: 500;
            font-size: 15px;
            line-height: 1.6;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        
        .success-message {
            background: linear-gradient(135deg, #d4edda, #c3e6cb);
            color: #155724;
            border: 2px solid #b8e6c1;
            box-shadow: 0 4px 12px rgba(21, 87, 36, 0.1);
        }
        
        .success-message::before {
            content: '\f058';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 20px;
            color: #28a745;
        }
        
        .error-message {
            background: linear-gradient(135deg, #fed7d7, #feb2b2);
            color: #e53e3e;
            border: 2px solid #feb2b2;
            box-shadow: 0 4px 12px rgba(229, 62, 62, 0.1);
        }
        
        .error-message::before {
            content: '\f071';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 20px;
        }
        
        .password-display {
            background-color: #f7fafc;
            padding: 15px 20px;
            border-radius: 8px;
            margin-top: 10px;
            border: 2px solid #e2e8f0;
            font-family: 'Courier New', monospace;
            font-size: 16px;
            font-weight: bold;
            color: #2d3748;
            letter-spacing: 1px;
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
            
            .btn-group {
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
                padding: 15px 18px;
                font-size: 15px;
            }
            
            .btn {
                padding: 15px 25px;
                font-size: 15px;
            }
            
            .message {
                font-size: 14px;
                padding: 15px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="main-content">
            <div class="form-container">
                <div class="page-title">비밀번호 찾기</div>
                
                <!-- 메시지 표시 영역 -->
                <c:if test="${not empty successMsg and not empty foundPassword}">
                    <div class="message success-message">
                        <div>
                            ${successMsg}
                            <div class="password-display">
                                비밀번호: ${foundPassword}
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:if test="${not empty errorMsg}">
                    <div class="message error-message">
                        ${errorMsg}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/member/findPassword" method="post">
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" name="memberId" placeholder="가입시 입력한 아이디를 입력하세요" 
                               value="${not empty memberId ? memberId : ''}" required>
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" name="memberPhone" placeholder="가입시 입력한 전화번호를 입력하세요 (예: 01012345678)" 
                               value="${not empty memberPhone ? memberPhone : ''}" required>
                    </div>
                    
                    <div class="btn-group">
                        <button type="submit" class="btn">비밀번호 찾기</button>
                        <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인으로 돌아가기</button>
                    </div>
                </form>
            </div>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
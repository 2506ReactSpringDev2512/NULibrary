<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - NU 대학교 중앙도서관</title>
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
            max-width: 600px;
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
            width: 100px;
            height: 4px;
            background: linear-gradient(90deg, #2c5282, #3182ce);
            border-radius: 2px;
        }
        
        .form-group {
            margin-bottom: 25px;
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
        
        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group input[type="tel"],
        .form-group input[type="number"] {
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
        
        /* 성별 라디오 스타일 */
        .form-group.gender .radio-group {
            display: flex;
            gap: 30px;
            margin-top: 10px;
        }
        
        .form-group.gender .radio-group label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 500;
            color: #4a5568;
            cursor: pointer;
            padding: 12px 20px;
            border: 2px solid #e2e8f0;
            border-radius: 10px;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
            flex: 1;
            justify-content: center;
        }
        
        .form-group.gender .radio-group label:hover {
            border-color: #2c5282;
            background-color: #e6f0ff;
        }
        
        .form-group.gender .radio-group input[type="radio"] {
            width: auto;
            margin: 0;
            accent-color: #2c5282;
        }
        
        .form-group.gender .radio-group input[type="radio"]:checked + span {
            color: #2c5282;
            font-weight: 600;
        }
        
        .form-group.gender .radio-group label:has(input:checked) {
            border-color: #2c5282;
            background-color: #e6f0ff;
            color: #2c5282;
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
            
            .form-group.gender .radio-group {
                gap: 15px;
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
            
            .form-group.gender .radio-group {
                flex-direction: column;
                gap: 10px;
            }
            
            .btn {
                padding: 12px 20px;
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <!-- 회원가입 메인 영역 -->
        <div class="main-content">
        	<div class="form-container">
            <div class="page-title">회원가입</div>
            
            		<!-- 에러 메세지 출력 -->
            <c:if test="${not empty errorMsg}">
                    <div class="error-message">
                        ${errorMsg}
                    </div>
                    <c:remove var="errorMsg" scope="session"/>
            </c:if>
            
               <form class="join-form" action="${pageContext.request.contextPath}/member/join" method="post">
                    <div class="form-group">
                        <label>아이디</label>
                        <input type="text" name="memberId" placeholder="아이디를 입력하세요"
                        value="${not empty memberId ? memberId : ''}" required>
                    </div>
                    
                    <div class="form-group">
					    <label>비밀번호</label>
					    <input type="password" name="memberPw" placeholder="비밀번호를 입력하세요"
					    value="${not empty memberPw ? memberPw : ''}" required>
					</div>
				
					<div class="form-group">
				   		<label>비밀번호 확인</label>
				   		<input type="password" name="memberPwConfirm" placeholder="비밀번호를 다시 입력하세요"
				   		value="${not empty memberPwConfirm ? memberPwConfirm : ''}" required>
					</div>
                    
                    <div class="form-group">
                        <label>이름</label>
                        <input type="text" name="memberName" placeholder="이름을 입력하세요"
                        value="${not empty memberName ? memberName : ''}" required>
                    </div>
                    
                    <div class="form-group gender">
                        <label>성별</label>
                        <div class="radio-group">
                            <label>
                                <input type="radio" name="memberGender" value="M" checked>
                                <span>남</span>
                            </label>
                            <label>
                                <input type="radio" name="memberGender" value="F">
                                <span>여</span>
                            </label>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label>전화번호</label>
                        <input type="tel" name="memberPhone" placeholder="전화번호를 입력하세요 ( - 제외 )"
                         value="${not empty memberPhone ? memberPhone : ''}" required>
                    </div>
                    
                    <div class="form-group">
    					<label>나이</label>
   				 		<input type="number" name="memberAge" placeholder="나이를 입력하세요"
   				 		 value="${not empty memberAge ? memberAge : ''}" required>
					</div>
                    
                    
                    <div class="button-group">
                        <button type="submit" class="btn">회원가입</button>
                        <button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/main'">취소</button>
                    </div>
                </form>
            </div>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
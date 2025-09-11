<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 - NU 대학교 중앙도서관</title>
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
        
        .page-content { 
            padding: 40px 60px; 
            max-width: 1000px; 
            margin: 0 auto; 
            min-height: calc(100vh - 400px);
        }
        
        .page-title { 
            text-align: center; 
            margin: 30px 0; 
            font-size: 32px; 
            font-weight: 700; 
            color: #2c5282; 
            padding: 20px 0;
            border-bottom: 3px solid #2c5282;
            position: relative;
        }
        
        .page-title::after {
            content: '';
            position: absolute;
            bottom: -3px;
            left: 50%;
            transform: translateX(-50%);
            width: 120px;
            height: 4px;
            background: linear-gradient(90deg, #2c5282, #3182ce);
            border-radius: 2px;
        }
        
        .notice-container {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            padding: 0;
            border: none;
            overflow: hidden;
        }
        
        .notice-header {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            padding: 30px 40px;
            border: none;
            margin: 0;
        }
        
        .notice-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 20px;
            border: none;
            padding: 0;
            background: none;
            color: white;
            line-height: 1.4;
            word-break: keep-all;
        }
        
        .notice-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0;
            background: none;
            border: none;
            color: rgba(255, 255, 255, 0.9);
            font-size: 15px;
            flex-wrap: wrap;
            gap: 10px;
        }
        
        .notice-info span {
            display: flex;
            align-items: center;
            gap: 8px;
            background: rgba(255, 255, 255, 0.1);
            padding: 8px 15px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
        }
        
        .notice-content {
            padding: 40px;
            line-height: 1.8;
            min-height: 400px;
            border: none;
            color: #4a5568;
            font-size: 16px;
            word-break: keep-all;
        }
        
        .notice-content p {
            margin-bottom: 16px;
        }
        
        .notice-content br {
            display: block;
            margin: 8px 0;
        }
        
        .button-section {
            text-align: center;
            margin-top: 40px;
            padding: 0 40px 40px;
        }
        
        .btn {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            border: none;
            padding: 15px 30px;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(44, 82, 130, 0.3);
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 82, 130, 0.4);
            background: linear-gradient(135deg, #1a365d 0%, #2c5282 100%);
        }
        
        .error-message {
            color: #e53e3e;
            background: linear-gradient(135deg, #fed7d7, #feb2b2);
            border: 2px solid #feb2b2;
            padding: 20px 25px;
            border-radius: 15px;
            margin: 30px 0;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            box-shadow: 0 4px 15px rgba(229, 62, 62, 0.15);
        }
        
        .error-message::before {
            content: '\f071';
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 20px;
        }
        
        .no-notice {
            text-align: center;
            padding: 80px 40px;
            color: #718096;
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
        
        .no-notice i {
            font-size: 64px;
            color: #cbd5e0;
            margin-bottom: 20px;
        }
        
        .no-notice p {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 10px;
        }
        
        .no-notice .sub-text {
            font-size: 14px;
            color: #a0aec0;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 1200px) {
            .page-content {
                padding: 30px 40px;
            }
        }
        
        @media (max-width: 768px) {
            .page-content {
                padding: 20px 15px;
            }
            
            .page-title {
                font-size: 28px;
                margin: 20px 0;
            }
            
            .notice-header {
                padding: 25px 25px;
            }
            
            .notice-title {
                font-size: 24px;
                margin-bottom: 15px;
            }
            
            .notice-info {
                flex-direction: column;
                gap: 10px;
                align-items: flex-start;
            }
            
            .notice-info span {
                font-size: 14px;
                padding: 6px 12px;
            }
            
            .notice-content {
                padding: 30px 25px;
                font-size: 15px;
                min-height: 300px;
            }
            
            .button-section {
                padding: 0 25px 30px;
            }
            
            .btn {
                padding: 12px 25px;
                font-size: 15px;
            }
            
            .no-notice {
                padding: 60px 25px;
            }
            
            .no-notice i {
                font-size: 48px;
            }
            
            .no-notice p {
                font-size: 16px;
            }
        }
        
        @media (max-width: 480px) {
            .page-title {
                font-size: 24px;
            }
            
            .notice-header {
                padding: 20px;
            }
            
            .notice-title {
                font-size: 20px;
            }
            
            .notice-content {
                padding: 25px 20px;
                font-size: 14px;
            }
            
            .button-section {
                padding: 0 20px 25px;
            }
            
            .btn {
                padding: 10px 20px;
                font-size: 14px;
            }
            
            .error-message {
                padding: 15px 20px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="page-content">
            <!-- 페이지 제목 -->
            <div class="page-title">
                <i class="fas fa-bullhorn" style="margin-right: 12px;"></i>
                공지사항
            </div>
            
            <!-- 에러 메시지 표시 -->
            <c:if test="${not empty errorMsg}">
                <div class="error-message">
                    ${errorMsg}
                </div>
            </c:if>
            
            <!-- 공지사항 내용 -->
            <c:choose>
                <c:when test="${not empty notice}">
                    <div class="notice-container">
                        <div class="notice-header">
                            <div class="notice-title">${notice.noticeSubject}</div>
                            <div class="notice-info">
                                <span>
                                    <i class="fas fa-calendar-alt"></i>
                                    작성일: ${notice.formattedDate}
                                </span>
                                <span>
                                    <i class="fas fa-eye"></i>
                                    조회수: ${notice.viewCount}
                                </span>
                            </div>
                        </div>
                        
                        <div class="notice-content">
                            ${notice.formattedContent}
                        </div>
                        
                        <div class="button-section">
                            <button class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list'">
                                <i class="fas fa-list"></i>
                                목록으로
                            </button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="no-notice">
                        <i class="fas fa-exclamation-circle"></i>
                        <p>공지사항을 찾을 수 없습니다</p>
                        <div class="sub-text">요청하신 공지사항이 삭제되었거나 존재하지 않습니다</div>
                        <button class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/list'">
                            <i class="fas fa-list"></i>
                            목록으로
                        </button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
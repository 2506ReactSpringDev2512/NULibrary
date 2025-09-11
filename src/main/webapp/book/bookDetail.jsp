<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="loginMember" value="${sessionScope.loginUserVO}" />
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 상세 - NU 대학교 중앙도서관</title>
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
        
        .book-detail-container {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            padding: 0;
            border: none;
            overflow: hidden;
        }
        
        .book-header {
            display: flex;
            gap: 40px;
            padding: 40px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            margin: 0;
            border: none;
            align-items: flex-start;
        }
        
        .book-image {
            width: 220px;
            height: 280px;
            border-radius: 15px;
            overflow: hidden;
            background-color: white;
            border: 3px solid #e2e8f0;
            flex-shrink: 0;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        
        .book-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border: none;
        }
        
        .book-info {
            flex: 1;
            min-width: 0;
        }
        
        .book-title {
            font-size: 28px;
            font-weight: 700;
            color: #2c5282;
            margin-bottom: 25px;
            padding: 0;
            border: none;
            background: none;
            line-height: 1.3;
            word-break: keep-all;
        }
        
        .info-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 0;
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        
        .info-table th,
        .info-table td {
            padding: 15px 20px;
            text-align: left;
            border: none;
            border-bottom: 1px solid #e2e8f0;
        }
        
        .info-table th {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            font-weight: 600;
            width: 120px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .info-table td {
            background-color: white;
            color: #4a5568;
            font-weight: 500;
        }
        
        .info-table tr:last-child th,
        .info-table tr:last-child td {
            border-bottom: none;
        }
        
        .status-section {
            padding: 40px;
            text-align: center;
            background-color: white;
        }
        
        .status {
            padding: 20px 30px;
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 30px;
            border-radius: 15px;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .status.available {
            background: linear-gradient(135deg, #c6f6d5, #9ae6b4);
            color: #38a169;
        }
        
        .status.unavailable {
            background: linear-gradient(135deg, #fed7d7, #feb2b2);
            color: #e53e3e;
        }
        
        .action-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            min-width: 120px;
            justify-content: center;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            box-shadow: 0 4px 15px rgba(44, 82, 130, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(44, 82, 130, 0.4);
            background: linear-gradient(135deg, #1a365d 0%, #2c5282 100%);
        }
        
        .btn-secondary {
            background-color: #f7fafc;
            color: #4a5568;
            border: 2px solid #e2e8f0;
        }
        
        .btn-secondary:hover {
            background-color: #edf2f7;
            border-color: #cbd5e0;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        
        .btn:disabled {
            background-color: #edf2f7;
            color: #a0aec0;
            cursor: not-allowed;
            transform: none;
            box-shadow: none;
        }
        
        .description-section {
            padding: 40px;
            background-color: white;
            border-top: 1px solid #e2e8f0;
        }
        
        .section-title {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            padding: 15px 25px;
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 25px;
            border: none;
            border-radius: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .description {
            background-color: #f8f9fa;
            padding: 30px;
            line-height: 1.8;
            border: none;
            border-radius: 12px;
            color: #4a5568;
            font-size: 16px;
            word-break: keep-all;
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
            
            .book-header {
                flex-direction: column;
                gap: 25px;
                padding: 30px 25px;
                text-align: center;
            }
            
            .book-image {
                width: 180px;
                height: 230px;
                align-self: center;
            }
            
            .book-title {
                font-size: 24px;
                text-align: center;
            }
            
            .info-table th {
                width: 100px;
                font-size: 13px;
                padding: 12px 15px;
            }
            
            .info-table td {
                padding: 12px 15px;
                font-size: 14px;
            }
            
            .status-section {
                padding: 30px 25px;
            }
            
            .status {
                font-size: 18px;
                padding: 15px 25px;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 15px;
                align-items: center;
            }
            
            .btn {
                width: 100%;
                max-width: 250px;
            }
            
            .description-section {
                padding: 30px 25px;
            }
            
            .description {
                padding: 25px 20px;
                font-size: 15px;
            }
        }
        
        @media (max-width: 480px) {
            .page-title {
                font-size: 24px;
            }
            
            .book-header {
                padding: 25px 20px;
            }
            
            .book-image {
                width: 150px;
                height: 190px;
            }
            
            .book-title {
                font-size: 20px;
            }
            
            .info-table th,
            .info-table td {
                padding: 10px 12px;
                font-size: 13px;
            }
            
            .status {
                font-size: 16px;
                padding: 12px 20px;
            }
            
            .btn {
                padding: 12px 20px;
                font-size: 15px;
            }
            
            .description {
                padding: 20px 15px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="page-content">
            <div class="page-title">
                <i class="fas fa-book-open" style="margin-right: 12px;"></i>
                도서 상세정보
            </div>
            
            <div class="book-detail-container">
                <div class="book-header">
                    <div class="book-image">
                        <img src="${pageContext.request.contextPath}/image/book/all/${book.bookNo}.jpg" alt="${book.bookName}">
                    </div>
                    
                    <div class="book-info">
                        <div class="book-title">${book.bookName}</div>
                        <table class="info-table">
                            <tr>
                                <th><i class="fas fa-user-edit"></i>저자</th>
                                <td>${book.bookAuthor}</td>
                            </tr>
                            <tr>
                                <th><i class="fas fa-building"></i>출판사</th>
                                <td>${book.bookPublisher}</td>
                            </tr>
                            <tr>
                                <th><i class="fas fa-barcode"></i>도서번호</th>
                                <td>${book.bookNo}</td>
                            </tr>
                            <tr>
                                <th><i class="fas fa-tag"></i>카테고리</th>
                                <td>${book.bookCategory}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                
                <div class="status-section">
                    <div class="status ${book.lendYn == '대여중' ? 'unavailable' : 'available'}">
                        <c:choose>
                            <c:when test="${book.lendYn == '대여중'}">
                                <i class="fas fa-times-circle"></i>대여중
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-check-circle"></i>대여가능
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="action-buttons">
                        <c:choose>
                            <c:when test="${book.lendYn == '대여가능'}">
                                <c:choose>
                                    <c:when test="${not empty loginMember}">
                                        <form method="post" action="${pageContext.request.contextPath}/lend/book" style="display:inline;">
                                            <input type="hidden" name="bookNo" value="${book.bookNo}">
                                            <button type="submit"
                                                    onclick="return confirm('「${book.bookName}」 도서를 대여하시겠습니까?')"
                                                    class="btn btn-primary">
                                                <i class="fas fa-book"></i>대여하기
                                            </button>
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        <button class="btn btn-primary"
                                                onclick="alert('로그인이 필요합니다.'); location.href='${pageContext.request.contextPath}/member/login.jsp';">
                                            <i class="fas fa-sign-in-alt"></i>로그인
                                        </button>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <button class="btn" disabled>
                                    <i class="fas fa-ban"></i>대여중
                                </button>
                            </c:otherwise>
                        </c:choose>
                        <button class="btn btn-secondary" onclick="history.back()">
                            <i class="fas fa-arrow-left"></i>목록으로
                        </button>
                    </div>
                </div>
                
                <div class="description-section">
                    <div class="section-title">
                        <i class="fas fa-info-circle"></i>도서 소개
                    </div>
                    <div class="description">
                        <c:choose>
                            <c:when test="${not empty book.bookDescription}">
                                ${book.bookDescription}
                            </c:when>
                            <c:otherwise>
                                도서 소개가 등록되지 않았습니다.
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
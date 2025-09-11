<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 대여 현황 - NU 대학교 중앙도서관</title>
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
            max-width: 1200px; 
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
            width: 150px;
            height: 4px;
            background: linear-gradient(90deg, #2c5282, #3182ce);
            border-radius: 2px;
        }
        
        .user-welcome {
            background: linear-gradient(135deg, #e6f0ff, #f0f8ff);
            border: 2px solid #2c5282;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            text-align: center;
            color: #2c5282;
            font-weight: 600;
            font-size: 18px;
        }
        
        .section {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            margin-bottom: 30px;
            padding: 0;
            border: none;
            overflow: hidden;
        }
        
        .section-title {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            color: white;
            padding: 20px 25px;
            font-weight: 600;
            font-size: 18px;
            margin: 0;
            border: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .table-container {
            padding: 0;
            border: none;
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
        }
        
        th {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #2c5282;
            font-weight: 600;
            padding: 18px 15px;
            text-align: center;
            border: none;
            border-bottom: 2px solid #e2e8f0;
            font-size: 14px;
        }
        
        td {
            padding: 15px;
            text-align: center;
            border: none;
            border-bottom: 1px solid #e2e8f0;
            color: #4a5568;
            font-size: 14px;
            vertical-align: middle;
        }
        
        tr:hover {
            background-color: #f8f9fa;
            transition: background-color 0.2s ease;
        }
        
        .return-btn {
            background: linear-gradient(135deg, #38a169 0%, #48bb78 100%);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .return-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(56, 161, 105, 0.3);
            background: linear-gradient(135deg, #2f855a 0%, #38a169 100%);
        }
        
        .no-data {
            text-align: center;
            padding: 60px 30px;
            color: #718096;
            font-size: 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 15px;
        }
        
        .no-data i {
            font-size: 48px;
            color: #cbd5e0;
        }
        
        .overdue {
            background: linear-gradient(135deg, #fed7d7 0%, #feb2b2 30%, white 30%);
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { box-shadow: 0 0 0 0 rgba(245, 101, 101, 0.4); }
            70% { box-shadow: 0 0 0 8px rgba(245, 101, 101, 0); }
            100% { box-shadow: 0 0 0 0 rgba(245, 101, 101, 0); }
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .status-overdue {
            background: linear-gradient(135deg, #fed7d7, #feb2b2);
            color: #e53e3e;
            border: 1px solid #feb2b2;
        }
        
        .status-normal {
            background: linear-gradient(135deg, #c6f6d5, #9ae6b4);
            color: #38a169;
            border: 1px solid #9ae6b4;
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
            
            .user-welcome {
                font-size: 16px;
                padding: 15px;
            }
            
            .section-title {
                padding: 15px 20px;
                font-size: 16px;
            }
            
            .table-container {
                overflow-x: auto;
            }
            
            table {
                min-width: 600px;
            }
            
            th, td {
                padding: 12px 8px;
                font-size: 13px;
            }
        }
        
        @media (max-width: 480px) {
            .page-title {
                font-size: 24px;
            }
            
            .user-welcome {
                font-size: 14px;
            }
            
            .section-title {
                font-size: 15px;
                padding: 12px 15px;
            }
            
            th, td {
                padding: 10px 6px;
                font-size: 12px;
            }
            
            .return-btn {
                padding: 6px 10px;
                font-size: 11px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="page-content">
            <div class="page-title">
                <i class="fas fa-book-reader" style="margin-right: 10px;"></i>
                내 대여 현황
            </div>
            
            <!-- 사용자 환영 메시지 -->
            <div class="user-welcome">
                <i class="fas fa-user-circle" style="margin-right: 8px; font-size: 20px;"></i>
                <c:choose>
                    <c:when test="${not empty loginMember}">
                        ${loginMember.memberName}님의 대여 현황을 확인하실 수 있습니다
                    </c:when>
                    <c:when test="${not empty loginUserVO}">
                        ${loginUserVO.memberName}님의 대여 현황을 확인하실 수 있습니다
                    </c:when>
                    <c:otherwise>
                        회원님의 대여 현황을 확인하실 수 있습니다
                    </c:otherwise>
                </c:choose>
            </div>
            
            <!-- 현재 대여중인 도서 -->
            <div class="section">
                <div class="section-title">
                    <i class="fas fa-books" style="margin-right: 8px;"></i>
                    현재 대여중인 도서
                </div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th><i class="fas fa-book" style="margin-right: 5px;"></i>도서명</th>
                                <th><i class="fas fa-user-edit" style="margin-right: 5px;"></i>저자</th>
                                <th><i class="fas fa-calendar-check" style="margin-right: 5px;"></i>대여일</th>
                                <th><i class="fas fa-calendar-times" style="margin-right: 5px;"></i>반납예정일</th>
                                <th><i class="fas fa-info-circle" style="margin-right: 5px;"></i>상태</th>
                                <th><i class="fas fa-undo" style="margin-right: 5px;"></i>반납</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty myRentalList}">
                                    <c:forEach var="rental" items="${myRentalList}">
                                        <tr <c:if test="${rental.isOverdue}">class="overdue"</c:if>>
                                            <td style="font-weight: 500;">${rental.bookName}</td>
                                            <td>${rental.bookAuthor}</td>
                                            <td>${rental.lendDate}</td>
                                            <td>${rental.returnDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${rental.isOverdue}">
                                                        <span class="status-badge status-overdue">
                                                            <i class="fas fa-exclamation-triangle"></i>연체
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="status-badge status-normal">
                                                            <i class="fas fa-check-circle"></i>대여중
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <form method="post" action="${pageContext.request.contextPath}/lend/return" style="display: inline;">
                                                    <input type="hidden" name="bookNo" value="${rental.bookNo}">
                                                    <button type="submit" class="return-btn" onclick="return confirm('정말 반납하시겠습니까?')">
                                                        <i class="fas fa-undo"></i>반납
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6" class="no-data">
                                            <i class="fas fa-book-open"></i>
                                            <div>현재 대여중인 도서가 없습니다</div>
                                            <div style="font-size: 14px; color: #a0aec0; margin-top: 5px;">
                                                도서 목록에서 원하는 책을 대여해보세요!
                                            </div>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
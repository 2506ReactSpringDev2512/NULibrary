<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 대여 현황 - 도서관</title>
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
            max-width: 1000px;
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
        
        .section {
            border: 2px solid #333;
            margin-bottom: 30px;
            padding: 20px;
        }
        
        .section-title {
            border: 1px solid #666;
            padding: 10px;
            font-weight: bold;
            margin-bottom: 15px;
            background-color: #f9f9f9;
        }
        
        .table-container {
            border: 1px solid #666;
            padding: 10px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            border: 1px solid #666;
            padding: 12px;
            text-align: center;
        }
        
        th {
            background-color: #f9f9f9;
            font-weight: bold;
        }
        
        .return-btn {
            border: 1px solid #333;
            padding: 5px 10px;
            background-color: white;
            cursor: pointer;
            font-size: 12px;
        }
        
        .no-data {
            text-align: center;
            padding: 30px;
            color: #666;
            border: 1px solid #ccc;
        }
        
        .overdue {
            background-color: #ffe6e6;
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
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="user-info">
                <c:choose>
                    <c:when test="${not empty loginMember}">
                        <div>${loginMember.memberName}님</div>
                        <div onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</div>
                    </c:when>
                    <c:when test="${not empty loginUserVO}">
                        <div>${loginUserVO.memberName}님</div>
                        <div onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</div>
                    </c:when>
                    <c:otherwise>
                        <div onclick="location.href='${pageContext.request.contextPath}/member/login.jsp'">로그인</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">내 대여 현황</div>
            
            <!-- 현재 대여중인 도서 -->
            <div class="section">
                <div class="section-title">현재 대여중인 도서</div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>도서명</th>
                                <th>저자</th>
                                <th>대여일</th>
                                <th>반납예정일</th>
                                <th>상태</th>
                                <th>반납</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty myRentalList}">
                                    <c:forEach var="rental" items="${myRentalList}">
                                        <tr <c:if test="${rental.isOverdue}">class="overdue"</c:if>>
                                            <td>${rental.bookName}</td>
                                            <td>${rental.bookAuthor}</td>
                                            <td>${rental.lendDate}</td>
                                            <td>${rental.returnDate}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${rental.isOverdue}">
                                                        <span style="color: red; font-weight: bold;">연체</span>
                                                    </c:when>
                                                    <c:otherwise>대여중</c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <form method="post" action="${pageContext.request.contextPath}/lend/return" style="display: inline;">
                                                    <input type="hidden" name="bookNo" value="${rental.bookNo}">
                                                    <button type="submit" class="return-btn" onclick="return confirm('정말 반납하시겠습니까?')">반납</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6" class="no-data">현재 대여중인 도서가 없습니다.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- 대여 이력 -->
            <div class="section">
                <div class="section-title">대여 이력</div>
                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>도서명</th>
                                <th>저자</th>
                                <th>대여일</th>
                                <th>반납일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td colspan="5" class="no-data">대여 이력 기능은 추후 구현 예정입니다.</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
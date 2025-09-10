<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대여 관리 - 관리자</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; background-color: #333; color: white; text-align: center; font-weight: bold; }
        .main-content { display: flex; gap: 20px; padding: 20px; }
        .sidebar { width: 200px; border: 2px solid #333; padding: 20px; }
        .menu-item { border: 1px solid #666; padding: 10px; margin-bottom: 8px; cursor: pointer; }
        .content { flex: 1; }
        .search-box { border: 2px solid #333; padding: 20px; margin-bottom: 20px; }
        .search-input { padding: 10px; border: 1px solid #666; width: 300px; margin-right: 10px; }
        .search-btn { padding: 10px 20px; border: 2px solid #333; background: white; cursor: pointer; }
        .rental-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 10px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .action-btn { padding: 5px 10px; border: 1px solid #333; background: white; cursor: pointer; }
        .overdue { background-color: #ffe6e6; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <c:choose>
                <c:when test="${pageTitle != null}">
                    ${pageTitle}
                </c:when>
                <c:otherwise>대여 관리</c:otherwise>
            </c:choose>
        </div>
        
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/main'">대시보드</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage'">회원 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/bookManage'">도서 관리</div>
                <div class="menu-item" style="background:#f0f0f0;">대여 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/rentalManage?type=overdue'" 
                     style="margin-left: 10px; font-size: 14px;">연체 도서</div>
            </div>
            
            <div class="content">
                <div class="search-box">
                    <input type="text" class="search-input" placeholder="회원명 또는 도서명 검색">
                    <button class="search-btn">검색</button>
                </div>
                
                <table class="rental-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>회원명</th>
                            <th>도서명</th>
                            <th>대여일</th>
                            <th>반납예정일</th>
                            <th>상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty rentalList}">
                                <c:forEach var="rental" items="${rentalList}" varStatus="status">
                                    <tr <c:if test="${rental.isOverdue}">class="overdue"</c:if>>
                                        <td>${status.count}</td>
                                        <td>${rental.memberName}</td>
                                        <td>${rental.bookName}</td>
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
                                            <form method="post" action="${pageContext.request.contextPath}/admin/rentalManage" style="display: inline;">
                                                <input type="hidden" name="action" value="return">
                                                <input type="hidden" name="memberId" value="${rental.MId}">
                                                <input type="hidden" name="bookNo" value="${rental.bookNo}">
                                                <input type="hidden" name="type" value="${type}">
                                                <button type="submit" class="action-btn" onclick="return confirm('${rental.memberName}님의 「${rental.bookName}」 도서를 반납처리 하시겠습니까?')">반납처리</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" style="text-align: center; padding: 30px; color: #666;">
                                        <c:choose>
                                            <c:when test="${type == 'overdue'}">현재 연체 도서가 없습니다.</c:when>
                                            <c:otherwise>현재 대여중인 도서가 없습니다.</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 도서 정보 출력</title>
<style>
    table {
        width: 90%;
        border-collapse: collapse;
        margin: 20px auto;
    }
    th, td {
        border: 1px solid #666;
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f0f0f0;
    }
    h2 {
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
<h2>
    <c:choose>
        <c:when test="${not empty selectedCategory}">
            ${selectedCategory} 카테고리 도서 목록
        </c:when>
        <c:otherwise>
            전체 도서 정보
        </c:otherwise>
    </c:choose>
</h2>

<div style="text-align: center; margin-bottom: 20px;">
    <a href="bookList" style="text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px;">전체</a>
    <a href="bookList?category=소설/문학" style="text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px;">소설/문학</a>
    <a href="bookList?category=인문/사회" style="text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px;">인문/사회</a>
    <a href="bookList?category=자연과학/기술" style="text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px;">자연과학/기술</a>
    <a href="bookList?category=예술/취미" style="text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px;">예술/취미</a>
    <a href="bookList?category=아동/청소년" style="text-decoration: none; color: #333; padding: 10px 20px; border: 1px solid #666; background-color: white; margin: 0 5px;">아동/청소년</a>
</div>

<table>
    <thead>
        <tr>
            <th>도서 번호</th>
            <th>도서 이름</th>
            <th>저자</th>
            <th>출판사</th>
            <th>카테고리</th>
            <th>대여 여부</th>
            <th>대여</th>
        </tr>
    </thead>
    <tbody>
     <!-- bookList 가 비어있을 경우 메세지 출력  -->
     	<c:if test="${empty bookList}">
		    <tr>
		        <td colspan="7">등록된 도서가 없습니다.</td>
		    </tr>
		</c:if>
        <c:forEach var="book" items="${bookList}">
            <tr> 
                <td>${book.bookNo}</td>
                <td>${book.bookName}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookPublisher}</td>
                <td>${book.bookCategory}</td>
                <td>
                    <c:choose>
                        <c:when test="${book.lendYn == '대여중'}">
                            <span style="color: red; font-weight: bold;">대여중</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: green; font-weight: bold;">대여가능</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${book.lendYn == '대여가능'}">
                            <c:choose>
                                <c:when test="${not empty loginMember}">
                                    <form method="post" action="${pageContext.request.contextPath}/lend/book" style="display: inline;">
                                        <input type="hidden" name="bookNo" value="${book.bookNo}">
                                        <button type="submit" 
                                                style="padding: 5px 10px; border: 1px solid #333; background-color: #f0f0f0; cursor: pointer;"
                                                onclick="return confirm('「${book.bookName}」 도서를 대여하시겠습니까?')">대여</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <button onclick="alert('로그인이 필요합니다.'); location.href='${pageContext.request.contextPath}/member/login.jsp';"
                                            style="padding: 5px 10px; border: 1px solid #666; background-color: #ccc; cursor: pointer;">로그인</button>
                                </c:otherwise>
                            </c:choose>
                        </c:when>
                        <c:otherwise>
                            <span style="color: #999;">대여중</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
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
<h2>전체 도서 정보</h2>

<table>
    <thead>
        <tr>
            <th>도서 번호</th>
            <th>도서 이름</th>
            <th>저자</th>
            <th>출판사</th>
            <th>대여 여부</th>
        </tr>
    </thead>
    <tbody>
     <!-- bookList 가 비어있을 경우 메세지 출력  -->
     	<c:if test="${empty bookList}">
		    <tr>
		        <td colspan="5">등록된 도서가 없습니다.</td>
		    </tr>
		</c:if>
        <c:forEach var="book" items="${bookList}">
            <tr> 
                <td>${book.bookNo}</td>
                <td>${book.bookName}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookPublisher}</td>
                <td>${book.lendYn}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
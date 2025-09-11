<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 관리 - 관리자</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; background-color: #333; color: white; text-align: center; font-weight: bold; }
        .main-content { display: flex; gap: 20px; padding: 20px; }
        .sidebar { width: 200px; border: 2px solid #333; padding: 20px; }
        .menu-item { border: 1px solid #666; padding: 10px; margin-bottom: 8px; cursor: pointer; }
        .content { flex: 1; }
        .top-actions { border: 2px solid #333; padding: 20px; margin-bottom: 20px; display: flex; justify-content: space-between; }
        .search-input { padding: 10px; border: 1px solid #666; width: 300px; margin-right: 10px; }
        .btn { padding: 10px 20px; border: 2px solid #333; background: white; cursor: pointer; }
        .book-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 10px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .action-btn { padding: 5px 10px; border: 1px solid #333; background: white; cursor: pointer; margin: 0 2px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">도서 관리</div>
        
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/main'">대시보드</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage'">회원 정보 조회</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/notice'">공지사항 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/bookManage'"
                	style="background:#f0f0f0;">도서 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/rentalManage'">대여 관리</div>
            </div>
            
            <div class="content">
                <div class="top-actions">
                    <form action="${pageContext.request.contextPath}/admin/bookManage" method="get">
	                    <div>
	                        <input type="text" class="search-input" name="keyword" value="${keyword}" placeholder="검색어를 입력해주세요.">
	                        <button class="btn">검색</button>
	                    </div>
                    </form>
                    <button class="btn">도서 추가</button>
                </div>
                
                <table class="book-table">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>도서명</th>
                            <th>저자</th>
                            <th>출판사</th>
                            <th>상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty bookList}">
                                <c:forEach var="book" items="${bookList}" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td>${book.bookName}</td>
                                        <td>${book.bookAuthor}</td>
                                        <td>${book.bookPublisher}</td>
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
                                            <button class="action-btn" onclick="editBookDescription('${book.bookNo}', '${book.bookName}')">소개 수정</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" style="text-align: center; padding: 30px; color: #666;">
                                        등록된 도서가 없습니다.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        function editBookDescription(bookNo, bookName) {
            var currentDescription = prompt('「' + bookName + '」의 도서 소개를 입력해주세요:', '');
            
            if (currentDescription !== null && currentDescription.trim() !== '') {
                // 도서 소개 수정 요청
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = '${pageContext.request.contextPath}/admin/bookManage';
                
                var actionInput = document.createElement('input');
                actionInput.type = 'hidden';
                actionInput.name = 'action';
                actionInput.value = 'updateDescription';
                form.appendChild(actionInput);
                
                var bookNoInput = document.createElement('input');
                bookNoInput.type = 'hidden';
                bookNoInput.name = 'bookNo';
                bookNoInput.value = bookNo;
                form.appendChild(bookNoInput);
                
                var descriptionInput = document.createElement('input');
                descriptionInput.type = 'hidden';
                descriptionInput.name = 'description';
                descriptionInput.value = currentDescription;
                form.appendChild(descriptionInput);
                
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>
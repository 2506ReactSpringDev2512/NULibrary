<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 관리 - 관리자</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; color: #111; }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
            padding-bottom: 20px;
        }

        /* 헤더 */
        .header { 
            background-color: #2c5282;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .logo { 
            color: white;
            font-size: 28px;
            font-weight: 700;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 15px;
        }
        .logo img { height: 60px; width: 100px; border: none; outline: none; }
        .logo-text { display: flex; flex-direction: column; }
        .logo-title { font-size: 18px; font-weight: bold; color: #fff; }
        .logo-subtitle { font-size: 14px; color: #ccc; }

        /* admin info 오른쪽 */
        .admin-info { 
            display: flex; 
            gap: 10px; 
        }
        .admin-info div { 
            border: 1px solid #000; 
            padding: 6px 12px; 
            cursor: pointer; 
            border-radius: 6px;
            background-color: #fff;
            color: #000;
            transition: 0.3s;
        }
        .admin-info div:hover { 
            background-color: #000; 
            color: #fff; 
        }

        /* 메인 레이아웃 */
        .main-content {
            display: flex;
            gap: 30px;
            padding: 20px 40px;
        }

        /* 사이드바 */
        .sidebar { 
            width: 220px; 
            background-color: #f8f9fa; 
            padding: 20px; 
            border: 1px solid #e9ecef;
            border-radius: 8px;
            flex-shrink: 0;
        }
        .menu-item { 
            padding: 12px 20px;
            cursor: pointer;
            color: #333;
            font-weight: 500;
            border-bottom: 1px solid #f0f0f0;
            transition: all 0.3s ease;
            text-align: center;
            border-radius: 6px;
        }
        .menu-item:hover { 
            background-color: #2c5282; 
            color: #fff; 
        }
        .menu-item.active { background-color: #2c5282; color: #fff; }

        /* 콘텐츠 */
        .content { flex: 1; }

        .top-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-form { display: flex; gap: 10px; }
        .search-input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            width: 400px;
        }
        .btn {
            padding: 10px 20px;
            border: 2px solid #2c5282;
            background-color: #2c5282;
            color: #fff;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover { background-color: #fff; color: #2c5282; }

        .book-table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #ddd;
            border-radius: 6px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #2c5282;
            color: #fff;
            font-weight: bold;
        }
        .status-available { color: green; font-weight: bold; }
        .status-rented { color: red; font-weight: bold; }
        .action-btn {
            padding: 5px 10px;
            border: 1px solid #2c5282;
            background-color: #2c5282;
            color: #fff;
            cursor: pointer;
            border-radius: 4px;
            transition: 0.3s;
        }
        .action-btn:hover { background-color: #fff; color: #2c5282; }

        @media (max-width: 1024px) {
            .main-content { flex-direction: column; gap: 20px; padding: 20px; }
            .sidebar { width: 100%; }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
             <!-- 로고 -->
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고">
                <div class="logo-text">
                    <div class="logo-title">NU 대학교 중앙도서관</div>
                    <div class="logo-subtitle">관리자 시스템</div>
                </div>
            </div>
            <div class="admin-info">
                <div>${loginAdmin}님</div>
                <div onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</div>
            </div>
        </div>

        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/main'">대시보드</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/memberManage'">회원 정보 조회</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/notice'">공지사항 관리</div>
                <div class="menu-item active" onclick="location.href='${pageContext.request.contextPath}/admin/bookManage'">도서 관리</div>
                <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/rentalManage'">대여 관리</div>
            </div>

            <div class="content">
                <div class="top-actions">
                    <form class="search-form" action="${pageContext.request.contextPath}/admin/bookManage" method="get">
                        <input type="text" class="search-input" name="keyword" value="${keyword}" placeholder="검색어를 입력해주세요.">
                        <button type="submit" class="btn">검색</button>
                    </form>
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
                                                    <span class="status-rented">대여중</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-available">대여가능</span>
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
                                    <td colspan="6" style="text-align: center; padding: 30px; color: #666;">등록된 도서가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>

        <%@ include file="../common/footer.jsp" %>    
    </div>

    <script>
        function editBookDescription(bookNo, bookName) {
            var currentDescription = prompt('「' + bookName + '」의 도서 소개를 입력해주세요:', '');
            if (currentDescription !== null && currentDescription.trim() !== '') {
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
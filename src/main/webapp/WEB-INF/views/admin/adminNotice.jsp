<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 관리 - 관리자</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* 기본 스타일 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            color: #111;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* 헤더 */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 60px;
            background-color: #2c5282;
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

        .nav-menu {
            display: flex;
            gap: 10px;
        }

        .nav-menu div {
            padding: 6px 12px;
            border-radius: 6px;
            background-color: #fff;
            color: #2c5282;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
        }

        .nav-menu div:hover {
            background-color: #2c5282;
            color: #fff;
        }

        /* 메인 콘텐츠 */
        .main-content {
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .page-title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 30px;
            color: #2c5282;
        }

        /* 버튼 스타일 */
        .btn {
            padding: 10px 20px;
            border: 2px solid #2c5282;
            background-color: #2c5282;
            color: #fff;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background-color: #fff;
            color: #2c5282;
        }

        /* 메시지 */
        .error-message {
            background-color: #f8d7da;
            color: #721c24;
            padding: 15px;
            border: 1px solid #f5c6cb;
            margin: 20px 0;
            text-align: center;
            border-radius: 6px;
        }

        .success-message {
            background-color: #d4edda;
            color: #155724;
            padding: 15px;
            border: 1px solid #c3e6cb;
            margin: 20px 0;
            text-align: center;
            border-radius: 6px;
        }

        /* 테이블 */
        .notice-table {
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

        .notice-title {
            text-align: left;
            cursor: pointer;
            color: #2c5282;
            transition: 0.3s;
        }

        .notice-title:hover {
            text-decoration: underline;
            color: #1a365d;
        }

        .no-notice {
            text-align: center;
            padding: 50px;
            color: #666;
        }

        /* 삭제 버튼 */
        .delete-btn {
            padding: 5px 10px;
            border: 1px solid #dc3545;
            background-color: #dc3545;
            color: white;
            cursor: pointer;
            font-size: 12px;
            border-radius: 4px;
            transition: 0.3s;
        }

        .delete-btn:hover {
            background-color: #fff;
            color: #dc3545;
        }


        /* 반응형 */
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 10px;
            }
            .nav-menu {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- 헤더 -->
        <div class="header">
            <!-- 로고 -->
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고">
                <div class="logo-text">
                    <div class="logo-title">NU 대학교 중앙도서관</div>
                    <div class="logo-subtitle">관리자 시스템</div>
                </div>
            </div>
            <div class="nav-menu">
                <div onclick="location.href='${pageContext.request.contextPath}/notice/list'">일반 공지사항</div>
                <div onclick="location.href='${pageContext.request.contextPath}/admin/main'">관리자 홈</div>
            </div>
        </div>

        <!-- 메인 콘텐츠 -->
        <div class="main-content">
            <div class="page-title">공지사항 관리</div>

            <div style="text-align: right; margin-bottom: 20px;">
                <button class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/write'">
                    공지사항 작성
                </button>
            </div>

            <!-- 에러/성공 메시지 -->
            <c:if test="${not empty errorMsg}">
                <div class="error-message">${errorMsg}</div>
            </c:if>

            <c:if test="${not empty successMsg}">
                <div class="success-message">${successMsg}</div>
            </c:if>

            <!-- 공지사항 테이블 -->
            <c:choose>
                <c:when test="${not empty noticeList}">
                    <table class="notice-table">
                        <thead>
                            <tr>
                                <th width="60">번호</th>
                                <th>제목</th>
                                <th width="100">작성자</th>
                                <th width="120">작성일</th>
                                <th width="80">조회</th>
                                <th width="80">관리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${noticeList}" var="notice">
                                <tr>
                                    <td>${notice.noticeNo}</td>
                                    <td class="notice-title" onclick="location.href='${pageContext.request.contextPath}/notice/detail?noticeNo=${notice.noticeNo}'">
                                        ${notice.noticeSubject}
                                    </td>
                                    <td>관리자</td>
                                    <td>${notice.formattedDate}</td>
                                    <td>${notice.viewCount}</td>
                                    <td>
                                        <button class="delete-btn" onclick="deleteNotice(${notice.noticeNo})">삭제</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-notice">등록된 공지사항이 없습니다.</div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- footer -->
        <div class="footer">
            <%@ include file="../common/footer.jsp" %>
        </div>
    </div>

    <script>
        function deleteNotice(noticeNo) {
            if (confirm('정말로 이 공지사항을 삭제하시겠습니까?')) {
                location.href = '${pageContext.request.contextPath}/notice/delete?noticeNo=' + noticeNo;
            }
        }
    </script>
</body>
</html>
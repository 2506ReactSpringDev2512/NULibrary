<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록 - NU 대학교 중앙도서관</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background-color: #ffffff; }
        .container { width: 100%; margin: 0; background-color: #ffffff; min-height: 100vh; }
        .page-content { 
            padding: 40px 60px; 
            max-width: 1200px; 
            margin: 0 auto; 
            min-height: calc(100vh - 400px);
        }
        .page-title { 
            text-align: center; 
            font-size: 28px; 
            font-weight: 600; 
            color: #2c5282; 
            margin: 30px 0;
            padding: 20px 0;
            border-bottom: 3px solid #2c5282;
        }
        .notice-table { 
            width: 100%; 
            border-collapse: collapse; 
            border: 1px solid #e9ecef;
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-top: 20px;
        }
        th, td { 
            border: 1px solid #e9ecef; 
            padding: 18px; 
            text-align: center; 
        }
        th { 
            background-color: #2c5282; 
            font-weight: 600; 
            color: white;
            font-size: 16px;
        }
        .notice-title { 
            text-align: left; 
            cursor: pointer; 
            transition: all 0.3s ease;
            font-weight: 500;
            color: #333;
        }
        .notice-title:hover { 
            text-decoration: underline; 
            color: #2c5282; 
            font-weight: 600;
        }
        .no-notice { 
            text-align: center; 
            padding: 80px; 
            color: #666; 
            font-size: 18px;
            background-color: #f8f9fa;
            border-radius: 12px;
            border: 2px dashed #e9ecef;
        }
        .error-message { 
            background-color: #f8d7da; 
            color: #721c24; 
            padding: 20px; 
            border: 1px solid #f5c6cb; 
            border-radius: 8px;
            margin: 20px 0; 
            text-align: center; 
            font-weight: 500;
        }
        .success-message {
            background-color: #d4edda; 
            color: #155724; 
            padding: 20px; 
            border: 1px solid #c3e6cb; 
            border-radius: 8px;
            margin: 20px 0; 
            text-align: center;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="page-content">
            <div class="page-title">공지사항</div>
            
            
            <!-- 에러 메시지 표시 -->
            <c:if test="${not empty errorMsg}">
                <div class="error-message">
                    ${errorMsg}
                </div>
            </c:if>
            
            <!-- 성공 메시지 표시 -->
            <c:if test="${not empty successMsg}">
                <div class="success-message">
                    ${successMsg}
                </div>
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
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${noticeList}" var="notice">
                                <tr>
                                    <td>${notice.noticeNo}</td>
                                    <td class="notice-title" onclick="location.href='${pageContext.request.contextPath}/notice/detail?noticeNo=${notice.noticeNo}'">${notice.noticeSubject}</td>
                                    <td>관리자</td>
                                    <td>${notice.formattedDate}</td>
                                    <td>${notice.viewCount}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="no-notice">
                        <p>등록된 공지사항이 없습니다.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
    </div>
</body>
</html>
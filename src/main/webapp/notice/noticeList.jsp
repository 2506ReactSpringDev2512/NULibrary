<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록 - 도서관</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; display: flex; justify-content: space-between; align-items: center; }
        .logo { padding: 10px 20px; font-weight: bold; cursor: pointer; }
        .nav-menu div { border: 1px solid #666; padding: 8px 15px; cursor: pointer; }
        .main-content { padding: 30px; }
        .page-title { border: 2px solid #333; padding: 20px; text-align: center; font-size: 24px; font-weight: bold; margin-bottom: 30px; }
        .notice-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 12px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .notice-title { text-align: left; cursor: pointer; }
        .notice-title:hover { text-decoration: underline; color: #0066cc; }
        .footer { border: 2px solid #333; padding: 20px; text-align: center; background-color: #f9f9f9; }
        .no-notice { text-align: center; padding: 50px; color: #666; }
        .error-message { background-color: #f8d7da; color: #721c24; padding: 15px; border: 1px solid #f5c6cb; margin: 20px 0; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo" onclick="location.href='<%= request.getContextPath() %>/index.jsp'">
                <img src="<%= request.getContextPath() %>/image/logo.png" alt="도서관 로고" style="height: 60px; witdh:200px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div onclick="location.href='<%= request.getContextPath() %>/index.jsp'">홈으로</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">공지사항</div>
            
            
            <!-- 에러 메시지 표시 -->
            <c:if test="${not empty errorMsg}">
                <div class="error-message">
                    ${errorMsg}
                </div>
            </c:if>
            
            <!-- 성공 메시지 표시 -->
            <c:if test="${not empty successMsg}">
                <div class="success-message" style="background-color: #d4edda; color: #155724; padding: 15px; border: 1px solid #c3e6cb; margin: 20px 0; text-align: center;">
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
                                    <td class="notice-title" onclick="location.href='<%= request.getContextPath() %>/notice/detail?noticeNo=${notice.noticeNo}'">${notice.noticeSubject}</td>
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
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
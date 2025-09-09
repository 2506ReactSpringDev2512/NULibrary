<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성 - 도서관</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; display: flex; justify-content: space-between; align-items: center; }
        .logo { padding: 10px 20px; font-weight: bold; cursor: pointer; }
        .nav-menu div { border: 1px solid #666; padding: 8px 15px; cursor: pointer; margin-left: 10px; }
        .nav-menu { display: flex; }
        .main-content { padding: 30px; }
        .page-title { border: 2px solid #333; padding: 20px; text-align: center; font-size: 24px; font-weight: bold; margin-bottom: 30px; }
        .write-form { border: 2px solid #333; padding: 30px; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: bold; }
        .form-group input[type="text"] { width: 100%; padding: 12px; border: 1px solid #666; font-size: 16px; }
        .form-group textarea { width: 100%; padding: 12px; border: 1px solid #666; font-size: 16px; resize: vertical; min-height: 300px; }
        .button-group { text-align: center; margin-top: 30px; }
        .btn { padding: 12px 30px; margin: 0 10px; border: 2px solid #333; background-color: white; cursor: pointer; font-size: 16px; }
        .btn:hover { background-color: #f0f0f0; }
        .btn-primary { background-color: #333; color: white; }
        .btn-primary:hover { background-color: #555; }
        .footer { border: 2px solid #333; padding: 20px; text-align: center; background-color: #f9f9f9; }
        .error-message { background-color: #f8d7da; color: #721c24; padding: 15px; border: 1px solid #f5c6cb; margin: 20px 0; text-align: center; }
        .success-message { background-color: #d4edda; color: #155724; padding: 15px; border: 1px solid #c3e6cb; margin: 20px 0; text-align: center; }
        .required { color: #dc3545; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo" onclick="location.href='${pageContext.request.contextPath}/index.jsp'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="nav-menu">
                <div onclick="location.href='${pageContext.request.contextPath}/notice/list'">공지사항 목록</div>
                <div onclick="location.href='${pageContext.request.contextPath}/index.jsp'">홈으로</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">공지사항 작성</div>
            
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
            
            <!-- 공지사항 작성 폼 -->
            <form class="write-form" action="${pageContext.request.contextPath}/notice/write" method="post">
                <div class="form-group">
                    <label for="noticeSubject">제목 <span class="required">*</span></label>
                    <input type="text" id="noticeSubject" name="noticeSubject" 
                           placeholder="공지사항 제목을 입력하세요" required maxlength="200"
                           value="${param.noticeSubject}">
                </div>
                
                <div class="form-group">
                    <label for="noticeContent">내용 <span class="required">*</span></label>
                    <textarea id="noticeContent" name="noticeContent" 
                              placeholder="공지사항 내용을 입력하세요" required>${param.noticeContent}</textarea>
                </div>
                
                <div class="form-group">
                    <label for="noticeWriter">작성자</label>
                    <input type="text" id="noticeWriter" name="noticeWriter" 
                           value="admin" readonly style="background-color: #f8f9fa;">
                </div>
                
                <div class="button-group">
                    <button type="submit" class="btn btn-primary">작성 완료</button>
                    <button type="button" class="btn" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
    
    <script>
        // 폼 제출 전 확인
        document.querySelector('form').addEventListener('submit', function(e) {
            const subject = document.getElementById('noticeSubject').value.trim();
            const content = document.getElementById('noticeContent').value.trim();
            
            if (!subject) {
                alert('제목을 입력해주세요.');
                document.getElementById('noticeSubject').focus();
                e.preventDefault();
                return;
            }
            
            if (!content) {
                alert('내용을 입력해주세요.');
                document.getElementById('noticeContent').focus();
                e.preventDefault();
                return;
            }
            
            if (!confirm('공지사항을 작성하시겠습니까?')) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html>
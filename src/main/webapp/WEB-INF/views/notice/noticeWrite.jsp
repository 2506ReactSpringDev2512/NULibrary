<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 작성 - 관리자</title>
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
        color: #fff;
        font-weight: bold;
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


    .admin-info { display: flex; gap: 10px; }
    .admin-info div { border: 1px solid #000; padding: 6px 12px; cursor: pointer; border-radius: 6px; background-color: #fff; color: #000; transition: 0.3s; }
    .admin-info div:hover { background-color: #000; color: #fff; }

    /* 메인 레이아웃 */
    .main-content { display: flex; gap: 30px; padding: 20px 40px; }

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
    .menu-item:hover { background-color: #2c5282; color: #fff; }
    .menu-item.active { background-color: #2c5282; color: #fff; }

    /* 콘텐츠 */
    .content { flex: 1; }

    .page-title { font-size: 24px; font-weight: bold; margin-bottom: 20px; }
    .form-group { margin-bottom: 20px; }
    .form-group label { display: block; margin-bottom: 8px; font-weight: bold; }
    .form-group input[type="text"], .form-group textarea { width: 100%; padding: 12px; border: 1px solid #ccc; border-radius: 6px; font-size: 16px; }
    .form-group textarea { resize: vertical; min-height: 200px; }

    .button-group { text-align: center; margin-top: 20px; }
    .btn { padding: 10px 20px; border: 2px solid #2c5282; background-color: #2c5282; color: #fff; border-radius: 6px; cursor: pointer; transition: 0.3s; margin: 0 5px; }
    .btn:hover { background-color: #fff; color: #2c5282; }
    .btn-cancel { background-color: #fff; color: #2c5282; }

    .error-message { background-color: #f8d7da; color: #721c24; padding: 15px; border: 1px solid #f5c6cb; margin: 20px 0; text-align: center; border-radius: 6px; }
    .success-message { background-color: #d4edda; color: #155724; padding: 15px; border: 1px solid #c3e6cb; margin: 20px 0; text-align: center; border-radius: 6px; }

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
            <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/bookManage'">도서 관리</div>
            <div class="menu-item" onclick="location.href='${pageContext.request.contextPath}/admin/rentalManage'">대여 관리</div>
        </div>

        <div class="content">
            <div class="page-title">공지사항 작성</div>

            <c:if test="${not empty errorMsg}">
                <div class="error-message">${errorMsg}</div>
            </c:if>

            <c:if test="${not empty successMsg}">
                <div class="success-message">${successMsg}</div>
            </c:if>

            <form action="${pageContext.request.contextPath}/notice/write" method="post">
                <div class="form-group">
                    <label for="noticeSubject">제목 <span style="color:red;">*</span></label>
                    <input type="text" id="noticeSubject" name="noticeSubject" placeholder="공지사항 제목 입력" required maxlength="200" value="${param.noticeSubject}">
                </div>

                <div class="form-group">
                    <label for="noticeContent">내용 <span style="color:red;">*</span></label>
                    <textarea id="noticeContent" name="noticeContent" placeholder="공지사항 내용을 입력" required>${param.noticeContent}</textarea>
                </div>

                <div class="form-group">
                    <label for="noticeWriter">작성자</label>
                    <input type="text" id="noticeWriter" name="noticeWriter" value="admin" readonly style="background-color: #f8f9fa;">
                </div>

                <div class="button-group">
                    <button type="submit" class="btn">작성 완료</button>
                    <button type="button" class="btn btn-cancel" onclick="history.back()">취소</button>
                </div>
            </form>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
</div>

<script>
document.querySelector('form').addEventListener('submit', function(e){
    const subject = document.getElementById('noticeSubject').value.trim();
    const content = document.getElementById('noticeContent').value.trim();
    if (!subject) { alert('제목을 입력해주세요.'); document.getElementById('noticeSubject').focus(); e.preventDefault(); return; }
    if (!content) { alert('내용을 입력해주세요.'); document.getElementById('noticeContent').focus(); e.preventDefault(); return; }
    if (!confirm('공지사항을 작성하시겠습니까?')) { e.preventDefault(); }
});
</script>
</body>
</html>
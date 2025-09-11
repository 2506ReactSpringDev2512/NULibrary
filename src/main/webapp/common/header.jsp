<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 상단 유틸리티 바 -->
<div class="top-utility">
    <div class="utility-content">
        <div class="utility-left">
            <span><i class="fas fa-phone"></i> 대표전화: 02-1234-5678</span>
            <span>|</span>
            <span><i class="fas fa-envelope"></i> library@nu.ac.kr</span>
        </div>
        <div class="social-links">
            <a href="#" onclick="alert('Facebook 페이지로 이동합니다')" title="Facebook">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" onclick="alert('Instagram 페이지로 이동합니다')" title="Instagram">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="#" onclick="alert('YouTube 채널로 이동합니다')" title="YouTube">
                <i class="fab fa-youtube"></i>
            </a>
            <a href="#" onclick="alert('네이버 블로그로 이동합니다')" title="Naver Blog">
                <i class="fas fa-blog"></i>
            </a>
            <a href="#" onclick="alert('카카오톡 채널로 이동합니다')" title="KakaoTalk">
                <i class="fas fa-comment"></i>
            </a>
        </div>
    </div>
</div>

<!-- 헤더 -->
<div class="header">
    <div class="logo" onclick="location.href='${pageContext.request.contextPath}/main'">
        <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
        <div class="logo-text">
            <div class="logo-title">NU 대학교 중앙도서관</div>
            <div class="logo-subtitle">지식의 보고, 학습의 동반자</div>
        </div>
    </div>
    <div class="user-menu">
        <c:choose>
            <c:when test="${not empty loginUser}">
                <!-- 로그인 상태 -->
                <div onclick="location.href='${pageContext.request.contextPath}/member/update'">${loginUser}님</div>
                <div onclick="location.href='${pageContext.request.contextPath}/member/myRentals'">내 대여현황</div>
                <div onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</div>
            </c:when>
            <c:otherwise>
                <!-- 비로그인 상태 -->
                <div onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인</div>
                <div onclick="location.href='${pageContext.request.contextPath}/member/join'">회원가입</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- 메인 네비게이션 -->
<nav class="main-nav">
    <div class="nav-content">
        <div class="nav-item" onclick="location.href='${pageContext.request.contextPath}/book/search'">
            <i class="fas fa-search nav-icon"></i>
            <span>자료검색</span>
        </div>
        <div class="nav-item" onclick="location.href='${pageContext.request.contextPath}/book/bookList'">
            <i class="fas fa-book nav-icon"></i>
            <span>도서목록</span>
        </div>
        <div class="nav-item" onclick="location.href='${pageContext.request.contextPath}/notice/list'">
            <i class="fas fa-bullhorn nav-icon"></i>
            <span>공지사항</span>
        </div>
        <div class="nav-item" onclick="checkLogin('${pageContext.request.contextPath}/member/myRentals')">
            <i class="fas fa-book-open nav-icon"></i>
            <span>내 대여현황</span>
        </div>
        <div class="nav-item" onclick="checkLogin('${pageContext.request.contextPath}/member/update')">
            <i class="fas fa-user nav-icon"></i>
            <span>마이페이지</span>
        </div>
    </div>
</nav>

<script>
function checkLogin(url) {
    <c:choose>
        <c:when test="${not empty loginUser}">
            location.href = url;
        </c:when>
        <c:otherwise>
            alert('로그인이 필요한 서비스입니다.');
            location.href = '${pageContext.request.contextPath}/member/login';
        </c:otherwise>
    </c:choose>
}
</script>
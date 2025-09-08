<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.library.model.service.NoticeService" %>
<%@ page import="com.library.model.vo.NoticeVO" %>
<%@ page import="java.util.List" %>
<%
    // 최근 공지사항 조회
    NoticeService noticeService = new NoticeService();
    List<NoticeVO> recentNotices = noticeService.getRecentNotices(4);
    request.setAttribute("recentNotices", recentNotices);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서관 메인페이지</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
</head>
<body>
    <div class="container">
        <!-- 헤더 -->
        <div class="header">
            <div class="logo" onclick="location.href='index.jsp'">
                <img src="<%= request.getContextPath() %>/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="user-menu">
                <%
                    // 세션에서 로그인 정보 확인
                    String loginUser = (String)session.getAttribute("loginUser");
                    if(loginUser != null) {
                %>
                    <!-- 로그인 상태 -->
                    <div onclick="location.href='member/update'"><%=loginUser%>님</div>
                    <div onclick="location.href='member/myRentals.jsp'">내 대여현황</div>
                    <div onclick="location.href='member/logout'">로그아웃</div>
                <%
                    } else {
                %>
                    <!-- 비로그인 상태 -->
                    <div onclick="location.href='member/login'">로그인</div>
                    <div onclick="location.href='member/join.jsp'">회원가입</div>
                <%
                    }
                %>
            </div>
        </div>
        
        <!-- 성공 메시지 표시 -->
        <%
            String successMsg = (String)session.getAttribute("successMsg");
            if(successMsg != null) {
                // 메시지 표시 후 세션에서 제거 (한 번만 표시되도록)
                session.removeAttribute("successMsg");
        %>
        <div id="successMessage" style="background-color: #d4edda; color: #155724; padding: 15px; border: 1px solid #c3e6cb; margin: 20px; text-align: center;">
            <%= successMsg %>
        </div>
        <script>
            setTimeout(function() {
                var msg = document.getElementById('successMessage');
                if(msg) {
                    msg.style.display = 'none';
                }
            }, 2000);
        </script>
        <%
            }
        %>
        
        <!-- 검색 영역 -->
        <div class="search-section">
            <div class="search-title">도서 검색</div>
            <form action="book/search" method="get">
                <div class="search-box">
                    <input type="text" name="keyword" class="search-input" placeholder="도서명, 저자, 출판사를 입력하세요">
                    <button type="submit" class="search-btn">검색</button>
                </div>
                <div class="search-options">
                    <div><input type="radio" name="searchType" value="all" checked> 전체</div>
                    <div><input type="radio" name="searchType" value="title"> 도서명</div>
                    <div><input type="radio" name="searchType" value="author"> 저자</div>
                    <div><input type="radio" name="searchType" value="publisher"> 출판사</div>
                </div>
            </form>
        </div>
        
        <!-- 메인 컨텐츠 -->
        <div class="main-content">
            <!-- 왼쪽 사이드바 -->
            <div class="sidebar">
                <!-- 로그인 영역 -->
                <%
                    if(loginUser == null) {
                %>
                <div class="login-section">
                    <div class="sidebar-title">로그인</div>
                    <form class="login-form" action="member/login" method="post">
                        <input type="text" name="userId" placeholder="아이디" style="width: 100%; padding: 8px; margin-bottom: 8px; border: 1px solid #666;" required>
                        <input type="password" name="password" placeholder="비밀번호" style="width: 100%; padding: 8px; margin-bottom: 10px; border: 1px solid #666;" required>
                        <button type="submit" style="width: 100%; padding: 10px; border: 1px solid #666; background-color: white; cursor: pointer;">로그인</button>
                    </form>
                    <div style="text-align: center; margin-top: 10px; font-size: 12px;">
                        <a href="member/join.jsp" style="text-decoration: none; color: #666;">회원가입</a> | 
                        <a href="member/findPassword" style="text-decoration: none; color: #666;">비밀번호 찾기</a>
                    </div>
                </div>
                <%
                    } else {
                %>
                <!-- 로그인 후 사용자 메뉴 -->
                <div class="login-section">
                    <div class="sidebar-title"><%=loginUser%>님 환영합니다</div>
                    <div class="menu-item" onclick="location.href='member/update'">개인정보 수정</div>
                    <div class="menu-item" onclick="location.href='member/myRentals.jsp'">내 대여현황</div>
                    <div class="menu-item" onclick="location.href='member/logout'">로그아웃</div>
                </div>
                <%
                    }
                %>
                
                <!-- 도서 카테고리 -->
                <div style="margin-top: 30px;">
                    <div class="sidebar-title">도서 카테고리</div>
                    <div class="menu-item" onclick="searchByCategory('소설')" style="padding-left: 25%;">소설 / 문학</div>
                    <div class="menu-item" onclick="searchByCategory('인문')" style="padding-left: 25%;">인문 / 사회</div>
                    <div class="menu-item" onclick="searchByCategory('과학')" style="padding-left: 20%;">자연과학 / 기술</div>
                    <div class="menu-item" onclick="searchByCategory('예술')" style="padding-left: 25%;">예술 / 취미</div>
                    <div class="menu-item" onclick="searchByCategory('아동')" style="padding-left: 20%;">아동 / 청소년</div>
                </div>
            </div>
            
            <!-- 중앙 콘텐츠 -->
            <div class="content">
                <!-- 인기 도서 섹션 -->
                <div class="section">
                    <div class="section-title">인기 도서</div>
                    <div class="book-grid">
                        <div class="book-item" onclick="location.href='book/detail?bookId=1'">
                            <div>도서 이미지</div>
                            <div>Java 프로그래밍</div>
                            <div>김자바</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=2'">
                            <div>도서 이미지</div>
                            <div>웹 개발 완전정복</div>
                            <div>박웹개발</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=3'">
                            <div>도서 이미지</div>
                            <div>데이터베이스 설계</div>
                            <div>이디비</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=4'">
                            <div>도서 이미지</div>
                            <div>알고리즘 기초</div>
                            <div>최알고</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=5'">
                            <div>도서 이미지</div>
                            <div>HTML/CSS 기초</div>
                            <div>홍HTML</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=6'">
                            <div>도서 이미지</div>
                            <div>JavaScript 완벽가이드</div>
                            <div>정자바스크립트</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=7'">
                            <div>도서 이미지</div>
                            <div>Python 데이터분석</div>
                            <div>이파이썬</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=8'">
                            <div>도서 이미지</div>
                            <div>AI 프로그래밍</div>
                            <div>박AI</div>
                        </div>
                    </div>
                </div>
                
                <!-- 신간 도서 섹션 -->
                <div class="section">
                    <div class="section-title">신간 도서</div>
                    <div class="book-grid">
                        <div class="book-item" onclick="location.href='book/detail?bookId=9'">
                            <div>도서 이미지</div>
                            <div>Spring Boot 실전</div>
                            <div>김스프링</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=10'">
                            <div>도서 이미지</div>
                            <div>React 개발 가이드</div>
                            <div>박리액트</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=11'">
                            <div>도서 이미지</div>
                            <div>머신러닝 입문</div>
                            <div>이머신</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=12'">
                            <div>도서 이미지</div>
                            <div>클라우드 컴퓨팅</div>
                            <div>최클라우드</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=13'">
                            <div>도서 이미지</div>
                            <div>Docker & Kubernetes</div>
                            <div>도커킴</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=14'">
                            <div>도서 이미지</div>
                            <div>Vue.js 시작하기</div>
                            <div>뷰개발자</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=15'">
                            <div>도서 이미지</div>
                            <div>블록체인 개발</div>
                            <div>블록체인박</div>
                        </div>
                        <div class="book-item" onclick="location.href='book/detail?bookId=16'">
                            <div>도서 이미지</div>
                            <div>모바일 앱 개발</div>
                            <div>모바일이</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 우측 사이드바 -->
            <div class="right-sidebar">
                <!-- 통계 정보 -->
                <div class="widget">
                    <div class="widget-title">도서관 현황</div>
                    <%
                    // 실제로는 서블릿에서 DB 통계를 가져와야 함
                    int totalBooks = 12543;
                    int availableBooks = 9821;
                    int rentedBooks = 2722;
                    int totalMembers = 1456;
                    %>
                    <div class="stats-item">
                        <span>전체 도서</span>
                        <span><%=String.format("%,d", totalBooks)%>권</span>
                    </div>
                    <div class="stats-item">
                        <span>대여 가능</span>
                        <span><%=String.format("%,d", availableBooks)%>권</span>
                    </div>
                    <div class="stats-item">
                        <span>대여 중</span>
                        <span><%=String.format("%,d", rentedBooks)%>권</span>
                    </div>
                    <div class="stats-item">
                        <span>등록 회원</span>
                        <span><%=String.format("%,d", totalMembers)%>명</span>
                    </div>
                </div>
                
                <!-- 공지사항 위젯 (DB 연동) -->
                <div class="widget">
    <div class="widget-title" onclick="location.href='notice/list'">공지사항</div>
    <c:choose>
        <c:when test="${not empty recentNotices}">
            <c:forEach items="${recentNotices}" var="notice">
                <div class="notice-item" onclick="location.href='notice/detail?noticeNo=${notice.noticeNo}'">
                    <span class="notice-title">
                        <c:choose>
                            <c:when test="${fn:length(notice.noticeSubject) > 15}">
                                ${fn:substring(notice.noticeSubject, 0, 15)}...
                            </c:when>
                            <c:otherwise>
                                ${notice.noticeSubject}
                            </c:otherwise>
                        </c:choose>
                    </span>
                    <span class="notice-date">${notice.shortDate}</span>
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="notice-item">
                <span class="notice-title">등록된 공지사항이 없습니다</span>
                <span class="notice-date">--</span>
            </div>
        </c:otherwise>
    </c:choose>
</div>
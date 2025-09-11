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
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <div class="container">
        <!-- 헤더 -->
        <div class="header">
            <div class="logo" onclick="location.href='/main'">
                <img src="${pageContext.request.contextPath}/image/logo.png" alt="도서관 로고" style="height: 60px; width:100px; border: none; outline: none;">
            </div>
            <div class="user-menu">
                <c:choose>
                    <c:when test="${not empty loginUser}">
                        <!-- 로그인 상태 -->
                        <div onclick="location.href='member/update'">${loginUser}님</div>
                        <div onclick="location.href='member/myRentals'">내 대여현황</div>
                        <div onclick="location.href='member/logout'">로그아웃</div>
                    </c:when>
                    <c:otherwise>
                        <!-- 비로그인 상태 -->
                        <div onclick="location.href='member/login'">로그인</div>
                        <div onclick="location.href='member/join'">회원가입</div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <!-- 성공 메시지 표시 -->
        <c:if test="${not empty successMsg}">
            <div id="successMessage" style="background-color: #d4edda; color: #155724; padding: 15px; border: 1px solid #c3e6cb; margin: 20px; text-align: center;">
                ${successMsg}
            </div>
            <script>
                setTimeout(function() {
                    var msg = document.getElementById('successMessage');
                    if(msg) {
                        msg.style.display = 'none';
                    }
                }, 2000);
            </script>
            <c:remove var="successMsg" scope="session" />
        </c:if>
        
        <!-- 검색 영역 -->
        <div class="search-section">
            <div class="search-title">도서 검색</div>
            <form action="book/search" method="get">
                <div class="search-box">
                    <input type="text" name="keyword" class="search-input" placeholder="도서명, 저자, 출판사를 입력하세요">
                    <button type="submit" class="search-btn">통합검색</button>
                </div>
            </form>
        </div>
        
        <!-- 메인 컨텐츠 -->
        <div class="main-content">
            <!-- 왼쪽 사이드바 -->
            <div class="sidebar">
                <!-- 로그인 영역 -->
                <c:choose>
                    <c:when test="${empty loginUser}">
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
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인 후 사용자 메뉴 -->
                        <div class="login-section">
                            <div class="sidebar-title">${loginUser}님 환영합니다</div>
                            <div class="menu-item" onclick="location.href='member/update'">개인정보 수정</div>
                            <div class="menu-item" onclick="location.href='member/myRentals'">내 대여현황</div>
                            <div class="menu-item" onclick="location.href='member/logout'">로그아웃</div>
                        </div>
                    </c:otherwise>
                </c:choose>
                
                <!-- 도서 카테고리 -->
                <div style="margin-top: 30px;">
                    <div class="sidebar-title" onclick="location.href='book/bookList'" style=cursor:pointer;>도서 카테고리</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('소설/문학')" style="padding-left: 25%;">소설 / 문학</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('인문/사회')" style="padding-left: 25%;">인문 / 사회</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('자연과학/기술')" style="padding-left: 20%;">자연과학 / 기술</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('예술/취미')" style="padding-left: 25%;">예술 / 취미</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('아동/청소년')" style="padding-left: 20%;">아동 / 청소년</div>
                </div>
            </div>
            
            <!-- 중앙 콘텐츠 -->
            <div class="content">
                <!-- 인기 도서 섹션 -->
                <div class="section">
                <div class="section-title">인기 도서</div>
                <div class="book-grid">
                    <c:forEach var="book" items="${bookPopularList}" varStatus="status">
                        <c:if test="${status.index < 8}">
                            <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bookNo=${book.bookNo}'" style="cursor:pointer;">
                                <div class="book-image">
                                    <img src="${pageContext.request.contextPath}/image/book/popular/${book.bookNo}.jpg" alt="이미지">
                                </div>
                                <div class="book-info">
                                    <div>${book.bookName}</div>
                                    <div>${book.bookAuthor}</div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                </div>
                
                <!-- 신간 도서 섹션 -->
                <div class="section">
                    <div class="section-title">신간 도서</div>
                    <div class="book-grid">
                        <c:forEach var="book" items="${bookNewList}" varStatus="status">
                            <c:if test="${status.index < 8}">
                                <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bookNo=${book.bookNo}'" style="cursor:pointer;">
                                    <div class="book-image">
                                        <img src="${pageContext.request.contextPath}/image/book/new/${book.bookNo}.jpg" alt="이미지">
                                    </div>
                                    <div class="book-info">
                                        <div>${book.bookName}</div>
                                        <div>${book.bookAuthor}</div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>    
                    </div>
                </div>
            </div>
            
            <!-- 우측 사이드바 -->
            <div class="right-sidebar">
                <!-- 통계 정보 -->
                <div class="widget">
                    <div class="widget-title">도서관 현황</div>
                    <div class="stats-item">
                        <span>전체 도서</span>
                        <span>${totalBookCount}권</span>
                    </div>
                    <div class="stats-item">
                        <span>대여 가능</span>
                        <span>${availableBookCount}권</span>
                    </div>
                    <div class="stats-item">
                        <span>대여 중</span>
                        <span>${rentedBookCount}권</span>
                    </div>
                    <div class="stats-item">
                        <span>등록 회원</span>
                        <span>${totalMemberCount}명</span>
                    </div>
                </div>
                
                <!-- 공지사항 위젯 (DB 연동) -->
                <div class="widget">
		    <div class="widget-title" onclick="location.href='notice/list'" style=cursor:pointer;>공지사항</div>
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
	</body>
</html>
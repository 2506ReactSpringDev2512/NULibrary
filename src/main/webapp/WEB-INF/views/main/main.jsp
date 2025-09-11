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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
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
            <div class="logo" onclick="location.href='/main'">
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
        
        <!-- 메인 네비게이션 -->
        <nav class="main-nav">
            <div class="nav-content">
                <div class="nav-item" onclick="location.href='book/search'">
                    <i class="fas fa-search nav-icon"></i>
                    <span>자료검색</span>
                </div>
                <div class="nav-item" onclick="location.href='book/bookList'">
                    <i class="fas fa-book nav-icon"></i>
                    <span>도서목록</span>
                </div>
                <div class="nav-item" onclick="location.href='notice/list'">
                    <i class="fas fa-bullhorn nav-icon"></i>
                    <span>공지사항</span>
                </div>
                <div class="nav-item" onclick="checkLogin('member/myRentals')">
                    <i class="fas fa-book-open nav-icon"></i>
                    <span>내 대여현황</span>
                </div>
                <div class="nav-item" onclick="checkLogin('member/update')">
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
                    location.href = 'member/login';
                </c:otherwise>
            </c:choose>
        }
        
        function initializeAll() {
            const popularBooks = document.querySelectorAll('#popularBooks .book-item');
            const newBooks = document.querySelectorAll('#newBooks .book-item');
            
            if (popularBooks.length > 0) {
                initializePopular();
            }
            if (newBooks.length > 0) {
                initializeNew();
            }
        }
        
        let popularCurrentPage = 0;
        let newCurrentPage = 0;
        let popularTotalPages = 0;
        let newTotalPages = 0;
        
        function initializePopular() {
            const books = document.querySelectorAll('#popularBooks .book-item');
            popularTotalPages = Math.ceil(books.length / 2);
            popularCurrentPage = 0;
            
            showPopularPage(0);
            updatePopularButtons();
        }
        
        function initializeNew() {
            const books = document.querySelectorAll('#newBooks .book-item');
            newTotalPages = Math.ceil(books.length / 2);
            newCurrentPage = 0;
            
            showNewPage(0);
            updateNewButtons();
        }
        
        function changePopularPage(direction) {
            if (direction === 'prev') {
                if (popularCurrentPage > 0) {
                    popularCurrentPage--;
                }
            } else if (direction === 'next') {
                if (popularCurrentPage < popularTotalPages - 1) {
                    popularCurrentPage++;
                }
            }
            
            showPopularPage(popularCurrentPage);
            updatePopularButtons();
        }
        
        function changeNewPage(direction) {
            if (direction === 'prev') {
                if (newCurrentPage > 0) {
                    newCurrentPage--;
                }
            } else if (direction === 'next') {
                if (newCurrentPage < newTotalPages - 1) {
                    newCurrentPage++;
                }
            }
            
            showNewPage(newCurrentPage);
            updateNewButtons();
        }
        
        function showPopularPage(pageIndex) {
            const books = document.querySelectorAll('#popularBooks .book-item');
            
            books.forEach(book => book.style.display = 'none');
            
            const startIndex = pageIndex * 2;
            const endIndex = Math.min(startIndex + 2, books.length);
            
            for (let i = startIndex; i < endIndex; i++) {
                if (books[i]) {
                    books[i].style.display = 'block';
                }
            }
        }
        
        function showNewPage(pageIndex) {
            const books = document.querySelectorAll('#newBooks .book-item');
            
            books.forEach(book => book.style.display = 'none');
            
            const startIndex = pageIndex * 2;
            const endIndex = Math.min(startIndex + 2, books.length);
            
            for (let i = startIndex; i < endIndex; i++) {
                if (books[i]) {
                    books[i].style.display = 'block';
                }
            }
        }
        
        function updatePopularButtons() {
            const prevBtn = document.getElementById('popularPrev');
            const nextBtn = document.getElementById('popularNext');
            
            if (prevBtn) prevBtn.disabled = (popularCurrentPage === 0);
            if (nextBtn) nextBtn.disabled = (popularCurrentPage === popularTotalPages - 1);
        }
        
        function updateNewButtons() {
            const prevBtn = document.getElementById('newPrev');
            const nextBtn = document.getElementById('newNext');
            
            if (prevBtn) prevBtn.disabled = (newCurrentPage === 0);
            if (nextBtn) nextBtn.disabled = (newCurrentPage === newTotalPages - 1);
        }
        
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(initializeAll, 1000);
        });
        
        window.addEventListener('load', function() {
            setTimeout(initializeAll, 500);
        });
        
        </script>
        
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
            <div class="search-title">도서관에서 찾고 싶은 책이 있나요?</div>
            <div class="search-subtitle">수만 권의 도서 중에서 원하는 책을 쉽고 빠르게 찾아보세요</div>
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
                                <input type="text" name="userId" placeholder="아이디" required>
                                <input type="password" name="password" placeholder="비밀번호" required>
                                <button type="submit">로그인</button>
                            </form>
                            <div style="text-align: center; margin-top: 10px; font-size: 12px;">
                                <a href="member/join" style="text-decoration: none; color: #666;">회원가입</a> | 
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
                <div style="margin-top: 50px;">
                    <div class="sidebar-title" onclick="location.href='book/bookList'" style="cursor:pointer;">도서 카테고리</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('소설/문학')">소설 / 문학</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('인문/사회')">인문 / 사회</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('자연과학/기술')">자연과학 / 기술</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('예술/취미')">예술 / 취미</div>
                    <div class="menu-item" onclick="location.href='book/bookList?category=' + encodeURIComponent('아동/청소년')">아동 / 청소년</div>
                </div>
            </div>
            
            <!-- 중앙 콘텐츠 -->
            <div class="content">
                <!-- 인기 도서 섹션 -->
                <div class="section">
                    <div class="section-header">
                        <div class="section-title">인기 도서</div>
                    </div>
                    <div class="book-grid-container">
                        <div class="book-grid" id="popularBooks">
                            <c:forEach var="book" items="${bookPopularList}" varStatus="status">
                                <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bookNo=${book.bookNo}'" style="cursor:pointer;">
                                    <div class="book-image">
                                        <img src="${pageContext.request.contextPath}/image/book/popular/${book.bookNo}.jpg" alt="이미지">
                                    </div>
                                    <div class="book-info">
                                        <div>${book.bookName}</div>
                                        <div>${book.bookAuthor}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="pagination-arrows" id="popularArrows">
                            <button class="arrow-btn prev" id="popularPrev" onclick="changePopularPage('prev')">‹</button>
                            <button class="arrow-btn next" id="popularNext" onclick="changePopularPage('next')">›</button>
                        </div>
                    </div>
                </div>
                
                <!-- 신간 도서 섹션 -->
                <div class="section">
                    <div class="section-header">
                        <div class="section-title">신간 도서</div>
                    </div>
                    <div class="book-grid-container">
                        <div class="book-grid" id="newBooks">
                            <c:forEach var="book" items="${bookNewList}" varStatus="status">
                                <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bookNo=${book.bookNo}'" style="cursor:pointer;">
                                    <div class="book-image">
                                        <img src="${pageContext.request.contextPath}/image/book/new/${book.bookNo}.jpg" alt="이미지">
                                    </div>
                                    <div class="book-info">
                                        <div>${book.bookName}</div>
                                        <div>${book.bookAuthor}</div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="pagination-arrows" id="newArrows">
                            <button class="arrow-btn prev" id="newPrev" onclick="changeNewPage('prev')">‹</button>
                            <button class="arrow-btn next" id="newNext" onclick="changeNewPage('next')">›</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 우측 사이드바 -->
            <div class="right-sidebar">
                <!-- 통계 정보 -->
                <div class="widget">
                    <div class="widget-title"><i class="fas fa-chart-bar"></i> 도서관 현황</div>
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
		    <div class="widget-title" onclick="location.href='notice/list'" style="cursor:pointer;">공지사항</div>
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
	    </div>
	</div>
	
	<!-- 푸터 -->
	<footer class="footer">
	    <div class="footer-content">
	        <div class="footer-section">
	            <h3>도서관 정보</h3>
	            <div class="footer-info">
	                <p><strong>NU 대학교 중앙도서관</strong></p>
	                <p><i class="fas fa-map-marker-alt"></i> 서울특별시 중구 남대문로 120</p>
	                <p><i class="fas fa-phone"></i> 대표전화: 02-1234-5678</p>
	                <p><i class="fas fa-phone"></i> 대출반납: 02-1234-5679</p>
	                <p><i class="fas fa-phone"></i> 자료문의: 02-1234-5680</p>
	                <p><i class="fas fa-fax"></i> 팩스: 02-1234-5681</p>
	                <p><i class="fas fa-envelope"></i> library@nu.ac.kr</p>
	                <p><i class="fas fa-globe"></i> www.nu.ac.kr/library</p>
	            </div>
	        </div>
	        
	        <div class="footer-section">
	            <h3>운영시간 및 층별안내</h3>
	            <div class="footer-hours">
	                <p><strong><i class="fas fa-clock"></i> 운영시간</strong></p>
	                <p><span>평일</span> 09:00 ~ 22:00</p>
	                <p><span>토요일</span> 09:00 ~ 18:00</p>
	                <p><span>일요일</span> 10:00 ~ 17:00</p>
	                <p><span>공휴일</span> 휴관</p>
	                <br>
	                <p><strong><i class="fas fa-building"></i> 층별 안내</strong></p>
	                <p><span>1층</span> 대출반납·정보검색</p>
	                <p><span>2층</span> 일반도서·열람실</p>
	                <p><span>3층</span> 참고도서·연구실</p>
	            </div>
	        </div>
	        
	        <div class="footer-section">
	            <h3>도서관 서비스</h3>
	            <ul class="footer-services">
	                <li><a href="javascript:checkLogin('member/myRentals')"><i class="fas fa-book-open"></i> 내 대여현황</a></li>
	                <li><a href="javascript:checkLogin('member/update')"><i class="fas fa-user"></i> 마이페이지</a></li>
	                <li><a href="book/search"><i class="fas fa-search"></i> 통합검색</a></li>
	                <li><a href="book/bookList"><i class="fas fa-book"></i> 전체도서</a></li>
	                <li><a href="notice/list"><i class="fas fa-bullhorn"></i> 공지사항</a></li>
	                <li><a href="member/join"><i class="fas fa-user-plus"></i> 회원가입</a></li>
	                <li><a href="admin/login"><i class="fas fa-cogs"></i> 관리자 로그인</a></li>
	            </ul>
	        </div>
	        
	        <div class="footer-section">
	            <h3>이용안내 및 규정</h3>
	            <ul class="footer-links">
	                <li><a href="#" onclick="alert('도서 대출: 학부생 5권 14일, 대학원생 10권 30일')"><i class="fas fa-clipboard-list"></i> 대출규정</a></li>
	                <li><a href="#" onclick="alert('연체료: 1일 1권당 100원 분실시: 도서 정가의 3배 변상')"><i class="fas fa-dollar-sign"></i> 연체 및 분실</a></li>
	                <li><a href="#" onclick="alert('예약: 대출중인 도서 온라인 예약 가능 예약순서에 따라 대출 안내')"><i class="fas fa-calendar"></i> 예약서비스</a></li>
	                <li><a href="#" onclick="alert('타기관 이용: 타 대학 도서관 이용증 발급 상호대차 서비스 제공')"><i class="fas fa-handshake"></i> 상호대차</a></li>
	                <li><a href="#" onclick="alert('디지털 자료: 전자책, 논문DB 이용 캠퍼스 내에서 무료 접근')"><i class="fas fa-laptop"></i> 디지털자료</a></li>
	                <li><a href="#" onclick="alert('스터디룸: 2-8인실 온라인 예약 이용시간: 2시간 (연장 1회 가능)')"><i class="fas fa-door-open"></i> 시설예약</a></li>
	                <li><a href="#" onclick="alert('도서 구입 신청: 온라인으로 희망도서 신청 월 1회 구입위원회 심의 후 구입')"><i class="fas fa-edit"></i> 희망도서신청</a></li>
	            </ul>
	        </div>
	        
	        <div class="footer-section">
	            <h3>학술정보 및 서비스</h3>
	            <ul class="footer-links">
	                <li><a href="#" onclick="alert('국내 논문DB - KISS, DBpia, 교보스콜라 등')"><i class="fas fa-chart-bar"></i> 국내 논문DB</a></li>
	                <li><a href="#" onclick="alert('해외 논문DB - IEEE, ACM, ScienceDirect 등')"><i class="fas fa-globe"></i> 해외 논문DB</a></li>
	                <li><a href="#" onclick="alert('전자책 서비스 - 교보문고, 예스24 등 3만여 권')"><i class="fas fa-tablet"></i> 전자책</a></li>
	                <li><a href="#" onclick="alert('원문복사 서비스 - 타기관 자료 복사 신청 - 일반 500원/페이지')"><i class="fas fa-copy"></i> 원문복사</a></li>
	                <li><a href="#" onclick="alert('논문 작성 가이드 - 인용법, 표절 방지 - 연구윤리 교육자료')"><i class="fas fa-pen"></i> 논문작성가이드</a></li>
	                <li><a href="#" onclick="alert('도서관 이용교육 - 신입생 대상 - DB 이용법 특강')"><i class="fas fa-graduation-cap"></i> 이용자교육</a></li>
	            </ul>
	        </div>
	    </div>
	    
	    <div class="footer-bottom">
	        <div class="footer-bottom-content">
	            <div class="footer-policies">
	                <a href="member/join">회원가입</a>
	                <span>|</span>
	                <a href="book/bookList">전체도서</a>
	                <span>|</span>
	                <a href="notice/list">공지사항</a>
	                <span>|</span>
	                <a href="book/search">도서검색</a>
	            </div>
	            <div class="footer-copyright">
	                <p>© 2025 NU 도서관. All rights reserved.</p>
	                <p>본 사이트의 모든 컨텐츠는 저작권법의 보호를 받습니다.</p>
	            </div>
	        </div>
	    </div>
	</footer>
	
	</body>
</html>
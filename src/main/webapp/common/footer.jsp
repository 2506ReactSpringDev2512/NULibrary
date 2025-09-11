<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <li><a href="javascript:checkLogin('${pageContext.request.contextPath}/member/myRentals')"><i class="fas fa-book-open"></i> 내 대여현황</a></li>
                <li><a href="javascript:checkLogin('${pageContext.request.contextPath}/member/update')"><i class="fas fa-user"></i> 마이페이지</a></li>
                <li><a href="${pageContext.request.contextPath}/book/search"><i class="fas fa-search"></i> 통합검색</a></li>
                <li><a href="${pageContext.request.contextPath}/book/bookList"><i class="fas fa-book"></i> 전체도서</a></li>
                <li><a href="${pageContext.request.contextPath}/notice/list"><i class="fas fa-bullhorn"></i> 공지사항</a></li>
                <li><a href="${pageContext.request.contextPath}/member/join"><i class="fas fa-user-plus"></i> 회원가입</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/login"><i class="fas fa-cogs"></i> 관리자 로그인</a></li>
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
                <a href="${pageContext.request.contextPath}/member/join">회원가입</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/book/bookList">전체도서</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/notice/list">공지사항</a>
                <span>|</span>
                <a href="${pageContext.request.contextPath}/book/search">도서검색</a>
            </div>
            <div class="footer-copyright">
                <p>© 2025 NU 도서관. All rights reserved.</p>
                <p>본 사이트의 모든 컨텐츠는 저작권법의 보호를 받습니다.</p>
            </div>
        </div>
    </div>
</footer>
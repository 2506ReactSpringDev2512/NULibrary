<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 회원 관리에서 회원 정보 조회로 변경 -->
    <title>회원 정보 조회 - 관리자</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: Arial, sans-serif; background-color: #f5f5f5; }
        .container { max-width: 1200px; margin: 0 auto; background-color: white; }
        .header { border: 2px solid #333; padding: 20px; background-color: #333; color: white; text-align: center; font-weight: bold; }
        .main-content { display: flex; gap: 20px; padding: 20px; }
        .sidebar { width: 200px; border: 2px solid #333; padding: 20px; }
        .menu-item { border: 1px solid #666; padding: 10px; margin-bottom: 8px; cursor: pointer; }
        .content { flex: 1; }
        .search-box { border: 2px solid #333; padding: 20px; margin-bottom: 20px; }
        .search-input { padding: 10px; border: 1px solid #666; width: 300px; margin-right: 10px; }
        .search-btn { padding: 10px 20px; border: 2px solid #333; background: white; cursor: pointer; }
        .member-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 10px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .action-btn { padding: 5px 10px; border: 1px solid #333; background: white; cursor: pointer; margin: 0 2px; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">회원 정보 조회</div>
        
        <div class="main-content">
            <div class="sidebar">
                <div class="menu-item" onclick="location.href='<%= request.getContextPath() %>/admin/main'">대시보드</div>
                <div class="menu-item" style="background:#f0f0f0;">회원 정보 조회</div>
                <div class="menu-item" onclick="location.href='<%= request.getContextPath() %>/admin/notice'">공지사항 관리</div>
                <div class="menu-item">도서 관리</div>
                <div class="menu-item">대여 관리</div>
            </div>
            
            <div class="content">
                <div class="search-box">
                    <form action="<%= request.getContextPath() %>/admin/memberManage" method="get">
				        <input type="text" name="memberId" class="search-input" placeholder="회원 아이디 검색">
				        <button type="submit" class="search-btn">검색</button>
				    </form>
				</div>
                
                <table class="member-table">
                    <thead>
                    <!-- 테이블에 맞춰서 구성 수정  -->
                        <tr>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>성별</th>
                            <th>나이</th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- memberList 가 비어있을 경우 메세지 출력  -->
                    <c:if test="${empty memberList}">
					    <tr>
					        <td colspan="6">등록된 회원이 없습니다.</td>
					    </tr>
					</c:if>
					<!-- memberList 출력 할 수 있도록 테이블 코드 수정 -->
                    	<c:forEach items="${memberList}" var ="member">
	                        <tr>
	                            <td>${member.memberId }</td>
	                            <td>${member.memberName }</td>
	                            <td>${member.memberPhone }</td>
	                            <td>${member.memberGender }</td>
	                            <td>${member.memberAge }</td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
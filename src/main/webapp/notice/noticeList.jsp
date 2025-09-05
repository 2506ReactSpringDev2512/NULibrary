<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .logo { border: 1px solid #666; padding: 10px 20px; font-weight: bold; }
        .nav-menu div { border: 1px solid #666; padding: 8px 15px; cursor: pointer; }
        .main-content { padding: 30px; }
        .page-title { border: 2px solid #333; padding: 20px; text-align: center; font-size: 24px; font-weight: bold; margin-bottom: 30px; }
        .notice-table { width: 100%; border-collapse: collapse; border: 2px solid #333; }
        th, td { border: 1px solid #666; padding: 12px; text-align: center; }
        th { background-color: #f9f9f9; font-weight: bold; }
        .notice-title { text-align: left; cursor: pointer; }
        .notice-title:hover { text-decoration: underline; }
        .pagination { text-align: center; margin-top: 20px; }
        .pagination div { display: inline-block; border: 1px solid #666; padding: 8px 12px; margin: 0 2px; cursor: pointer; }
        .footer { border: 2px solid #333; padding: 20px; text-align: center; background-color: #f9f9f9; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="logo">도서관 로고</div>
            <div class="nav-menu">
                <div>홈으로</div>
            </div>
        </div>
        
        <div class="main-content">
            <div class="page-title">공지사항</div>
            
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
                    <tr>
                        <td>3</td>
                        <td class="notice-title">도서관 휴관 안내</td>
                        <td>관리자</td>
                        <td>2024-09-02</td>
                        <td>156</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td class="notice-title">신간 도서 입고 안내</td>
                        <td>관리자</td>
                        <td>2024-09-01</td>
                        <td>89</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td class="notice-title">대여 규정 변경 사항</td>
                        <td>관리자</td>
                        <td>2024-08-30</td>
                        <td>234</td>
                    </tr>
                </tbody>
            </table>
            
            <div class="pagination">
                <div>이전</div>
                <div style="background-color: #333; color: white;">1</div>
                <div>2</div>
                <div>3</div>
                <div>다음</div>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
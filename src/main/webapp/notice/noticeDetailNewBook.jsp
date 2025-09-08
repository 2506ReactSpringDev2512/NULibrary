<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 - 도서관</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
        }
        
        .header {
            border: 2px solid #333;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            border: 1px solid #666;
            padding: 10px 20px;
            font-weight: bold;
        }
        
        .nav-menu div {
            border: 1px solid #666;
            padding: 8px 15px;
            cursor: pointer;
        }
        
        .main-content {
            padding: 30px;
        }
        
        .notice-container {
            border: 2px solid #333;
            padding: 30px;
        }
        
        .notice-header {
            border-bottom: 2px solid #ccc;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        
        .notice-title {
            border: 2px solid #333;
            padding: 20px;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        
        .notice-info {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
        }
        
        .notice-content {
            border: 1px solid #666;
            padding: 30px;
            line-height: 1.8;
            min-height: 300px;
        }
        
        .button-section {
            text-align: center;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            border: 2px solid #333;
            background-color: white;
            cursor: pointer;
            font-weight: bold;
            margin: 0 10px;
        }
        
        .footer {
            border: 2px solid #333;
            padding: 20px;
            text-align: center;
            background-color: #f9f9f9;
        }
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
            <div class="notice-container">
                <div class="notice-header">
                    <div class="notice-title">신간 도서 입고 안내</div>
                    <div class="notice-info">
                        <span>작성일: 2024-09-01</span>
                        <span>조회수: 116</span>
                    </div>
                </div>
                
                <div class="notice-content">
                안녕하세요, NU Library입니다.
                <br><br>
				선선한 가을바람과 함께 새로운 도서들이 여러분을 찾아왔습니다.
				이번 9월에도 독서의 계절을 맞아 다양한 분야의 신간이 입고되었습니다.
               	<br><br>
				소설/문학, 인문/사회, 자연과학/기술, 예술/취미, 아동/청소년 등 여러 분야의 책들을 새롭게 만나보실 수 있습니다.
               	<br><br><br><br>
				
				📚 주요 신간 안내
                <br><br>
				
				소설/문학 :  입고 예정 없음<br><br>
				
				인문/사회 : 사피엔스(유발 하라리), 총 균 쇠(재레드 다이아몬드)<br><br>
				
				자연과학/기술 : 프로그래밍 언어론(켄 톰슨), 양자역학 입문(닐스 보어)<br><br>
				
				예술/취미 : 그림으로 보는 음악사(알렉 로스)<br><br>
				
				아동/청소년 : 빨간머리 앤(몽고메리), 그림 형제 동화집(그림 형제)<br><br><br><br>
				
				📍 이용 안내
				<br><br>
				
				신간 도서는 홈페이지 메인 신간 도서부분에서 확인하실 수 있습니다.<br><br>
				
				대출 및 예약은 기존과 동일하게 진행됩니다.<br><br>
				
				여러분의 많은 관심과 이용 바랍니다.<br><br><br>
				감사합니다.<br>
                    
                도서관 관리팀
                </div>
                
                <div class="button-section">
                    <button class="btn">목록으로</button>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <div>도서관 정보 | 이용약관 | 개인정보처리방침 | 문의사항</div>
        </div>
    </div>
</body>
</html>
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
                    <div class="notice-title">대여 규정 변경 사항</div>
                    <div class="notice-info">
                        <span>작성일: 2024-08-30</span>
                        <span>조회수: 172</span>
                    </div>
                </div>
                
                <div class="notice-content">
                   안녕하세요, NU Library입니다.
                   <br><br>

					도서관 이용 활성화와 원활한 자료 이용을 위해 도서 대여 규정이 아래와 같이 변경됩니다.
					<br><br>
					
					📚 <strong>변경 내용</strong>
					<br><br>
					
					대출 권수 : 기존 3권 → 5권까지 가능
					<br>
					
					대출 기간 : 기존 7일 → 14일로 연장
					<br>
					
					연장 신청 : 1회 가능 (연장 시 7일 추가)
					<br>
					
					연체 시 불이익 : 연체 일수만큼 대출 정지
					<br><br>
					
					📅<strong> 시행일</strong> : 2024년 9월 15일부터 적용
					<br><br><br>
					
					새로운 규정을 통해 더 많은 자료를 여유롭게 이용하시길 바랍니다.
					<br>
					항상 NU Library를 아껴주셔서 감사합니다.
					<br>
					
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
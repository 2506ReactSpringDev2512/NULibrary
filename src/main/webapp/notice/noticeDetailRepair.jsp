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
                    <div class="notice-title">시설 보수 공사 안내</div>
                    <div class="notice-info">
                        <span>작성일: 2024-08-28</span>
                        <span>조회수: 112</span>
                    </div>
                </div>
                
                <div class="notice-content">
                   	안녕하세요, NU Library입니다.
                   	<br><br>

					쾌적하고 안전한 이용 환경을 제공하기 위해 도서관 일부 공간에서 시설 보수 공사가 진행됩니다.
					<br><br>
					
					🛠 <strong>공사 일정</strong>
					<br><br>
					
					<strong>기간</strong> : 2025년 9월 20일(토) ~ 2025년 9월 27일(토)
					<br>
					
					<strong>장소</strong> : 2층 열람실 및 휴게 공간
					<br><br><br>
					
					⚠️ <strong>이용 제한 안내</strong>
					<br><br>
					공사 기간 동안 2층 열람실 이용이 제한됩니다.
					<br>
					1층 및 3층 자료실, 멀티미디어실은 정상 운영됩니다.
					<br>
					소음이 발생할 수 있으니 양해 부탁드립니다.
					<br>
					더 나은 환경을 위해 잠시 불편을 드리는 점 양해 부탁드리며,
					<br>
					앞으로도 이용자 여러분께 편안한 독서 공간을 제공하기 위해 최선을 다하겠습니다.
					<br>
                    감사합니다.
                    <br><br>
                    
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
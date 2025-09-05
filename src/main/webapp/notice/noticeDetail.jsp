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
                    <div class="notice-title">도서관 휴관 안내</div>
                    <div class="notice-info">
                        <span>작성일: 2024-09-02</span>
                        <span>조회수: 156</span>
                    </div>
                </div>
                
                <div class="notice-content">
                    안녕하세요. 도서관 이용자 여러분께 휴관 일정을 안내드립니다.
                    <br><br>
                    
                    <strong>휴관 일정:</strong> 2024년 9월 10일(화) ~ 9월 12일(목)
                    <br><br>
                    
                    <strong>휴관 사유:</strong> 시설 점검 및 도서 정리 작업
                    <br><br>
                    
                    휴관 기간 중에는 도서 대여/반납 서비스가 중단되며, 
                    온라인 도서 검색 서비스는 정상적으로 이용 가능합니다.
                    <br><br>
                    
                    이용에 불편을 드려 죄송하며, 
                    9월 13일(금)부터 정상 운영될 예정입니다.
                    <br><br>
                    
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
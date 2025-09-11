<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서 검색 - NU 대학교 중앙도서관</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { 
            background-color: #ffffff; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .container { 
            width: 100%; 
            margin: 0; 
            background-color: #ffffff; 
            min-height: 100vh; 
        }
        
        .search-section {
            background: linear-gradient(135deg, #2c5282 0%, #3182ce 100%);
            padding: 40px 20px;
            border: none;
        }
        
        .search-container {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
        }
        
        .search-title {
            color: white;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }
        
        .search-box {
            display: flex;
            justify-content: center;
            gap: 0;
            margin-bottom: 20px;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .search-input {
            flex: 1;
            padding: 18px 25px;
            border: none;
            border-radius: 15px 0 0 15px;
            font-size: 16px;
            outline: none;
            background-color: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .search-input::placeholder {
            color: #a0aec0;
        }
        
        .search-btn {
            padding: 18px 30px;
            background: linear-gradient(135deg, #38a169 0%, #48bb78 100%);
            color: white;
            border: none;
            border-radius: 0 15px 15px 0;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        
        .search-btn:hover {
            background: linear-gradient(135deg, #2f855a 0%, #38a169 100%);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
        }
        
        .search-help {
            color: rgba(255, 255, 255, 0.9);
            font-size: 14px;
            margin-top: 15px;
        }
        
        .page-content { 
            padding: 40px 60px; 
            max-width: 1200px; 
            margin: 0 auto; 
            min-height: calc(100vh - 500px);
        }
        
        .result-info {
            background: linear-gradient(135deg, #e6f0ff, #f0f8ff);
            border: 2px solid #2c5282;
            border-radius: 15px;
            padding: 20px 25px;
            margin-bottom: 30px;
            text-align: center;
            font-weight: 600;
            font-size: 18px;
            color: #2c5282;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }
        
        .result-info.error {
            background: linear-gradient(135deg, #fed7d7, #feb2b2);
            border-color: #e53e3e;
            color: #e53e3e;
        }
        
        .book-list {
            border: none;
            padding: 0;
        }
        
        .book-item {
		    display: flex;
		    flex-direction: row; /* 옆으로 배치 */
		    align-items: flex-start;
		    justify-content: flex-start;
		    gap: 20px;
		    flex-wrap: nowrap; /* 줄바꿈 방지 */
		}
        
        .book-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }
        
        .book-image {
            border: 1px solid #e2e8f0;
            width: 120px;
            height: 150px;
            border-radius: 10px;
            overflow: hidden;
            background-color: #f8f9fa;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .book-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .book-info {
		    flex: 1;
		    display: flex;
		    flex-direction: column;
		    gap: 10px;
		    min-width: 0; /* flex 아이템이 부모 영역을 벗어나지 않도록 */
		    word-break: break-word; /* 긴 단어도 줄바꿈 */
		}
        
        .book-title {
            font-weight: 700;
            font-size: 18px;
            color: #2c5282;
            margin: 0;
            padding: 0;
            border: none;
            background: none;
            line-height: 1.3;
            word-break: keep-all;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            height: 48px;
        }
        
        .book-details {
		    display: flex;
		    flex-direction: column;
		    gap: 6px;
		    margin: 0;
		}
        
        .book-details div {
		    display: flex;
		    align-items: center;       /* 수직 가운데 정렬 */
		    gap: 10px;                 /* strong과 span 사이 간격 */
		    padding: 6px 0;
		    border-bottom: 1px solid #e2e8f0;
		    min-height: 32px;
		    line-height: 1.2;
		    overflow: hidden;
		}
        
        .book-details div:last-child {
            border-bottom: none;
        }
        
        .book-details strong {
		    display: flex;
		    align-items: center;       /* 아이콘과 라벨 텍스트 중앙 정렬 */
		    gap: 8px;
		    min-width: 80px;           /* 라벨 너비 고정(정렬 기준) */
		    flex-shrink: 0;
		    font-weight: 600;
		    color: #2c5282;
		    line-height: 1;
		}
		
		.book-details strong i {
		    display: inline-flex;
		    align-items: center;
		    justify-content: center;
		    vertical-align: middle;
		}
        
        .book-details span {
		    flex: 1;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}
        
        .no-results {
            text-align: center;
            padding: 80px 30px;
            color: #718096;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        
        .no-results i {
            font-size: 64px;
            color: #cbd5e0;
        }
        
        .no-results p {
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 10px;
        }
        
        .no-results .sub-text {
            font-size: 14px;
            color: #a0aec0;
        }
        
        /* 반응형 디자인 */
        @media (max-width: 1200px) {
            .page-content {
                padding: 30px 40px;
            }
        }
        
        @media (max-width: 768px) {
            .search-section {
                padding: 30px 15px;
            }
            
            .search-title {
                font-size: 28px;
                margin-bottom: 25px;
            }
            
            .search-box {
                flex-direction: column;
                gap: 15px;
            }
            
            .search-input {
                border-radius: 12px;
            }
            
            .search-btn {
                border-radius: 12px;
                justify-content: center;
            }
            
            .page-content {
                padding: 20px 15px;
            }
            
            .result-info {
                font-size: 16px;
                padding: 15px 20px;
            }
            
            .book-item {
                flex-direction: column;
                gap: 20px;
                padding: 20px;
                min-height: auto;
            }
            
            .book-image {
                width: 100px;
                height: 130px;
                align-self: center;
            }
            
            .book-title {
                font-size: 18px;
                text-align: center;
            }
            
            .no-results {
                padding: 60px 20px;
            }
            
            .no-results i {
                font-size: 48px;
            }
            
            .no-results p {
                font-size: 16px;
            }
        }
        
        @media (max-width: 480px) {
            .search-title {
                font-size: 24px;
                flex-direction: column;
                gap: 10px;
            }
            
            .search-input {
                padding: 15px 20px;
                font-size: 15px;
            }
            
            .search-btn {
                padding: 15px 25px;
                font-size: 15px;
            }
            
            .book-item {
                padding: 15px;
                min-height: auto;
            }
            
            .book-title {
                font-size: 16px;
            }
            
            .book-details div {
                font-size: 13px;
                flex-direction: column;
                align-items: flex-start;
                gap: 5px;
            }
            
            .book-details strong {
                min-width: auto;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="../common/header.jsp" %>
        
        <div class="search-section">
            <div class="search-container">
                <div class="search-title">
                    <i class="fas fa-search"></i>
                    도서 검색
                </div>
                
                <form action="search" method="get">
                    <div class="search-box">
                        <input type="text" name="keyword" class="search-input" value="${keyword}" 
                               placeholder="도서명, 저자, 출판사를 입력하세요">
                        <button type="submit" class="search-btn">
                            <i class="fas fa-search"></i>
                            검색
                        </button>
                    </div>
                    <div class="search-help">
                        원하는 도서의 제목, 저자명, 출판사명으로 검색하실 수 있습니다
                    </div>
                </form>
            </div>
        </div>
        
        <div class="page-content">
            <div class="result-info <c:if test='${not empty errorMsg}'>error</c:if>">
                <c:choose>
                    <c:when test="${not empty errorMsg}">
                        <i class="fas fa-exclamation-triangle"></i>
                        ${errorMsg}
                    </c:when>
                    <c:when test="${not empty keyword}">
                        <i class="fas fa-search"></i>
                        "<strong>${keyword}</strong>" 검색 결과 <strong>${resultCount}건</strong>
                    </c:when>
                    <c:otherwise>
                        <i class="fas fa-info-circle"></i>
                        검색어를 입력해주세요
                    </c:otherwise>
                </c:choose>
            </div>
            
            <div class="book-list">
                <c:choose>
                    <c:when test="${empty searchResults and not empty keyword}">
                        <div class="no-results">
                            <i class="fas fa-search-minus"></i>
                            <p>검색 결과가 없습니다</p>
                            <div class="sub-text">다른 검색어로 다시 시도해보세요</div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="book" items="${searchResults}">
                            <div class="book-item" onclick="location.href='${pageContext.request.contextPath}/book/detail?bookNo=${book.bookNo}'">
                                <div class="book-image">
                                    <img src="${pageContext.request.contextPath}/image/book/all/${book.bookNo}.jpg" 
                                         alt="${book.bookName}">
                                </div>
                                <div class="book-info">
                                    <div class="book-title">${book.bookName}</div>
                                    <div class="book-details">
                                        <div>
                                            <strong><i class="fas fa-user-edit" style="margin-right: 5px;"></i>저자:</strong> 
                                            <span>${book.bookAuthor}</span>
                                        </div>
                                        <div>
                                            <strong><i class="fas fa-building" style="margin-right: 5px;"></i>출판사:</strong> 
                                            <span>${book.bookPublisher}</span>
                                        </div>
                                        <div>
                                            <strong><i class="fas fa-tag" style="margin-right: 5px;"></i>카테고리:</strong> 
                                            <span>${book.bookCategory}</span>
                                        </div>
                                        <div>
                                            <strong><i class="fas fa-barcode" style="margin-right: 5px;"></i>도서번호:</strong> 
                                            <span>${book.bookNo}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <%@ include file="../common/footer.jsp" %>
        
        <script>
            function rentBook(bookNo) {
                alert('도서번호 ' + bookNo + ' 대여 기능은 준비 중입니다.');
            }
        </script>
    </div>
    </body>
</html>
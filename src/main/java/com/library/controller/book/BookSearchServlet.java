package com.library.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.model.service.BookService;
import com.library.model.vo.BookVO;

@WebServlet("/book/search")
public class BookSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String keyword = request.getParameter("keyword");
        
        // 검색어가 없으면 에러 처리
        if (keyword == null || keyword.trim().isEmpty()) {
            request.setAttribute("errorMsg", "검색어를 입력해주세요.");
            request.getRequestDispatcher("/book/bookSearch.jsp").forward(request, response);
            return;
        }
        
        // 검색어 정리
        keyword = keyword.trim();
        
        // 통합검색으로 고정 (searchType 파라미터 제거)
        String searchType = "all";
        
        // 검색 서비스 호출
        BookService bService = new BookService();
        List<BookVO> searchResults = bService.searchBooks(keyword, searchType);
        
        // 결과를 request에 저장
        request.setAttribute("searchResults", searchResults);
        request.setAttribute("keyword", keyword);
        request.setAttribute("searchType", searchType);
        request.setAttribute("resultCount", searchResults.size());
        
        // 검색 결과 페이지로 포워드
        request.getRequestDispatcher("/book/bookSearch.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
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
        String searchType = request.getParameter("searchType");
        
        if (keyword == null || keyword.trim().isEmpty()) {
            request.setAttribute("errorMsg", "검색어를 입력해주세요.");
            request.getRequestDispatcher("/book/bookSearch.jsp").forward(request, response);
            return;
        }
        
        keyword = keyword.trim();
        if (searchType == null || searchType.trim().isEmpty()) {
            searchType = "all";
        }
        
        BookService bService = new BookService();
        List<BookVO> searchResults = bService.searchBooks(keyword, searchType);
        
        request.setAttribute("searchResults", searchResults);
        request.setAttribute("keyword", keyword);
        request.setAttribute("searchType", searchType);
        request.setAttribute("resultCount", searchResults.size());
        
        request.getRequestDispatcher("/book/bookSearch.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}

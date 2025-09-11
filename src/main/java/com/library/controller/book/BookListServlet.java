package com.library.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.library.model.service.BookService;
import com.library.model.vo.BookVO;
import com.library.model.vo.MemberVO;

@WebServlet("/book/bookList")
public class BookListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 세션에서 로그인 정보 가져오기
        HttpSession session = request.getSession();
        MemberVO loginMember = (MemberVO) session.getAttribute("loginUserVO");
        
        String category = request.getParameter("category");
        
        BookService bService = new BookService();
        List<BookVO> bookList;
        
        if (category != null && !category.trim().isEmpty()) {
            // 카테고리별 도서 조회
            bookList = bService.selectBooksByCategory(category);
            request.setAttribute("selectedCategory", category);
        } else {
            // 전체 도서 조회
            bookList = bService.selectAllList();
        }
        
        request.setAttribute("bookList", bookList);
        request.setAttribute("loginMember", loginMember); // 로그인 정보 전달
        request.getRequestDispatcher("/WEB-INF/views/book/bookList.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
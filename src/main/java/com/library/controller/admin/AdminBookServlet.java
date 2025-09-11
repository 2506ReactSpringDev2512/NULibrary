package com.library.controller.admin;

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

@WebServlet("/admin/bookManage")
public class AdminBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 관리자 권한 확인
        HttpSession session = request.getSession();
        MemberVO loginMember = (MemberVO) session.getAttribute("adminMember");
        
        if (loginMember == null || !"Y".equals(loginMember.getAdminYn())) {
            // 관리자가 아닌 경우
            request.setAttribute("errorMsg", "관리자 권한이 필요합니다.");
            response.sendRedirect(request.getContextPath() + "/admin/adminLogin.jsp");
            return;
        }
        
        //조회 타입 확인
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        
        if(keyword == null) keyword = "";
        
        // 전체 도서 목록 조회
        BookService bookService = new BookService();
        List<BookVO> bookList = null;
        String pageTitle;
        
        if(!keyword.isBlank()) {
        	//검색 결과 조회
        	bookList = bookService.searchBooks(keyword, "all");
        	pageTitle = "검색 결과";
        }else {
        	// 전체 도서 출력
        	bookList = bookService.selectAllList();
        	pageTitle = "전체 도서 관리";
        }
        
        // 결과를 request에 저장
        request.setAttribute("bookList", bookList);
        request.setAttribute("bookCount", bookList.size());
        request.setAttribute("pageTitle", pageTitle);
        request.setAttribute("type", type);
        request.setAttribute("keyword", keyword);
        
        // JSP로 포워드
        request.getRequestDispatcher("/admin/bookManage.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        
        if ("updateDescription".equals(action)) {
            // 도서 소개 수정 처리
            String bookNo = request.getParameter("bookNo");
            String description = request.getParameter("description");
            
            if (bookNo != null && description != null) {
                BookService bookService = new BookService();
                boolean result = bookService.updateBookDescription(bookNo, description);
                
                if (result) {
                    request.setAttribute("successMsg", "도서 소개가 성공적으로 수정되었습니다.");
                } else {
                    request.setAttribute("errorMsg", "도서 소개 수정에 실패했습니다.");
                }
            }
        }
        
        // 수정 후 다시 목록 조회
        doGet(request, response);
    }
}
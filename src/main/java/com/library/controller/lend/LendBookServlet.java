package com.library.controller.lend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.library.model.service.LendInfoService;
import com.library.model.vo.MemberVO;

@WebServlet("/lend/book")
public class LendBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 세션에서 로그인한 회원 정보 가져오기
        HttpSession session = request.getSession();
        MemberVO loginMember = (MemberVO) session.getAttribute("loginUserVO");
        
        if (loginMember == null) {
            // 로그인하지 않은 경우
            request.setAttribute("errorMsg", "로그인이 필요합니다.");
            request.getRequestDispatcher("/member/login.jsp").forward(request, response);
            return;
        }
        
        String bookNo = request.getParameter("bookNo");
        
        if (bookNo == null || bookNo.trim().isEmpty()) {
            request.setAttribute("errorMsg", "도서 정보가 없습니다.");
            response.sendRedirect(request.getContextPath() + "/book/bookList");
            return;
        }
        
        // 대여 서비스 호출
        LendInfoService lendService = new LendInfoService();
        boolean result = lendService.lendBook(loginMember.getMemberId(), bookNo);
        
        if (result) {
            // 대여 성공
            request.setAttribute("successMsg", "도서 대여가 완료되었습니다.");
        } else {
            // 대여 실패
            request.setAttribute("errorMsg", "도서 대여에 실패했습니다. (이미 대여중이거나 오류가 발생했습니다)");
        }
        
        // 내 대여현황 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/member/myRentals");
    }
}
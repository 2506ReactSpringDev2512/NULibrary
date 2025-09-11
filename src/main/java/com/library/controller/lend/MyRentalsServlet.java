package com.library.controller.lend;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

import com.library.model.service.LendInfoService;
import com.library.model.vo.LendInfoVO;
import com.library.model.vo.MemberVO;

@WebServlet("/member/myRentals")
public class MyRentalsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 세션에서 로그인한 회원 정보 가져오기
        HttpSession session = request.getSession();
        MemberVO loginMember = (MemberVO) session.getAttribute("loginUserVO");
        
        if (loginMember == null) {
            // 로그인하지 않은 경우
            request.setAttribute("errorMsg", "로그인이 필요합니다.");
            request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
            return;
        }
        
        // 회원의 대여 목록 조회
        LendInfoService lendService = new LendInfoService();
        List<LendInfoVO> myRentalList = lendService.getMemberLendList(loginMember.getMemberId());
        
        // 결과를 request에 저장
        request.setAttribute("myRentalList", myRentalList);
        request.setAttribute("rentalCount", myRentalList.size());
        request.setAttribute("loginMember", loginMember); // 로그인 회원 정보 전달
        
        // JSP로 포워드
        request.getRequestDispatcher("/WEB-INF/views/member/myRentals.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
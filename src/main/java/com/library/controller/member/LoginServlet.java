package com.library.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.library.model.service.MemberService;
import com.library.model.vo.MemberVO;

/**
 * 로그인 처리 서블릿
 * GET: 로그인 폼 화면으로 이동
 * POST: 실제 로그인 처리
 */
@WebServlet("/member/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }

    /**
     * GET 요청: 로그인 폼 화면 표시
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 이미 로그인된 사용자라면 메인페이지로 리다이렉트
        HttpSession session = request.getSession();
        if(session.getAttribute("loginUser") != null) {
            response.sendRedirect(request.getContextPath() + "/main");
            return;
        }
        
        // 로그인 폼으로 이동
        request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
    }

    /**
     * POST 요청: 실제 로그인 처리
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // 파라미터 받기
        String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        
        // 유효성 검증
        if(userId == null || userId.trim().isEmpty() || 
           password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMsg", "아이디와 비밀번호를 모두 입력해주세요.");
            request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
            return;
        }
        
        try {
            // MemberService를 사용한 실제 DB 연동 로그인
            MemberService memberService = new MemberService();
            MemberVO loginUser = memberService.loginMember(userId, password);
            
            if(loginUser != null) {
                // 로그인 성공
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", loginUser.getMemberName());
                session.setAttribute("loginUserVO", loginUser);
                
                // 성공 메시지 설정
                session.setAttribute("successMsg", loginUser.getMemberName() + "님, 환영합니다!");
                
                // 메인페이지로 다시보냄
                response.sendRedirect(request.getContextPath() + "/main");
                
            } else {
                // 로그인 실패
                request.setAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
                request.setAttribute("userId", userId); // 입력한 아이디 유지
                request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "로그인 처리 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
        }
    }
    
}
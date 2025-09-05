package com.library.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.model.service.MemberService;
import com.library.model.vo.MemberVO;

/**
 * 비밀번호 찾기 처리 서블릿
 * GET: 비밀번호 찾기 폼 화면으로 이동
 * POST: 실제 비밀번호 찾기 처리
 */
@WebServlet("/member/findPassword")
public class FindPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public FindPasswordServlet() {
        super();
    }

    /**
     * GET 요청: 비밀번호 찾기 폼 화면 표시
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 비밀번호 찾기 폼으로 이동
        request.getRequestDispatcher("/member/findPassword.jsp").forward(request, response);
    }

    /**
     * POST 요청: 실제 비밀번호 찾기 처리
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        
        // 파라미터 받기
        String memberId = request.getParameter("memberId");
        String memberPhone = request.getParameter("memberPhone");
        
        // 유효성 검증
        if(memberId == null || memberId.trim().isEmpty() || 
           memberPhone == null || memberPhone.trim().isEmpty()) {
            request.setAttribute("errorMsg", "아이디와 전화번호를 모두 입력해주세요.");
            request.getRequestDispatcher("/member/findPassword.jsp").forward(request, response);
            return;
        }
        
        // 입력값 정리 (공백 제거)
        memberId = memberId.trim();
        memberPhone = memberPhone.trim();
        
        try {
            // MemberService를 사용한 회원 정보 조회
            MemberService memberService = new MemberService();
            MemberVO member = memberService.getMemberById(memberId);
            if(member != null) {
                // 회원이 존재하는 경우 전화번호 확인
                if(member.getMemberPhone().equals(memberPhone)) {
                    // 전화번호가 일치하는 경우 - 비밀번호 반환
                    request.setAttribute("successMsg", "비밀번호를 찾았습니다!");
                    request.setAttribute("foundPassword", member.getMemberPw());
                    request.setAttribute("memberId", memberId);
                    request.setAttribute("memberPhone", memberPhone);
                } else {
                    // 전화번호가 일치하지 않는 경우
                    request.setAttribute("errorMsg", "입력하신 전화번호가 일치하지 않습니다.");
                    request.setAttribute("memberId", memberId);
                    request.setAttribute("memberPhone", memberPhone);
                }
            } else {
                // 회원이 존재하지 않는 경우
                request.setAttribute("errorMsg", "존재하지 않는 아이디입니다.");
                request.setAttribute("memberId", memberId);
                request.setAttribute("memberPhone", memberPhone);
            }
            
            // 결과 페이지로 이동
            request.getRequestDispatcher("/member/findPassword.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "비밀번호 찾기 처리 중 오류가 발생했습니다.");
            request.setAttribute("memberId", memberId);
            request.setAttribute("memberPhone", memberPhone);
            request.getRequestDispatcher("/member/findPassword.jsp").forward(request, response);
        }
    }
}
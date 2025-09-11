package com.library.controller.admin;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.library.model.service.MemberService;
import com.library.model.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/memberManage")
public class AdminMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminMemberServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberService mService = new MemberService();
        String memberId = request.getParameter("memberId");
        List<MemberVO> memberList;

        if(memberId != null && !memberId.trim().isEmpty()) {
            // 검색어가 있을 경우: 부분 검색 + 관리자 제외
            memberList = mService.searchMembersById(memberId);
        } else {
            // 검색어가 없으면 전체 조회 (관리자 제외)
            memberList = mService.selectList();
        }

        // JSP에 리스트 전달
        request.setAttribute("memberList", memberList);

        // 디버깅용 콘솔 출력
        System.out.println("회원 수: " + memberList.size());
        for(MemberVO m : memberList) {
            System.out.println("회원 아이디: " + m.getMemberId());
        }

        request.getRequestDispatcher("/WEB-INF/views/admin/memberManage.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
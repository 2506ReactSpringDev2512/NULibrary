package com.library.controller.admin;

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

@WebServlet("/admin/rentalManage")
public class RentalManageServlet extends HttpServlet {
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
        // 조회 타입 확인 
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        
        if (keyword == null) keyword = "";

        LendInfoService lendService = new LendInfoService();
        List<LendInfoVO> rentalList = null;
        String pageTitle = "전체 대여 관리";

        if ("overdue".equals(type)) {
        	// 연체 도서만 조회
            rentalList = lendService.getOverdueBookList();
            pageTitle = "연체 도서 관리";
        } else if (!keyword.isBlank()) {
        	// 검색 결과 조회
            rentalList = lendService.searchLendInfo(keyword, "all");
            pageTitle = "검색 결과";
        } else {
            // 전체대여 목록 조회
            rentalList = lendService.getAllLendList();
        }
        
        // 결과를 request에 저장
        request.setAttribute("rentalList", rentalList);
        request.setAttribute("rentalCount", rentalList.size());
        request.setAttribute("pageTitle", pageTitle);
        request.setAttribute("type", type);
        request.setAttribute("keyword", keyword);
        
        // JSP로 포워드
        request.getRequestDispatcher("/admin/rentalManage.jsp").forward(request, response);
    }

    // dopost (반납처리)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
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

        String action = request.getParameter("action");
        String memberId = request.getParameter("memberId");
        String bookNo = request.getParameter("bookNo");
        
        if ("return".equals(action) && memberId != null && bookNo != null) {
        	// 관리자의 강제 반납 처리
            LendInfoService lendService = new LendInfoService();
            boolean result = lendService.returnBook(memberId, bookNo);
            
            if (result) {
                request.setAttribute("successMsg", "반납 처리가 완료되었습니다.");
            } else {
                request.setAttribute("errorMsg", "반납 처리에 실패했습니다.");
            }
        }
        // GET 방식으로 다시 조회
        doGet(request,response);
    }
}
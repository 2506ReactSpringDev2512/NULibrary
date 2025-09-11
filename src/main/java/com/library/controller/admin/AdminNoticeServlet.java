package com.library.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.model.service.NoticeService;
import com.library.model.vo.NoticeVO;

/**
 * 관리자용 공지사항 관리 서블릿
 */
@WebServlet("/admin/notice")
public class AdminNoticeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public AdminNoticeServlet() {
        super();
    }

    /**
     * GET 요청: 관리자용 공지사항 목록 페이지
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // 세션에서 성공 메시지 가져오기 (있다면)
            String successMsg = (String) request.getSession().getAttribute("successMsg");
            if (successMsg != null) {
                request.setAttribute("successMsg", successMsg);
                request.getSession().removeAttribute("successMsg"); // 한 번만 표시되도록 제거
            }
            
            // 세션에서 에러 메시지 가져오기 (있다면)
            String errorMsg = (String) request.getSession().getAttribute("errorMsg");
            if (errorMsg != null) {
                request.setAttribute("errorMsg", errorMsg);
                request.getSession().removeAttribute("errorMsg"); // 한 번만 표시되도록 제거
            }
            
            // 공지사항 목록 조회
            NoticeService noticeService = new NoticeService();
            List<NoticeVO> noticeList = noticeService.getAllNotices();
            
            // 결과를 request에 저장
            request.setAttribute("noticeList", noticeList);
            
            // 관리자용 공지사항 관리 페이지로 포워드
            request.getRequestDispatcher("/WEB-INF/views/admin/adminNotice.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "공지사항 목록 조회 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/admin/adminNotice.jsp").forward(request, response);
        }
    }

    /**
     * POST 요청: doGet과 동일하게 처리
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
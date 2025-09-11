package com.library.controller.notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.model.service.NoticeService;
import com.library.model.vo.NoticeVO;

/**
 * 공지사항 상세 조회 처리 서블릿
 */
@WebServlet("/notice/detail")
public class NoticeDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public NoticeDetailServlet() {
        super();
    }

    /**
     * GET 요청: 공지사항 상세 페이지
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 공지사항 번호 파라미터 받기
        String noticeNoParam = request.getParameter("noticeNo");
        
        if (noticeNoParam == null || noticeNoParam.trim().isEmpty()) {
            // 파라미터가 없으면 공지사항 목록으로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/notice/list");
            return;
        }
        
        try {
            int noticeNo = Integer.parseInt(noticeNoParam);
            
            // 공지사항 상세 조회 (조회수 증가 포함)
            NoticeService noticeService = new NoticeService();
            NoticeVO notice = noticeService.getNoticeDetail(noticeNo);
            
            if (notice != null) {
                // 공지사항 정보를 request에 저장
                request.setAttribute("notice", notice);
                
                // 공지사항 상세 페이지로 포워드
                request.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp").forward(request, response);
            } else {
                // 공지사항이 존재하지 않으면 목록으로 리다이렉트
                request.getSession().setAttribute("errorMsg", "존재하지 않는 공지사항입니다.");
                response.sendRedirect(request.getContextPath() + "/notice/list");
            }
            
        } catch (NumberFormatException e) {
            // 잘못된 번호 형식이면 목록으로 리다이렉트
            request.getSession().setAttribute("errorMsg", "잘못된 공지사항 번호입니다.");
            response.sendRedirect(request.getContextPath() + "/notice/list");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "공지사항 조회 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/notice/noticeDetail.jsp").forward(request, response);
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
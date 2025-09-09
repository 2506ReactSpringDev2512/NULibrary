package com.library.controller.notice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.model.service.NoticeService;

/**
 * 공지사항 삭제 처리 서블릿
 */
@WebServlet("/notice/delete")
public class NoticeDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public NoticeDeleteServlet() {
        super();
    }

    /**
     * GET 요청: 공지사항 삭제 처리
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            // 삭제할 공지사항 번호 받기
            String noticeNoStr = request.getParameter("noticeNo");
            
            if (noticeNoStr == null || noticeNoStr.trim().isEmpty()) {
                request.getSession().setAttribute("errorMsg", "잘못된 접근입니다.");
                response.sendRedirect(request.getContextPath() + "/admin/notice");
                return;
            }
            
            int noticeNo = Integer.parseInt(noticeNoStr);
            
            // 공지사항 삭제 서비스 호출
            NoticeService noticeService = new NoticeService();
            int result = noticeService.deleteNotice(noticeNo);
            
            if (result > 0) {
                // 삭제 성공
                request.getSession().setAttribute("successMsg", "공지사항이 성공적으로 삭제되었습니다.");
            } else {
                // 삭제 실패
                request.getSession().setAttribute("errorMsg", "공지사항 삭제에 실패했습니다.");
            }
            
            // 관리자 공지사항 목록으로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/admin/notice");
            
        } catch (NumberFormatException e) {
            request.getSession().setAttribute("errorMsg", "잘못된 공지사항 번호입니다.");
            response.sendRedirect(request.getContextPath() + "/admin/notice");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMsg", "공지사항 삭제 중 오류가 발생했습니다.");
            response.sendRedirect(request.getContextPath() + "/admin/notice");
        }
    }

    /**
     * POST 요청: GET과 동일하게 처리
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}
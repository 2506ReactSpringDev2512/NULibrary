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
 * 공지사항 작성 처리 서블릿
 */
@WebServlet("/notice/write")
public class NoticeWriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public NoticeWriteServlet() {
        super();
    }

    /**
     * GET 요청: 공지사항 작성 페이지 표시
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 공지사항 작성 페이지로 포워드
        request.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(request, response);
    }

    /**
     * POST 요청: 공지사항 작성 처리
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
        try {
            // 폼에서 전송된 데이터 받기
            String noticeSubject = request.getParameter("noticeSubject");
            String noticeContent = request.getParameter("noticeContent");
            String noticeWriter = request.getParameter("noticeWriter");
            
            // 입력값 검증
            if (noticeSubject == null || noticeSubject.trim().isEmpty()) {
                request.setAttribute("errorMsg", "제목을 입력해주세요.");
                request.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(request, response);
                return;
            }
            
            if (noticeContent == null || noticeContent.trim().isEmpty()) {
                request.setAttribute("errorMsg", "내용을 입력해주세요.");
                request.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(request, response);
                return;
            }
            
            if (noticeWriter == null || noticeWriter.trim().isEmpty()) {
                noticeWriter = "admin"; // 기본값 설정
            }
            
            // 공지사항 객체 생성
            NoticeVO notice = new NoticeVO();
            notice.setNoticeSubject(noticeSubject.trim());
            notice.setNoticeContent(noticeContent.trim());
            notice.setNoticeWriter(noticeWriter.trim());
            
            // 공지사항 작성 서비스 호출
            NoticeService noticeService = new NoticeService();
            int result = noticeService.insertNotice(notice);
            
            if (result > 0) {
                // 작성 성공 - 관리자 공지사항 목록으로 리다이렉트
                request.getSession().setAttribute("successMsg", "공지사항이 성공적으로 작성되었습니다.");
                response.sendRedirect(request.getContextPath() + "/admin/notice");
            } else {
                // 작성 실패
                request.setAttribute("errorMsg", "공지사항 작성에 실패했습니다. 다시 시도해주세요.");
                request.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "공지사항 작성 중 오류가 발생했습니다: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/views/notice/noticeWrite.jsp").forward(request, response);
        }
    }
}
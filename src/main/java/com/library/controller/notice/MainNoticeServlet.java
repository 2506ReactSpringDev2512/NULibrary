package com.library.controller.notice;

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
 * 메인페이지용 최근 공지사항 조회 서블릿
 */
@WebServlet("/notice/recent")
public class MainNoticeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public MainNoticeServlet() {
        super();
    }

    /**
     * GET 요청: 최근 공지사항 조회 (AJAX용)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // 최근 공지사항 4개 조회
            NoticeService noticeService = new NoticeService();
            List<NoticeVO> recentNotices = noticeService.getRecentNotices(4);
            
            // JSON 형태로 응답 생성
            StringBuilder json = new StringBuilder();
            json.append("{\"notices\":[");
            
            for (int i = 0; i < recentNotices.size(); i++) {
                NoticeVO notice = recentNotices.get(i);
                if (i > 0) json.append(",");
                
                json.append("{")
                    .append("\"noticeNo\":").append(notice.getNoticeNo()).append(",")
                    .append("\"subject\":\"").append(notice.getShortSubject(15)).append("\",")
                    .append("\"date\":\"").append(notice.getShortDate()).append("\"")
                    .append("}");
            }
            
            json.append("]}");
            
            response.getWriter().write(json.toString());
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\":\"공지사항 조회 실패\"}");
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
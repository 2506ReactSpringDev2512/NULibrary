package com.library.model.service;

import java.sql.Connection;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.model.dao.NoticeDAO;
import com.library.model.vo.NoticeVO;

/**
 * 공지사항 관련 비즈니스 로직을 처리하는 Service 클래스
 */
public class NoticeService {
    
    private NoticeDAO noticeDAO = NoticeDAO.getInstance();
    
    /**
     * 모든 공지사항 조회
     * @return 공지사항 목록
     */
    public List<NoticeVO> getAllNotices() {
        Connection conn = JDBCTemplate.getConnection();
        List<NoticeVO> noticeList = noticeDAO.selectAllNotices(conn);
        JDBCTemplate.close(conn);
        return noticeList;
    }
    
    /**
     * 최근 공지사항 조회 (메인페이지용)
     * @param limit 조회할 개수
     * @return 최근 공지사항 목록
     */
    public List<NoticeVO> getRecentNotices(int limit) {
        Connection conn = JDBCTemplate.getConnection();
        List<NoticeVO> noticeList = noticeDAO.selectRecentNotices(conn, limit);
        JDBCTemplate.close(conn);
        return noticeList;
    }
    
    /**
     * 공지사항 상세 조회 (조회수 증가 포함)
     * @param noticeNo 공지사항 번호
     * @return 공지사항 정보
     */
    public NoticeVO getNoticeDetail(int noticeNo) {
        Connection conn = JDBCTemplate.getConnection();
        
        // 1. 공지사항 조회
        NoticeVO notice = noticeDAO.selectNoticeByNo(conn, noticeNo);
        
        // 2. 조회수 증가
        if (notice != null) {
            int result = noticeDAO.increaseViewCount(conn, noticeNo);
            if (result > 0) {
                JDBCTemplate.commit(conn);
                // 조회수 증가 후 객체에도 반영
                notice.setViewCount(notice.getViewCount() + 1);
            } else {
                JDBCTemplate.rollback(conn);
            }
        }
        
        JDBCTemplate.close(conn);
        return notice;
    }
    
    /**
     * 공지사항 작성 (관리자 기능)
     * @param notice 공지사항 정보
     * @return 성공시 1, 실패시 0
     */
    public int insertNotice(NoticeVO notice) {
        Connection conn = JDBCTemplate.getConnection();
        int result = noticeDAO.insertNotice(conn, notice);
        
        if (result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return result;
    }
    
    /**
     * 공지사항 수정 (관리자 기능)
     * @param notice 수정할 공지사항 정보
     * @return 성공시 1, 실패시 0
     */
    public int updateNotice(NoticeVO notice) {
        Connection conn = JDBCTemplate.getConnection();
        int result = noticeDAO.updateNotice(conn, notice);
        
        if (result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return result;
    }
    
    /**
     * 공지사항 삭제 (관리자 기능)
     * @param noticeNo 삭제할 공지사항 번호
     * @return 성공시 1, 실패시 0
     */
    public int deleteNotice(int noticeNo) {
        Connection conn = JDBCTemplate.getConnection();
        int result = noticeDAO.deleteNotice(conn, noticeNo);
        
        if (result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return result;
    }
}
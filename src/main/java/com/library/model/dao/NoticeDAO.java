package com.library.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.model.vo.NoticeVO;

/**
 * 공지사항 관련 데이터베이스 작업을 처리하는 DAO 클래스
 */
public class NoticeDAO {
    
    // 싱글톤 패턴
    private static NoticeDAO instance = new NoticeDAO();
    
    private NoticeDAO() {}
    
    public static NoticeDAO getInstance() {
        return instance;
    }
    
    /**
     * 모든 공지사항 조회 (최신순)
     * @param conn DB 연결 객체
     * @return 공지사항 목록
     */
    public List<NoticeVO> selectAllNotices(Connection conn) {
        List<NoticeVO> noticeList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT NOTICE_NO, NOTICE_SUBJECT, NOTICE_CONTENT, " +
                    "NOTICE_WRITER, NOTICE_DATE, VIEW_COUNT " +
                    "FROM NOTICE_TBL " +
                    "ORDER BY NOTICE_NO DESC";
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                NoticeVO notice = new NoticeVO();
                notice.setNoticeNo(rs.getInt("NOTICE_NO"));
                notice.setNoticeSubject(rs.getString("NOTICE_SUBJECT"));
                notice.setNoticeContent(rs.getString("NOTICE_CONTENT"));
                notice.setNoticeWriter(rs.getString("NOTICE_WRITER"));
                notice.setNoticeDate(rs.getTimestamp("NOTICE_DATE"));
                notice.setViewCount(rs.getInt("VIEW_COUNT"));
                
                noticeList.add(notice);
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return noticeList;
    }
    
    /**
     * 최근 공지사항 조회 (메인페이지용)
     * @param conn DB 연결 객체
     * @param limit 조회할 개수
     * @return 최근 공지사항 목록
     */
    public List<NoticeVO> selectRecentNotices(Connection conn, int limit) {
        List<NoticeVO> noticeList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        // Oracle 11g 호환을 위한 ROWNUM 사용
        String sql = "SELECT * FROM (" +
                    "SELECT NOTICE_NO, NOTICE_SUBJECT, NOTICE_CONTENT, " +
                    "NOTICE_WRITER, NOTICE_DATE, VIEW_COUNT " +
                    "FROM NOTICE_TBL " +
                    "ORDER BY NOTICE_NO DESC" +
                    ") WHERE ROWNUM <= ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, limit);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                NoticeVO notice = new NoticeVO();
                notice.setNoticeNo(rs.getInt("NOTICE_NO"));
                notice.setNoticeSubject(rs.getString("NOTICE_SUBJECT"));
                notice.setNoticeContent(rs.getString("NOTICE_CONTENT"));
                notice.setNoticeWriter(rs.getString("NOTICE_WRITER"));
                notice.setNoticeDate(rs.getTimestamp("NOTICE_DATE"));
                notice.setViewCount(rs.getInt("VIEW_COUNT"));
                
                noticeList.add(notice);
            }
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return noticeList;
    }
    
    /**
     * 공지사항 상세 조회 (조회수 증가 포함)
     * @param conn DB 연결 객체
     * @param noticeNo 공지사항 번호
     * @return 공지사항 정보
     */
    public NoticeVO selectNoticeByNo(Connection conn, int noticeNo) {
        NoticeVO notice = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT NOTICE_NO, NOTICE_SUBJECT, NOTICE_CONTENT, " +
                    "NOTICE_WRITER, NOTICE_DATE, VIEW_COUNT " +
                    "FROM NOTICE_TBL " +
                    "WHERE NOTICE_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                notice = new NoticeVO();
                notice.setNoticeNo(rs.getInt("NOTICE_NO"));
                notice.setNoticeSubject(rs.getString("NOTICE_SUBJECT"));
                notice.setNoticeContent(rs.getString("NOTICE_CONTENT"));
                notice.setNoticeWriter(rs.getString("NOTICE_WRITER"));
                notice.setNoticeDate(rs.getTimestamp("NOTICE_DATE"));
                notice.setViewCount(rs.getInt("VIEW_COUNT"));
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return notice;
    }
    
    /**
     * 조회수 증가
     * @param conn DB 연결 객체
     * @param noticeNo 공지사항 번호
     * @return 성공시 1, 실패시 0
     */
    public int increaseViewCount(Connection conn, int noticeNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE NOTICE_TBL SET VIEW_COUNT = VIEW_COUNT + 1 WHERE NOTICE_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);
            
            result = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    /**
     * 공지사항 작성 (관리자 기능)
     * @param conn DB 연결 객체
     * @param notice 공지사항 정보
     * @return 성공시 1, 실패시 0
     */
    public int insertNotice(Connection conn, NoticeVO notice) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        // 시퀀스를 사용한 번호 자동 생성 (Oracle 기준)
        String sql = "INSERT INTO NOTICE_TBL " +
                    "(NOTICE_NO, NOTICE_SUBJECT, NOTICE_CONTENT, NOTICE_WRITER, NOTICE_DATE, VIEW_COUNT) " +
                    "VALUES (NOTICE_SEQ.NEXTVAL, ?, ?, ?, SYSTIMESTAMP, 0)";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, notice.getNoticeSubject());
            pstmt.setString(2, notice.getNoticeContent());
            pstmt.setString(3, notice.getNoticeWriter());
            
            result = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    /**
     * 공지사항 수정 (관리자 기능)
     * @param conn DB 연결 객체
     * @param notice 수정할 공지사항 정보
     * @return 성공시 1, 실패시 0
     */
    public int updateNotice(Connection conn, NoticeVO notice) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE NOTICE_TBL SET " +
                    "NOTICE_SUBJECT = ?, NOTICE_CONTENT = ? " +
                    "WHERE NOTICE_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, notice.getNoticeSubject());
            pstmt.setString(2, notice.getNoticeContent());
            pstmt.setInt(3, notice.getNoticeNo());
            
            result = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    /**
     * 공지사항 삭제 (관리자 기능)
     * @param conn DB 연결 객체
     * @param noticeNo 삭제할 공지사항 번호
     * @return 성공시 1, 실패시 0
     */
    public int deleteNotice(Connection conn, int noticeNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "DELETE FROM NOTICE_TBL WHERE NOTICE_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, noticeNo);
            
            result = pstmt.executeUpdate();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
}
package com.library.model.service;

import java.sql.Connection;
import java.util.List;
import com.library.common.JDBCTemplate;
import com.library.model.dao.LendInfoDAO;
import com.library.model.vo.LendInfoVO;

public class LendInfoService {
    private LendInfoDAO lendInfoDAO = LendInfoDAO.getInstance();
    
    // 도서 대여
    public boolean lendBook(String memberId, String bookNo) {
        Connection conn = JDBCTemplate.getConnection();
        boolean result = false;
        
        try {
            // 1. 도서 대여 가능 여부 확인
            if (!lendInfoDAO.checkBookAvailable(conn, bookNo)) {
                System.err.println("❌ 대여 실패: 이미 대여중인 도서입니다.");
                return false;
            }
            
            // 2. 대여 정보 등록
            LendInfoVO lendInfo = new LendInfoVO();
            lendInfo.setMId(memberId);
            lendInfo.setBookNo(bookNo);
            
            int lendResult = lendInfoDAO.insertLendInfo(conn, lendInfo);
            
            // 3. 도서 상태를 '대여중'으로 변경
            int statusResult = lendInfoDAO.updateBookLendStatus(conn, bookNo);
            
            // 4. 모든 작업이 성공하면 커밋
            if (lendResult > 0 && statusResult > 0) {
                JDBCTemplate.commit(conn);
                result = true;
                System.out.println("✅ 도서 대여 완료: " + memberId + " -> " + bookNo);
            } else {
                JDBCTemplate.rollback(conn);
                System.err.println("❌ 도서 대여 실패");
            }
            
        } catch (Exception e) {
            JDBCTemplate.rollback(conn);
            System.err.println("도서 대여 서비스 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        
        return result;
    }
    
    // 도서 반납
    public boolean returnBook(String memberId, String bookNo) {
        Connection conn = JDBCTemplate.getConnection();
        boolean result = false;
        
        try {
            // 1. 대여 정보 삭제
            int lendResult = lendInfoDAO.deleteLendInfo(conn, memberId, bookNo);
            
            // 2. 도서 상태를 '대여가능'으로 변경
            int statusResult = lendInfoDAO.updateBookReturnStatus(conn, bookNo);
            
            // 3. 모든 작업이 성공하면 커밋
            if (lendResult > 0 && statusResult > 0) {
                JDBCTemplate.commit(conn);
                result = true;
                System.out.println("✅ 도서 반납 완료: " + memberId + " -> " + bookNo);
            } else {
                JDBCTemplate.rollback(conn);
                System.err.println("❌ 도서 반납 실패");
            }
            
        } catch (Exception e) {
            JDBCTemplate.rollback(conn);
            System.err.println("도서 반납 서비스 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        
        return result;
    }
    
    // 특정 회원의 대여 목록 조회
    public List<LendInfoVO> getMemberLendList(String memberId) {
        List<LendInfoVO> lendList = null;
        Connection conn = JDBCTemplate.getConnection();
        
        lendList = lendInfoDAO.selectLendInfoByMember(conn, memberId);
        
        JDBCTemplate.close(conn);
        return lendList;
    }
    
    // 전체 대여 목록 조회 (관리자용)
    public List<LendInfoVO> getAllLendList() {
        List<LendInfoVO> lendList = null;
        Connection conn = JDBCTemplate.getConnection();
        
        lendList = lendInfoDAO.selectAllLendInfo(conn);
        
        JDBCTemplate.close(conn);
        return lendList;
    }
    
    // 연체 도서 목록 조회
    public List<LendInfoVO> getOverdueBookList() {
        List<LendInfoVO> overdueList = null;
        Connection conn = JDBCTemplate.getConnection();
        
        overdueList = lendInfoDAO.selectOverdueBooks(conn);
        
        JDBCTemplate.close(conn);
        return overdueList;
    }
    
    // 도서 대여 가능 여부 확인
    public boolean isBookAvailable(String bookNo) {
        boolean isAvailable = false;
        Connection conn = JDBCTemplate.getConnection();
        
        isAvailable = lendInfoDAO.checkBookAvailable(conn, bookNo);
        
        JDBCTemplate.close(conn);
        return isAvailable;
    }
    
    // 관리자 대여 관리 내 검색 기능
    public List<LendInfoVO> searchLendInfo(String keyword, String searchType){
    	if (keyword == null) keyword = "";
    	List<LendInfoVO> lendInfoList = null;
    	Connection conn = JDBCTemplate.getConnection();
    	lendInfoList = lendInfoDAO.searchLendInfo(conn, keyword);
    	JDBCTemplate.close(conn);
    	return lendInfoList;
    }
    
}
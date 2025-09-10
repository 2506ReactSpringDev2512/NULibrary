package com.library.model.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.library.common.JDBCTemplate;
import com.library.model.vo.LendInfoVO;

public class LendInfoDAO {
    private static LendInfoDAO instance = new LendInfoDAO();
    private LendInfoDAO() {}
    public static LendInfoDAO getInstance() { return instance; }

    // 도서 대여
    public int insertLendInfo(Connection conn, LendInfoVO lendInfo) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "INSERT INTO LENDINFO_TBL (M_ID, BOOK_NO, LEND_DATE, RETURN_DATE) VALUES (?, ?, SYSDATE, SYSDATE+7)";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, lendInfo.getMId());
            pstmt.setString(2, lendInfo.getBookNo());
            
            result = pstmt.executeUpdate();
            System.out.println("✅ 도서 대여 등록 성공");
        } catch (SQLException e) {
            System.err.println("도서 대여 등록 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

    // 도서 반납 (대여 정보 삭제)
    public int deleteLendInfo(Connection conn, String mId, String bookNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "DELETE FROM LENDINFO_TBL WHERE M_ID = ? AND BOOK_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mId);
            pstmt.setString(2, bookNo);
            
            result = pstmt.executeUpdate();
            System.out.println("✅ 도서 반납 처리 성공");
        } catch (SQLException e) {
            System.err.println("도서 반납 처리 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

    // 특정 회원의 대여 목록 조회 (JOIN)
    public List<LendInfoVO> selectLendInfoByMember(Connection conn, String memberId) {
        List<LendInfoVO> lendList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT l.M_ID, l.BOOK_NO, l.LEND_DATE, l.RETURN_DATE, " +
                    "m.MEMBER_NAME, b.BOOK_NAME, b.BOOK_AUTHOR, b.BOOK_PUBLISHER " +
                    "FROM LENDINFO_TBL l " +
                    "JOIN MEMBER_TBL m ON l.M_ID = m.MEMBER_ID " +
                    "JOIN BOOK_TBL b ON l.BOOK_NO = b.BOOK_NO " +
                    "WHERE l.M_ID = ? ORDER BY l.LEND_DATE DESC";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                LendInfoVO lendInfo = new LendInfoVO();
                
                lendInfo.setMId(rs.getString("M_ID"));
                lendInfo.setBookNo(rs.getString("BOOK_NO"));
                lendInfo.setLendDate(rs.getDate("LEND_DATE"));
                lendInfo.setReturnDate(rs.getDate("RETURN_DATE"));
                lendInfo.setMemberName(rs.getString("MEMBER_NAME"));
                lendInfo.setBookName(rs.getString("BOOK_NAME"));
                lendInfo.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                lendInfo.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                
                // 연체 여부 확인 (현재 날짜가 반납예정일을 지났는지)
                Date today = new Date(System.currentTimeMillis());
                lendInfo.setIsOverdue(today.after(rs.getDate("RETURN_DATE")));
                
                lendList.add(lendInfo);
            }
            System.out.println("✅ 회원 대여 목록 조회 성공 (" + memberId + "): " + lendList.size() + "권");
        } catch (SQLException e) {
            System.err.println("회원 대여 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return lendList;
    }

    // 전체 대여 목록 조회 (관리자용)
    public List<LendInfoVO> selectAllLendInfo(Connection conn) {
        List<LendInfoVO> lendList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT l.M_ID, l.BOOK_NO, l.LEND_DATE, l.RETURN_DATE, " +
                    "m.MEMBER_NAME, b.BOOK_NAME, b.BOOK_AUTHOR, b.BOOK_PUBLISHER " +
                    "FROM LENDINFO_TBL l " +
                    "JOIN MEMBER_TBL m ON l.M_ID = m.MEMBER_ID " +
                    "JOIN BOOK_TBL b ON l.BOOK_NO = b.BOOK_NO " +
                    "ORDER BY l.LEND_DATE DESC";
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                LendInfoVO lendInfo = new LendInfoVO();
                
                lendInfo.setMId(rs.getString("M_ID"));
                lendInfo.setBookNo(rs.getString("BOOK_NO"));
                lendInfo.setLendDate(rs.getDate("LEND_DATE"));
                lendInfo.setReturnDate(rs.getDate("RETURN_DATE"));
                lendInfo.setMemberName(rs.getString("MEMBER_NAME"));
                lendInfo.setBookName(rs.getString("BOOK_NAME"));
                lendInfo.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                lendInfo.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                
                // 연체 여부 확인
                Date today = new Date(System.currentTimeMillis());
                lendInfo.setIsOverdue(today.after(rs.getDate("RETURN_DATE")));
                
                lendList.add(lendInfo);
            }
            System.out.println("✅ 전체 대여 목록 조회 성공: " + lendList.size() + "권");
        } catch (SQLException e) {
            System.err.println("전체 대여 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return lendList;
    }

    // 연체 도서 목록 조회
    public List<LendInfoVO> selectOverdueBooks(Connection conn) {
        List<LendInfoVO> overdueList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT l.M_ID, l.BOOK_NO, l.LEND_DATE, l.RETURN_DATE, " +
                    "m.MEMBER_NAME, b.BOOK_NAME, b.BOOK_AUTHOR, b.BOOK_PUBLISHER " +
                    "FROM LENDINFO_TBL l " +
                    "JOIN MEMBER_TBL m ON l.M_ID = m.MEMBER_ID " +
                    "JOIN BOOK_TBL b ON l.BOOK_NO = b.BOOK_NO " +
                    "WHERE l.RETURN_DATE < SYSDATE " +
                    "ORDER BY l.RETURN_DATE";
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                LendInfoVO lendInfo = new LendInfoVO();
                
                lendInfo.setMId(rs.getString("M_ID"));
                lendInfo.setBookNo(rs.getString("BOOK_NO"));
                lendInfo.setLendDate(rs.getDate("LEND_DATE"));
                lendInfo.setReturnDate(rs.getDate("RETURN_DATE"));
                lendInfo.setMemberName(rs.getString("MEMBER_NAME"));
                lendInfo.setBookName(rs.getString("BOOK_NAME"));
                lendInfo.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                lendInfo.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                lendInfo.setIsOverdue(true);
                
                overdueList.add(lendInfo);
            }
            System.out.println("✅ 연체 도서 목록 조회 성공: " + overdueList.size() + "권");
        } catch (SQLException e) {
            System.err.println("연체 도서 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return overdueList;
    }

    // 도서 대여 가능 여부 확인
    public boolean checkBookAvailable(Connection conn, String bookNo) {
        boolean isAvailable = false;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT COUNT(*) FROM LENDINFO_TBL WHERE BOOK_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookNo);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                isAvailable = rs.getInt(1) == 0; // 대여 정보가 없으면 대여 가능
            }
        } catch (SQLException e) {
            System.err.println("도서 대여 가능 여부 확인 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return isAvailable;
    }

    // 도서의 LEND_YN 상태 변경 (대여중으로)
    public int updateBookLendStatus(Connection conn, String bookNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE BOOK_TBL SET LEND_YN = '대여중' WHERE BOOK_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("도서 대여상태 변경 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }

    // 도서의 LEND_YN 상태 변경 (대여가능으로)
    public int updateBookReturnStatus(Connection conn, String bookNo) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE BOOK_TBL SET LEND_YN = '대여가능' WHERE BOOK_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookNo);
            
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("도서 반납상태 변경 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }
    
    // 관리자 내 도서 대여 정보 검색
    public List<LendInfoVO> searchLendInfo(Connection conn, String keyword){
    	List<LendInfoVO> lendInfoList = new ArrayList<>();
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	
    	// 통합검색 쿼리(아이디, 도서명)
    	  String sql = "SELECT l.M_ID, l.BOOK_NO, l.LEND_DATE, l.RETURN_DATE, "
                  + "m.MEMBER_NAME, b.BOOK_NAME, b.LEND_YN "
                  + "FROM LENDINFO_TBL l "
                  + "JOIN MEMBER_TBL m ON l.M_ID = m.MEMBER_ID "
                  + "JOIN BOOK_TBL b ON l.BOOK_NO = b.BOOK_NO "
                  + "WHERE m.MEMBER_NAME LIKE ? OR b.BOOK_NAME LIKE ? "
                  + "ORDER BY l.LEND_DATE DESC";

       try {
           pstmt = conn.prepareStatement(sql);
           String searchKeyword = "%" + (keyword == null ? "" : keyword.trim()) + "%";
           pstmt.setString(1, searchKeyword);
           pstmt.setString(2, searchKeyword);

           rs = pstmt.executeQuery();
           while (rs.next()) {
               LendInfoVO lendInfo = new LendInfoVO();
               lendInfo.setMId(rs.getString("M_ID"));
               lendInfo.setBookNo(rs.getString("BOOK_NO"));
               lendInfo.setLendDate(rs.getDate("LEND_DATE"));
               lendInfo.setReturnDate(rs.getDate("RETURN_DATE"));
               lendInfo.setMemberName(rs.getString("MEMBER_NAME"));
               lendInfo.setBookName(rs.getString("BOOK_NAME"));

               lendInfoList.add(lendInfo);
           }
           System.out.println("✅ 대여 내역 검색 완료 (" + keyword + "): " + lendInfoList.size() + "건");
       } catch (SQLException e) {
           System.err.println("대여 내역 검색 쿼리 실행 중 오류: " + e.getMessage());
           e.printStackTrace();
       } finally {
           JDBCTemplate.close(rs);
           JDBCTemplate.close(pstmt);
       }
       return lendInfoList;
   }
}
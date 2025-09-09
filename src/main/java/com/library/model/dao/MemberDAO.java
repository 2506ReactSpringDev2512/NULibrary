package com.library.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.model.vo.MemberVO;

/**
 * 회원 관련 데이터베이스 작업을 처리하는 DAO 클래스
 */
public class MemberDAO {
    
    // 싱글톤 패턴
    private static MemberDAO instance = new MemberDAO();
    
    private MemberDAO() {}
    
    public static MemberDAO getInstance() {
        return instance;
    }
    
    /**
     * 로그인을 위한 회원 정보 조회
     * @param memberId 회원 아이디
     * @param memberPw 회원 비밀번호
     * @return 로그인 성공시 MemberVO, 실패시 null
     */
    public MemberVO loginMember(Connection conn, String memberId, String memberPw) {
        MemberVO member = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, " +
                    "MEMBER_GENDER, MEMBER_AGE, ADMIN_YN " +
                    "FROM MEMBER_TBL " +
                    "WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            pstmt.setString(2, memberPw);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                member = new MemberVO();
                member.setMemberId(rs.getString("MEMBER_ID"));
                member.setMemberPw(rs.getString("MEMBER_PW"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setMemberPhone(rs.getString("MEMBER_PHONE"));
                member.setMemberGender(rs.getString("MEMBER_GENDER"));
                member.setMemberAge(rs.getInt("MEMBER_AGE"));
                member.setAdminYn(rs.getString("ADMIN_YN"));
                
            }
            
        } catch (SQLException e) {
            System.err.println("로그인 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return member;
    }
    
    /**
     * 아이디로 회원 정보 조회 (아이디 중복 체크용)
     * @param memberId 회원 아이디
     * @return 회원 정보가 있으면 MemberVO, 없으면 null
     */
    public MemberVO selectMemberById(Connection conn, String memberId) {
        MemberVO member = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, " +
                    "MEMBER_GENDER, MEMBER_AGE, ADMIN_YN " +
                    "FROM MEMBER_TBL " +
                    "WHERE MEMBER_ID = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                member = new MemberVO();
                member.setMemberId(rs.getString("MEMBER_ID"));
                member.setMemberPw(rs.getString("MEMBER_PW"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setMemberPhone(rs.getString("MEMBER_PHONE"));
                member.setMemberGender(rs.getString("MEMBER_GENDER"));
                member.setMemberAge(rs.getInt("MEMBER_AGE"));
                member.setAdminYn(rs.getString("ADMIN_YN"));
            }
            
        } catch (SQLException e) {
            System.err.println("회원 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return member;
    }
    
    /**
     * 회원가입 - 새로운 회원 정보 삽입
     * @param member 회원 정보
     * @return 성공시 1, 실패시 0
     */
    public int insertMember(Connection conn, MemberVO member) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "INSERT INTO MEMBER_TBL " +
                    "(MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, " +
                    "MEMBER_GENDER, MEMBER_AGE, ADMIN_YN) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMemberId());
            pstmt.setString(2, member.getMemberPw());
            pstmt.setString(3, member.getMemberName());
            pstmt.setString(4, member.getMemberPhone());
            pstmt.setString(5, member.getMemberGender());
            pstmt.setInt(6, member.getMemberAge());
            pstmt.setString(7, member.getAdminYn());
            
            result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("✅ 회원가입 성공: " + member.getMemberName() + "님");
            } else {
                System.out.println("❌ 회원가입 실패");
            }
            
        } catch (SQLException e) {
            System.err.println("회원가입 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    /**
     * 회원 정보 수정
     * @param member 수정할 회원 정보
     * @return 성공시 1, 실패시 0
     */
    public int updateMember(Connection conn, MemberVO member) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE MEMBER_TBL SET " +
                "MEMBER_PW = ?, MEMBER_NAME = ?, MEMBER_PHONE = ?, " +
                "MEMBER_GENDER = ?, MEMBER_AGE = ? " +
                "WHERE MEMBER_ID = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getMemberPw());
            pstmt.setString(2, member.getMemberName());
            pstmt.setString(3, member.getMemberPhone());
            pstmt.setString(4, member.getMemberGender());
            pstmt.setInt(5, member.getMemberAge());
            pstmt.setString(6, member.getMemberId());
            
            result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("✅ 회원정보 수정 성공: " + member.getMemberName() + "님");
            } else {
                System.out.println("❌ 회원정보 수정 실패");
            }
            
        } catch (SQLException e) {
            System.err.println("회원정보 수정 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    /**
     * 회원 삭제 (관리자 기능)
     * @param memberId 삭제할 회원 아이디
     * @return 성공시 1, 실패시 0
     */
    public int deleteMember(Connection conn, String memberId) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "DELETE FROM MEMBER_TBL WHERE MEMBER_ID = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberId);
            
            result = pstmt.executeUpdate();
            
            if (result > 0) {
                System.out.println("✅ 회원 삭제 성공: " + memberId);
            } else {
                System.out.println("❌ 회원 삭제 실패: " + memberId);
            }
            
        } catch (SQLException e) {
            System.err.println("회원 삭제 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        
        return result;
    }
    
    /**
     * 전체 회원 목록 조회 (관리자 기능)
     * @return 회원 목록 List
     */
    public List<MemberVO> selectAllMembers(Connection conn) {
        List<MemberVO> memberList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, " +
                    "MEMBER_GENDER, MEMBER_AGE, ADMIN_YN " +
                    "FROM MEMBER_TBL " +
                    "WHERE ADMIN_YN = 'N' " +  // 관리자는 제외코드 추가 
                    "ORDER BY MEMBER_ID";
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                MemberVO member = new MemberVO();
                member.setMemberId(rs.getString("MEMBER_ID"));
                member.setMemberPw(rs.getString("MEMBER_PW"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setMemberPhone(rs.getString("MEMBER_PHONE"));
                member.setMemberGender(rs.getString("MEMBER_GENDER"));
                member.setMemberAge(rs.getInt("MEMBER_AGE"));
                member.setAdminYn(rs.getString("ADMIN_YN"));
                
                memberList.add(member);
            }
            
            System.out.println("✅ 회원 목록 조회 성공: " + memberList.size() + "명");
            
        } catch (SQLException e) {
            System.err.println("회원 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return memberList;
    }
    
    /**
     * 회원 수 조회
     * @return 전체 회원 수
     */
    public int getMemberCount(Connection conn) {
        int count = 0;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT COUNT(*) FROM MEMBER_TBL";
        
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if (rs.next()) {
                count = rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.err.println("회원 수 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        
        return count;
    }
    
    /**
     * 아이디로 회원 검색
     * @return 회원 목록 list 
     */
    public List<MemberVO> searchMemberById(Connection conn, String memberId) {
        List<MemberVO> memberList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_PHONE, " +
                     "MEMBER_GENDER, MEMBER_AGE, ADMIN_YN " +
                     "FROM MEMBER_TBL " +
                     "WHERE MEMBER_ID LIKE ? " +   
                     "AND ADMIN_YN = 'N' " +       
                     "ORDER BY MEMBER_ID";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + memberId + "%"); 
            rs = pstmt.executeQuery();

            while(rs.next()) {
                MemberVO member = new MemberVO();
                member.setMemberId(rs.getString("MEMBER_ID"));
                member.setMemberPw(rs.getString("MEMBER_PW"));
                member.setMemberName(rs.getString("MEMBER_NAME"));
                member.setMemberPhone(rs.getString("MEMBER_PHONE"));
                member.setMemberGender(rs.getString("MEMBER_GENDER"));
                member.setMemberAge(rs.getInt("MEMBER_AGE"));
                member.setAdminYn(rs.getString("ADMIN_YN"));

                memberList.add(member);
            }

            System.out.println("✅ 회원 목록 조회 성공: " + memberList.size() + "명");

        } catch (SQLException e) {
            System.err.println("회원 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return memberList;
    }
}
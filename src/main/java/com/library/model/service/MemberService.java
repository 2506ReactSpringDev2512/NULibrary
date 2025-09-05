package com.library.model.service;

import java.sql.Connection;
import java.util.List;

import com.library.common.JDBCTemplate;
import com.library.model.dao.MemberDAO;
import com.library.model.vo.MemberVO;

public class MemberService {
    
    private MemberDAO memberDAO = MemberDAO.getInstance();
    
    public MemberVO loginMember(String memberId, String memberPw) {
        Connection conn = JDBCTemplate.getConnection();
        MemberVO loginUser = memberDAO.loginMember(conn, memberId, memberPw);
        JDBCTemplate.close(conn);
        return loginUser;
    }
    
    public boolean isIdDuplicated(String memberId) {
        Connection conn = JDBCTemplate.getConnection();
        MemberVO member = memberDAO.selectMemberById(conn, memberId);
        JDBCTemplate.close(conn);
        return member != null;
    }
    
    public int insertMember(MemberVO member) {
        Connection conn = JDBCTemplate.getConnection();
        int result = memberDAO.insertMember(conn, member);
        
        if(result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return result;
    }
    
    public int updateMember(MemberVO member) {
        Connection conn = JDBCTemplate.getConnection();
        int result = memberDAO.updateMember(conn, member);
        
        if(result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return result;
    }
    
    public int deleteMember(String memberId) {
        Connection conn = JDBCTemplate.getConnection();
        int result = memberDAO.deleteMember(conn, memberId);
        
        if(result > 0) {
            JDBCTemplate.commit(conn);
        } else {
            JDBCTemplate.rollback(conn);
        }
        
        JDBCTemplate.close(conn);
        return result;
    }
    
    public MemberVO getMemberById(String memberId) {
        Connection conn = JDBCTemplate.getConnection();
        MemberVO member = memberDAO.selectMemberById(conn, memberId);
        JDBCTemplate.close(conn);
        return member;
    }
    //memberList 출력
    public List<MemberVO> selectList(){
    	List<MemberVO> memberList = null;
    	Connection conn = JDBCTemplate.getConnection();
    	memberList = memberDAO.selectAllMembers(conn);
    	return memberList;
    	
    }
}

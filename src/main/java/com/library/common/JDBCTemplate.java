package com.library.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * JDBC 연결 및 자원 관리를 위한 공통 클래스
 */
public class JDBCTemplate {
    
    private static final String DRIVER_CLASS = "oracle.jdbc.driver.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe"; 
    private static final String USERNAME = "NUUSER"; 
    private static final String PASSWORD = "NUUSER";   
    
    // 싱글톤 패턴
    private static JDBCTemplate instance;
    
    private JDBCTemplate() {
        try {
            // JDBC 드라이버 로딩
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver를 찾을 수 없습니다.");
            e.printStackTrace();
        }
    }
    
    /**
     * 싱글톤 인스턴스 반환
     */
    public static JDBCTemplate getInstance() {
        if (instance == null) {
            synchronized (JDBCTemplate.class) {
                if (instance == null) {
                    instance = new JDBCTemplate();
                }
            }
        }
        return instance;
    }
    
    /**
     * DB 연결 객체 반환
     * @return Connection 객체
     */
    public static Connection getConnection() {
        Connection conn = null;
        
        try {
            // JDBC 드라이버 로딩 (매번 확인)
            Class.forName(DRIVER_CLASS);
            
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            conn.setAutoCommit(false); // 자동 커밋 해제 (트랜잭션 관리)
            
        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver를 찾을 수 없습니다: " + e.getMessage());
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("DB 연결 실패: " + e.getMessage());
            e.printStackTrace();
        }
        
        return conn;
    }
    
    /**
     * 트랜잭션 커밋
     * @param conn Connection 객체
     */
    public static void commit(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.commit();
            }
        } catch (SQLException e) {
            System.err.println("커밋 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * 트랜잭션 롤백
     * @param conn Connection 객체
     */
    public static void rollback(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.rollback();
            }
        } catch (SQLException e) {
            System.err.println("롤백 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * Connection 자원 해제
     * @param conn Connection 객체
     */
    public static void close(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            System.err.println("Connection 해제 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * PreparedStatement 자원 해제
     * @param pstmt PreparedStatement 객체
     */
    public static void close(PreparedStatement pstmt) {
        try {
            if (pstmt != null && !pstmt.isClosed()) {
                pstmt.close();
            }
        } catch (SQLException e) {
            System.err.println("PreparedStatement 해제 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * ResultSet 자원 해제
     * @param rs ResultSet 객체
     */
    public static void close(ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
        } catch (SQLException e) {
            System.err.println("ResultSet 해제 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    /**
     * 모든 자원 한번에 해제 (SELECT용)
     * @param conn Connection
     * @param pstmt PreparedStatement
     * @param rs ResultSet
     */
    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
        close(rs);
        close(pstmt);
        close(conn);
    }
    
    /**
     * Connection과 PreparedStatement 자원 해제 (INSERT/UPDATE/DELETE용)
     * @param conn Connection
     * @param pstmt PreparedStatement
     */
    public static void close(Connection conn, PreparedStatement pstmt) {
        close(pstmt);
        close(conn);
    }
    
    /**
     * DB 연결 테스트 메소드
     * @return 연결 성공 여부
     */
    public static boolean testConnection() {
        Connection conn = null;
        boolean isConnected = false;
        
        try {
            conn = getConnection();
            if (conn != null) {
                isConnected = true;
                System.out.println("✅ DB 연결 테스트 성공!");
                System.out.println("📊 연결 정보: " + conn.getMetaData().getURL());
                System.out.println("👤 사용자: " + conn.getMetaData().getUserName());
            }
        } catch (SQLException e) {
            System.err.println("❌ DB 연결 테스트 실패!");
            e.printStackTrace();
        } finally {
            close(conn);
        }
        
        return isConnected;
    }
    
    /**
     * 테스트용 메인 메소드
     */
    public static void main(String[] args) {
        System.out.println("=== JDBC Template 테스트 시작 ===");
        
        // DB 연결 테스트
        if (testConnection()) {
            System.out.println("🎉 JDBCTemplate 설정 완료!");
        } else {
            System.out.println("🚨 JDBCTemplate 설정 실패!");
            System.out.println("📝 다음 사항을 확인하세요:");
            System.out.println("   1. Oracle 서버가 실행 중인지 확인");
            System.out.println("   2. URL, USERNAME, PASSWORD 확인");
            System.out.println("   3. Oracle JDBC 드라이버가 클래스패스에 있는지 확인");
        }
        
        System.out.println("=== 테스트 종료 ===");
    }
}
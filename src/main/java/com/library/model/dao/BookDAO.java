package com.library.model.dao;

import java.sql.*;
import java.util.*;
import com.library.common.JDBCTemplate;
import com.library.model.vo.BookVO;

public class BookDAO {
    private static BookDAO instance = new BookDAO();
    private BookDAO() {}
    public static BookDAO getInstance() { return instance; }

    // 전체 도서 조회
    public List<BookVO> selectAllBooks(Connection conn) {
        List<BookVO> bookList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        //쿼리문
        String sql = "SELECT BOOK_NO, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER, BOOK_CATEGORY, LEND_YN, IS_POPULAR, IS_NEW FROM BOOK_TBL ORDER BY BOOK_NO";
        try {
        		pstmt = conn.prepareStatement(sql);
        		rs = pstmt.executeQuery(); 
        			
            while (rs.next()) {
                BookVO book = new BookVO();
                
                book.setBookNo(rs.getString("BOOK_NO"));
                book.setBookName(rs.getString("BOOK_NAME"));
                book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                book.setBookCategory(rs.getString("BOOK_CATEGORY"));
                book.setLendYn(rs.getString("LEND_YN"));
                book.setIsPopular(rs.getString("IS_POPULAR").charAt(0));
                book.setIsNew(rs.getString("IS_NEW").charAt(0));
                
                bookList.add(book);
            }
            System.out.println("✅ 전체 도서 조회 성공: " + bookList.size() + "권");
        } catch (SQLException e) {
        	System.err.println("도서 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(rs);
        	JDBCTemplate.close(pstmt);
        }
        return bookList;
}

    // 인기 도서 조회
    public List<BookVO> selectPopularBooks(Connection conn) {
        List<BookVO> booklist = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT BOOK_NO, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER, BOOK_CATEGORY, LEND_YN, IS_POPULAR, IS_NEW FROM BOOK_TBL WHERE IS_POPULAR = 'Y' ORDER BY BOOK_NO";
        try {
        	pstmt = conn.prepareStatement(sql);
        	rs = pstmt.executeQuery();  
        	while (rs.next()) {
                BookVO book = new BookVO();
                
                book.setBookNo(rs.getString("BOOK_NO")); 
                book.setBookName(rs.getString("BOOK_NAME"));
                book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                book.setBookCategory(rs.getString("BOOK_CATEGORY"));
                book.setLendYn(rs.getString("LEND_YN"));
                book.setIsPopular(rs.getString("IS_POPULAR").charAt(0));
                book.setIsNew(rs.getString("IS_NEW").charAt(0));
                
                booklist.add(book);
            }
            System.out.println("✅ 인기 도서 조회 완료: " + booklist.size() + "권");
        } catch (SQLException e) {
        	System.err.println("인기 도서 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
           JDBCTemplate.close(rs);
           JDBCTemplate.close(pstmt);
        }

        return booklist;
    }

    // 신간 도서 조회
    public List<BookVO> selectNewBooks(Connection conn) {
        List<BookVO> booklist = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT BOOK_NO, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER, BOOK_CATEGORY, LEND_YN, IS_POPULAR, IS_NEW FROM BOOK_TBL WHERE IS_NEW = 'Y' ORDER BY BOOK_NO";
        try {
        		pstmt = conn.prepareStatement(sql);
        		rs = pstmt.executeQuery(); 
        		
        	while (rs.next()) {
        	    BookVO book = new BookVO();
        	    
        	    book.setBookNo(rs.getString("BOOK_NO"));
        	    book.setBookName(rs.getString("BOOK_NAME"));
        	    book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
        	    book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
        	    book.setBookCategory(rs.getString("BOOK_CATEGORY"));
        	    book.setLendYn(rs.getString("LEND_YN"));
        	    book.setIsPopular(rs.getString("IS_POPULAR").charAt(0));
        	    book.setIsNew(rs.getString("IS_NEW").charAt(0));
        	    
        	    booklist.add(book);
        	}
            System.out.println("✅ 신간 도서 조회 성공: " + booklist.size() + "권");
        } catch (SQLException e) {
        	System.err.println("신간 도서 목록 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        }finally {
        	JDBCTemplate.close(rs);
        	JDBCTemplate.close(pstmt);
        }
        return booklist;
    }

    // 카테고리별 도서 조회
    public List<BookVO> selectBooksByCategory(Connection conn, String category) {
        List<BookVO> bookList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT BOOK_NO, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER, BOOK_CATEGORY, LEND_YN, IS_POPULAR, IS_NEW FROM BOOK_TBL WHERE BOOK_CATEGORY = ? ORDER BY BOOK_NO";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BookVO book = new BookVO();
                
                book.setBookNo(rs.getString("BOOK_NO"));
                book.setBookName(rs.getString("BOOK_NAME"));
                book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                book.setBookCategory(rs.getString("BOOK_CATEGORY"));
                book.setLendYn(rs.getString("LEND_YN"));
                book.setIsPopular(rs.getString("IS_POPULAR").charAt(0));
                book.setIsNew(rs.getString("IS_NEW").charAt(0));
                
                bookList.add(book);
            }
            System.out.println("✅ 카테고리별 도서 조회 성공 (" + category + "): " + bookList.size() + "권");
        } catch (SQLException e) {
            System.err.println("카테고리별 도서 조회 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return bookList;
    }

    // 도서 검색
    public List<BookVO> searchBooks(Connection conn, String keyword) {
        List<BookVO> bookList = new ArrayList<>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        // 통합검색 쿼리 (도서명, 저자, 출판사, 도서소개에서 모두 검색)
        String sql = "SELECT BOOK_NO, BOOK_NAME, BOOK_AUTHOR, BOOK_PUBLISHER, " +
                    "BOOK_CATEGORY, LEND_YN, IS_POPULAR, IS_NEW, BOOK_DESCRIPTION " +
                    "FROM BOOK_TBL " +
                    "WHERE BOOK_NAME LIKE ? OR BOOK_AUTHOR LIKE ? OR BOOK_PUBLISHER LIKE ? OR BOOK_DESCRIPTION LIKE ? " +
                    "ORDER BY BOOK_NO";
        
        try {
            pstmt = conn.prepareStatement(sql);
            String searchKeyword = "%" + keyword + "%";
            
            // 4개 파라미터 모두 같은 키워드로 설정
            pstmt.setString(1, searchKeyword); // BOOK_NAME
            pstmt.setString(2, searchKeyword); // BOOK_AUTHOR  
            pstmt.setString(3, searchKeyword); // BOOK_PUBLISHER
            pstmt.setString(4, searchKeyword); // BOOK_DESCRIPTION
            
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BookVO book = new BookVO();
                
                book.setBookNo(rs.getString("BOOK_NO"));
                book.setBookName(rs.getString("BOOK_NAME"));
                book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                book.setBookCategory(rs.getString("BOOK_CATEGORY"));
                book.setLendYn(rs.getString("LEND_YN"));
                book.setIsPopular(rs.getString("IS_POPULAR").charAt(0));
                book.setIsNew(rs.getString("IS_NEW").charAt(0));
                book.setBookDescription(rs.getString("BOOK_DESCRIPTION")); // 새 컬럼 추가
                
                bookList.add(book);
            }
            System.out.println("✅ 통합 검색 완료 (" + keyword + "): " + bookList.size() + "권");
        } catch (SQLException e) {
            System.err.println("도서 검색 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return bookList;
    }

    // 도서 소개 수정
    public int updateBookDescription(Connection conn, String bookNo, String description) {
        int result = 0;
        PreparedStatement pstmt = null;
        
        String sql = "UPDATE BOOK_TBL SET BOOK_DESCRIPTION = ? WHERE BOOK_NO = ?";
        
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, description);
            pstmt.setString(2, bookNo);
            
            result = pstmt.executeUpdate();
            System.out.println("✅ 도서 소개 수정 성공: " + bookNo);
        } catch (SQLException e) {
            System.err.println("도서 소개 수정 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(pstmt);
        }
        return result;
    }
    
 // 도서 상세정보 출력
    public BookVO selectBookByNo(Connection conn, String bookNo) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BookVO book = null;
        try {
            String sql = "SELECT * FROM BOOK_TBL WHERE BOOK_NO = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bookNo);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                book = new BookVO();
                book.setBookNo(rs.getString("BOOK_NO"));
                book.setBookName(rs.getString("BOOK_NAME"));
                book.setBookAuthor(rs.getString("BOOK_AUTHOR"));
                book.setBookPublisher(rs.getString("BOOK_PUBLISHER"));
                book.setBookCategory(rs.getString("BOOK_CATEGORY"));
                book.setLendYn(rs.getString("LEND_YN"));
                book.setIsPopular(rs.getString("IS_POPULAR").charAt(0));
                book.setIsNew(rs.getString("IS_NEW").charAt(0));
                book.setBookDescription(rs.getString("BOOK_DESCRIPTION"));
            }
            System.out.println("✅ 도서 정보 조회 성공: " + book.getBookName());
        } catch(Exception e) {
        	System.err.println("도서 검색 쿼리 실행 중 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
        	JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return book;
    }
    
    // 전체 도서 수 조회
    public int getTotalBookCount(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM BOOK_TBL";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return count;
    }
    
    // 대여 가능한 도서 수 조회
    public int getAvailableBookCount(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM BOOK_TBL WHERE LEND_YN = '대여가능'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return count;
    }
    
    // 대여 중인 도서 수 조회
    public int getRentedBookCount(Connection conn) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        try {
            String sql = "SELECT COUNT(*) FROM BOOK_TBL WHERE LEND_YN = '대여중'";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()) {
                count = rs.getInt(1);
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(rs);
            JDBCTemplate.close(pstmt);
        }
        return count;
    }
}
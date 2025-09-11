package com.library.model.service;

import java.sql.Connection;
import java.util.List;
import com.library.common.JDBCTemplate;
import com.library.model.dao.BookDAO;
import com.library.model.vo.BookVO;

public class BookService {
    private BookDAO bookDAO = BookDAO.getInstance();
    
    //전체 도서 목록 출력
    public List<BookVO> selectAllList() {
    	List<BookVO> bookList = null;
        Connection conn = JDBCTemplate.getConnection();
        bookList = bookDAO.selectAllBooks(conn);
        JDBCTemplate.close(conn);
        return bookList;
    }

    // 인기 도서 목록 출력
    public List<BookVO> selectPopularList() {
    	List<BookVO> bookPopularList = null;
        Connection conn = JDBCTemplate.getConnection();
        bookPopularList = bookDAO.selectPopularBooks(conn);
        JDBCTemplate.close(conn);
        return bookPopularList;
    }

    // 신간 도서 목록 출력
    public List<BookVO> selectNewList() {
    	List<BookVO> bookNewList = null;
        Connection conn = JDBCTemplate.getConnection();
        bookNewList = bookDAO.selectNewBooks(conn);
        JDBCTemplate.close(conn);
        return bookNewList;
    }

    // 카테고리별 도서 목록 출력
    public List<BookVO> selectBooksByCategory(String category) {
        List<BookVO> bookList = null;
        Connection conn = JDBCTemplate.getConnection();
        bookList = bookDAO.selectBooksByCategory(conn, category);
        JDBCTemplate.close(conn);
        return bookList;
    }

    // 도서 검색 (통합검색)
    public List<BookVO> searchBooks(String keyword, String searchType) {
        List<BookVO> bookList = null;
        Connection conn = JDBCTemplate.getConnection();
        bookList = bookDAO.searchBooks(conn, keyword);
        JDBCTemplate.close(conn);
        return bookList;
    }
    
    
    // 도서 소개 수정
    public boolean updateBookDescription(String bookNo, String description) {
        boolean result = false;
        Connection conn = JDBCTemplate.getConnection();
        
        try {
            int updateResult = bookDAO.updateBookDescription(conn, bookNo, description);
            
            if (updateResult > 0) {
                JDBCTemplate.commit(conn);
                result = true;
            } else {
                JDBCTemplate.rollback(conn);
            }
            
        } catch (Exception e) {
            JDBCTemplate.rollback(conn);
            System.err.println("도서 소개 수정 서비스 오류: " + e.getMessage());
            e.printStackTrace();
        } finally {
            JDBCTemplate.close(conn);
        }
        
        return result;
    }
    
    // 도서 상세정보 출력
    public BookVO getBookDetail(String bookNo) {
        Connection conn = JDBCTemplate.getConnection();
        BookVO book = bookDAO.selectBookByNo(conn, bookNo);
        JDBCTemplate.close(conn);
        return book;
    }
    
    // 전체 도서 수 조회
    public int getTotalBookCount() {
        Connection conn = JDBCTemplate.getConnection();
        int count = bookDAO.getTotalBookCount(conn);
        JDBCTemplate.close(conn);
        return count;
    }
    
    // 대여 가능한 도서 수 조회
    public int getAvailableBookCount() {
        Connection conn = JDBCTemplate.getConnection();
        int count = bookDAO.getAvailableBookCount(conn);
        JDBCTemplate.close(conn);
        return count;
    }
    
    // 대여 중인 도서 수 조회
    public int getRentedBookCount() {
        Connection conn = JDBCTemplate.getConnection();
        int count = bookDAO.getRentedBookCount(conn);
        JDBCTemplate.close(conn);
        return count;
    }
}
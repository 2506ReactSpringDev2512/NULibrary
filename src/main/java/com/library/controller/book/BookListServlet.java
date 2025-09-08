package com.library.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.model.service.BookService;
import com.library.model.vo.BookVO;

@WebServlet("/book/bookList")
public class BookListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookListServlet() {
    	super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        BookService bService = new BookService();
        List<BookVO> bookList = bService.selectAllList();


        // JSP로 전달
        if(bookList.size() > 0) {
        	request.setAttribute("bookList", bookList);
        	request.getRequestDispatcher("/book/bookList.jsp").forward(request, response);
        }
        
        // 로그 출력
        System.out.println("도서 목록 개수: " + bookList.size());
        for (BookVO b : bookList) {
        	System.out.println("도서 이름: " + b.getBookName());
        }

    }
    
    /**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

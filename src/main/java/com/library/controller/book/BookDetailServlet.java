package com.library.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.library.model.service.BookService;
import com.library.model.vo.BookVO;

/**
 * Servlet implementation class BookDetailServlet
 */
@WebServlet("/book/detail")
public class BookDetailServlet extends HttpServlet {
	private BookService bService = new BookService();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookDetailServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookNo = request.getParameter("bookNo");

        BookVO book = bService.getBookDetail(bookNo);

        if(book != null) {
            request.setAttribute("book", book);
            request.getRequestDispatcher("/book/bookDetail.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "해당 도서를 찾을 수 없습니다.");
            request.getRequestDispatcher("/common/error.jsp").forward(request, response);
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

package com.library.controller.book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.model.service.BookService;
import com.library.model.service.MemberService;
import com.library.model.vo.BookVO;

/**
 * Servlet implementation class MainBookListServlet
 */
@WebServlet("/main")
public class MainBookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainBookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("📌 MainBookListServlet 실행됨");// 실행 확인 구문
        BookService bService = new BookService();
        MemberService mService = new MemberService();
        
        List<BookVO> newBookList = bService.selectNewList();
        List<BookVO> popularBookList = bService.selectPopularList();
        
        // 도서관 통계 정보 조회
        int totalBookCount = bService.getTotalBookCount();
        int availableBookCount = bService.getAvailableBookCount();
        int rentedBookCount = bService.getRentedBookCount();
        int totalMemberCount = mService.getTotalMemberCount();
        
        //System.out.println("📌 신간 도서 조회 호출 완료");
        request.setAttribute("bookNewList", newBookList);
        
        //System.out.println("📌 인기 도서 조회 호출 완료");
        request.setAttribute("bookPopularList", popularBookList);
        
        // 통계 정보 전달
        request.setAttribute("totalBookCount", totalBookCount);
        request.setAttribute("availableBookCount", availableBookCount);
        request.setAttribute("rentedBookCount", rentedBookCount);
        request.setAttribute("totalMemberCount", totalMemberCount);

        request.getRequestDispatcher("/WEB-INF/views/main/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
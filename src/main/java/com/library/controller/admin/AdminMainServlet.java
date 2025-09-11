package com.library.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.library.model.service.BookService;
import com.library.model.service.MemberService;

/**
 * Servlet implementation class AdminMainServlet
 */
@WebServlet("/admin/main")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMainServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 로그인 체크
		HttpSession session = request.getSession();
		String loginAdmin = (String)session.getAttribute("loginAdmin");
		
		if(loginAdmin == null) {
			response.sendRedirect(request.getContextPath() + "/admin/login");
			return;
		}
		
		MemberService memberService = new MemberService();
        BookService bookService = new BookService();

        int totalMemberCount = memberService.getTotalMemberCount();// 총 회원수
        int totalBookCount = bookService.getTotalBookCount();// 총 도서 수
        int rentedBookCount = bookService.getRentedBookCount();// 대여중인 도서 
        int availableBookCount = bookService.getAvailableBookCount(); // 대여 가능 도ㅓㅅ

        // JSP로 넘기기
        request.setAttribute("totalMemberCount", totalMemberCount);
        request.setAttribute("totalBookCount", totalBookCount);
        request.setAttribute("rentedBookCount", rentedBookCount);
        request.setAttribute("availableBookCount", availableBookCount);

		// 관리자 메인 페이지로 포워드
		request.getRequestDispatcher("/admin/adminMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package com.library.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

import com.library.model.service.MemberService;
import com.library.model.vo.MemberVO;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 로그인 페이지로 포워드
		request.getRequestDispatcher("/WEB-INF/views/admin/adminLogin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String adminId = request.getParameter("adminId");
		String adminPassword = request.getParameter("adminPassword");
		
		MemberService memberService = new MemberService();
		MemberVO loginMember = memberService.loginMember(adminId, adminPassword);
		
		HttpSession session = request.getSession();
		
		if(loginMember != null && "Y".equals(loginMember.getAdminYn())) {
			// 관리자 로그인 성공
			session.setAttribute("loginAdmin", loginMember.getMemberName());
			session.setAttribute("adminMember", loginMember);
			response.sendRedirect(request.getContextPath() + "/admin/main");
		} else {
			// 로그인 실패 또는 관리자가 아님
			if(loginMember == null) {
				session.setAttribute("errorMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			} else {
				session.setAttribute("errorMsg", "관리자 권한이 없습니다.");
			}
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
	}

}

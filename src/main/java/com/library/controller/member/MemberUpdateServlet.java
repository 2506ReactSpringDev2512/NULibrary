package com.library.controller.member;

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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 개인정보 수정 페이지로 포워드
		HttpSession session = request.getSession();
		String loginUser = (String)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect(request.getContextPath() + "/main");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/views/member/mypage.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String loginUser = (String)session.getAttribute("loginUser");
		MemberVO loginMember = (MemberVO)session.getAttribute("loginUserVO");
		
		if(loginUser == null || loginMember == null) {
			response.sendRedirect(request.getContextPath() + "/main");
			return;
		}
		
		// 폼에서 데이터 받기
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		String memberName = request.getParameter("memberName");
		String memberPhone = request.getParameter("memberPhone");
		String memberAge = request.getParameter("memberAge");
		
		// 현재 비밀번호 확인
		if(!loginMember.getMemberPw().equals(currentPassword)) {
			session.setAttribute("errorMsg", "현재 비밀번호가 일치하지 않습니다.");
			response.sendRedirect(request.getContextPath() + "/member/update");
			return;
		}
		
		// 새 비밀번호 확인
		String passwordToUpdate = loginMember.getMemberPw(); // 기본값은 현재 비밀번호
		if(newPassword != null && !newPassword.trim().isEmpty()) {
			if(!newPassword.equals(confirmPassword)) {
				session.setAttribute("errorMsg", "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
				response.sendRedirect(request.getContextPath() + "/member/update");
				return;
			}
			passwordToUpdate = newPassword;
		}
		
		// 업데이트할 회원 정보 생성
		MemberVO updateMember = new MemberVO();
		updateMember.setMemberId(loginMember.getMemberId());
		updateMember.setMemberPw(passwordToUpdate);
		updateMember.setMemberName(memberName);
		updateMember.setMemberPhone(memberPhone);
		updateMember.setMemberGender(loginMember.getMemberGender());
		updateMember.setMemberAge(Integer.parseInt(memberAge));
		updateMember.setAdminYn(loginMember.getAdminYn());
		
		// 회원정보 수정 실행
		MemberService memberService = new MemberService();
		int result = memberService.updateMember(updateMember);
		
		if(result > 0) {
			// 성공시 세션 정보 업데이트
			session.setAttribute("loginUser", updateMember.getMemberName());
			session.setAttribute("loginUserVO", updateMember);
			session.setAttribute("successMsg", "회원정보가 성공적으로 수정되었습니다.");
			response.sendRedirect(request.getContextPath() + "/main");
		} else {
			session.setAttribute("errorMsg", "회원정보 수정에 실패했습니다. 다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/member/update");
		}
	}
}
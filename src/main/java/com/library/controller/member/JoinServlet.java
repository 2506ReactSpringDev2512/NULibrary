package com.library.controller.member;

import java.io.IOException;

import com.library.model.service.MemberService;
import com.library.model.vo.MemberVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/member/join")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/join.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		 // 1. 클라이언트에서 넘어온 값 받기
	    String memberId = request.getParameter("memberId");
	    String memberPw = request.getParameter("memberPw");
	    String memberPwConfirm = request.getParameter("memberPwConfirm");
	    String memberName = request.getParameter("memberName");
	    String memberPhone = request.getParameter("memberPhone");
	    String memberGender = request.getParameter("memberGender");
	    int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	    
	    String adminYN = request.getParameter("adminYn"); // 체크되어 있으면 "Y", 아니면 null
	    if(adminYN == null) {
	        adminYN = "N";
	    }

	    // 2. Service 호출
	    MemberService mService = new MemberService();
	    
	    // 3. 아이디 중복 체크
	 		MemberVO existingMember = mService.getMemberById(memberId);
	 		if (existingMember != null) {
	 			session.setAttribute("errorMsg", "이미 사용 중인 아이디입니다.");
	 			response.sendRedirect(request.getContextPath() + "/member/join");
	 			return;
	 		}
	 		
	    // 4. 비밀번호 확인 체크
	    	if(!memberPw.equals(memberPwConfirm)) {
	    		session.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
	    		response.sendRedirect(request.getContextPath() + "/member/join");
	    		return;
	    	}

	    // 5. VO 객체에 담기
	    MemberVO member = new MemberVO();
	    member.setMemberId(memberId);
	    member.setMemberPw(memberPw);
	    member.setMemberName(memberName);
	    member.setMemberPhone(memberPhone);
	    member.setMemberGender(memberGender);
	    member.setMemberAge(memberAge);
	    member.setAdminYn(adminYN);

	    // 6. 회원가입 처리
	    int result = mService.insertMember(member);

	    if(result > 0) {
	    	session.setAttribute("successMsg", "회원가입이 완료되었습니다!");
	    	response.sendRedirect(request.getContextPath() + "/main");
	    } else {
	    	session.setAttribute("errorMsg", "회원가입에 실패했습니다. 다시 시도해주세요.");
			response.sendRedirect(request.getContextPath() + "/member/join");
	    }
	}
}


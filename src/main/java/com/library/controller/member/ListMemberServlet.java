package com.library.controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.library.model.service.MemberService;
import com.library.model.vo.MemberVO;

/**
 * Servlet implementation class ListMemberServlet
 */
@WebServlet("/admin/memberManage")
public class ListMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListMemberServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberService mService = new MemberService();
		List<MemberVO> memberList = mService.selectList();
		
		if(memberList.size() > 0) {
			request.setAttribute("memberList", memberList);
			request.getRequestDispatcher("/admin/memberManage.jsp").forward(request, response);
		}
		
		System.out.println("회원 목록 개수: " + memberList.size());
		for(MemberVO m : memberList) {
		    System.out.println("회원 아이디: " + m.getMemberId());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

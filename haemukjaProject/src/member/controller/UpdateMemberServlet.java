package member.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/update.me")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
       request.setCharacterEncoding("UTF-8");
      
       
       
       
       String mpw = request.getParameter("join-pwd");
       String tel1 = request.getParameter("join-phone1");
       String tel2 = request.getParameter("join-phone2");
       String tel3 = request.getParameter("join-phone3");
       
       String mtel = tel1 + "-" + tel2 + "-" + tel3;
       
	   String email = request.getParameter("join-email");
	   String mnickname = request.getParameter("join-nickname");
	   	
		HttpSession session = request.getSession();
		Member member = (Member)(session.getAttribute("loginMember"));
		String mid = member.getMid();
	   
		int result = new MemberService().updateMember(mpw, mtel, email, mnickname , mid);
		
		if(result >0) {
			  Member updateMember = new Member(mid, mpw);
			  
			  Member loginMember = new MemberService().loginMember(updateMember);
			  session = request.getSession();
			  session.setAttribute("loginMember", loginMember);

			  System.out.println("회원수정 결과 : " + result);
			  response.sendRedirect("mypage/mypageUpdate.jsp"); 
		}else {

	}		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class FindPwdServlet
 */
@WebServlet("/pwd.me")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberService ms = new MemberService();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		int findResult = ms.findPwd(id, name, email);
		String changedPwd = ms.selectPwd(id);
		
		RequestDispatcher view = request.getRequestDispatcher("member/findPwd.jsp");
		if(findResult > 0) {	//새 비밀번호까지 주어진 경우
			try {
				ms.sendEmail(email, changedPwd);
			} catch (Exception e) {
				e.printStackTrace();
			}	//이메일 전송 완료
			request.setAttribute("msg", "회원님의 이메일로 임시 비밀번호가 발급되었습니다.");
		}else {
			request.setAttribute("msg", "회원 정보를 찾지 못했습니다.");
		}
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

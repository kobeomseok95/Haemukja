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
 * Servlet implementation class LoginShopServlet
 */
@WebServlet("/loginsShop.me")
public class LoginShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginShopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
	    String pw = request.getParameter("password");
//	      일반회원만 로그인되게 하므로 타입은 필요가 없다(범석)
	    String userType = request.getParameter("userType");
	      
	    HttpSession session = null;   
	    RequestDispatcher view = null;
//	      if(userType.equals("member")) { 범석
	    Member member = new Member(id, pw);
	    Member loginMember = new MemberService().loginMember(member);

       if(loginMember != null) {
          session = request.getSession();
          session.setAttribute("loginMember", loginMember);
          view = request.getRequestDispatcher("/mainList.sh");
       } 
		else {	
			view = request.getRequestDispatcher("member/loginHaemukshop.jsp");
          request.setAttribute("msg", "회원 정보가 없습니다");
		}
//	      } 
//	      		샵에서는 비회원일 경우 일반회원만 로그인만 되게 Seller파트는 주석(범석)
//	      else { 
//	         Seller seller = new Seller(id, pw);
//	         Seller loginSeller = new MemberService().loginSeller(seller);
//
//	         if(loginSeller != null) {
//	            session = request.getSession();
//	            session.setAttribute("loginSeller", loginSeller);
//	            view = request.getRequestDispatcher("/main.re");
//	         } else {
//	        	 view = request.getRequestDispatcher("member/loginHaemukja.jsp");
//		         request.setAttribute("msg", "회원 정보가 없습니다");
//	         } 
//	      }
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

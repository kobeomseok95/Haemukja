package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.Seller;


@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
        String pw = request.getParameter("password");
        String userType = request.getParameter("userType");
        String ch = request.getParameter("rememberId");
       Cookie idCookie = null;
       Cookie typeCookie = null;
        
        HttpSession session = null;
        RequestDispatcher view = null;
        if(userType.equals("member")) {
           Member member = new Member(id, pw);
           Member loginMember = new MemberService().loginMember(member);

           if(loginMember != null) {
             if(ch != null) {
               idCookie = new Cookie("ch", id);
               idCookie.setMaxAge(60);
               typeCookie = new Cookie("type", userType);
               typeCookie.setMaxAge(60);
               response.addCookie(idCookie);
               response.addCookie(typeCookie);
             } else {
                idCookie = new Cookie("ch", id);
               idCookie.setMaxAge(0);
               typeCookie = new Cookie("type", userType);
               typeCookie.setMaxAge(0);
               response.addCookie(idCookie);
               response.addCookie(typeCookie);
             }
              session = request.getSession();
              session.setAttribute("loginMember", loginMember);
              view = request.getRequestDispatcher("/main.re");
           } else {
              view = request.getRequestDispatcher("member/loginHaemukja.jsp");
              request.setAttribute("msg", "회원 정보가 없습니다");
           }
        } else {
           Seller seller = new Seller(id, pw);
           Seller loginSeller = new MemberService().loginSeller(seller);

           if(loginSeller != null) {
              if(ch!=null) {
                 idCookie = new Cookie("ch", id);
               idCookie.setMaxAge(60);
               typeCookie = new Cookie("type", userType);
               typeCookie.setMaxAge(60);
               response.addCookie(idCookie);
               response.addCookie(typeCookie);
              } else {
                 idCookie = new Cookie("ch", id);
               idCookie.setMaxAge(0);
               typeCookie = new Cookie("type", userType);
               typeCookie.setMaxAge(0);
               response.addCookie(idCookie);
               response.addCookie(typeCookie);
              }
              session = request.getSession();
              session.setAttribute("loginSeller", loginSeller);
              view = request.getRequestDispatcher("/main.re");
           } else {
              view = request.getRequestDispatcher("member/loginHaemukja.jsp");
              request.setAttribute("msg", "회원 정보가 없습니다");
           } 
        }
        view.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

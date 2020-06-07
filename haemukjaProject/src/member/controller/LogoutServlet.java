package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/logout.me")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = null;
	      String url = request.getHeader("REFERER");
	      request.getSession().invalidate();
	      
	      if(url.contains(".sh")) {   //해먹샵에서 로그아웃 될 경우
	         view = request.getRequestDispatcher("/mainList.sh");
	      } else {
	         view = request.getRequestDispatcher("/main.re");
	      }
	      
	      view.forward(request, response);
	      
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

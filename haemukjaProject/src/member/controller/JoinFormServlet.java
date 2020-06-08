package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.scene.control.Alert;
import member.model.service.MemberService;
import member.model.vo.Member;
/**
 * Servlet implementation class JoinFormServlet
 */
@WebServlet("/join.me")
public class JoinFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*		String test = request.getParameter("joinType");
	    System.out.println(test);*/
		request.setCharacterEncoding("UTF-8");
		
		
		String mid = request.getParameter("join-id"); 	
		String mpw = request.getParameter("join-pwd");  			
		String mname = request.getParameter("join-name");    		 		
		String tel= request.getParameter("join-phone");
		String tel3= request.getParameter("join-phone3");	
		String tel2= request.getParameter("join-phone2");
		String maddr = request.getParameter("join-residence2");
		String maddr2 = request.getParameter("join-residence3");
		String email = request.getParameter("join-email");
		String no = request.getParameter("join-address");  
		String no2 = request.getParameter("join-address2");
		String mnickname = request.getParameter("join-nickname");
		String mcode = request.getParameter("join-residence");
		
		String mtel = tel + "-" + tel2 + "-" + tel3;
		String addr = maddr + maddr2;
		String mno = no + "-" + no2;
		
		
		Member member = new Member(mid, mpw, mname, mtel, maddr, email, mno, mnickname, mcode);
		
		
		  int result = new MemberService().insertMember(member);
		 
		  if(result >0 ) {
			  
			 
		  }else {
			  System.out.println("�쉶�썝媛��엯 �떎�뙣");
		  }
		  
		  RequestDispatcher view = request.getRequestDispatcher("/main.re");
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

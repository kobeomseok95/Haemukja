package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Seller;

/**
 * Servlet implementation class SellerJoinFormServlet
 */
@WebServlet("/sellerjoin.me")
public class SellerJoinFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerJoinFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String sid = request.getParameter("seller-id");
		String spw = request.getParameter("seller-pwd");
		String company = request.getParameter("seller-name");
		String tel= request.getParameter("seller-phone");	
		String tel2= request.getParameter("seller-phone2");
		String tel3= request.getParameter("seller-phone3");
		String addr = request.getParameter("seller-residence2");
		String addr2 = request.getParameter("seller-residence3");
		String no = request.getParameter("seller-address");  
		String no2 = request.getParameter("seller-address2");
		String scode = request.getParameter("seller-residence");
		
		String stel = tel + "-" + tel2 + "-" + tel3;
		String caddr = addr + addr2;
		String cno =  no + "-" + no2;
		
		Seller seller = new Seller(sid, spw, company, stel, caddr, cno, scode);
		
		int result = new MemberService().insertMember(seller);
		
		if(result > 0){
			
		}else {
			System.out.println("판매 회원가입 실패");
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

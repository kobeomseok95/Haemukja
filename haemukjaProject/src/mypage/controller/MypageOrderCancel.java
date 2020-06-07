package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class MypageOrderCancel
 */
@WebServlet("/cancel.my")
public class MypageOrderCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderCancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int oid = Integer.valueOf(request.getParameter("oid"));
		
		int pid = Integer.valueOf(request.getParameter("pid"));
		
		int result = new MypageService().cancelOrder(oid,pid);
		RequestDispatcher view = null;
		if(result>0) {
			request.setAttribute("msg", "주문취소가 완료 되었습니다.");
			view= request.getRequestDispatcher("member/orderResult.jsp");
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

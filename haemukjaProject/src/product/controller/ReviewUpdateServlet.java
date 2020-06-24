package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import product.model.service.ProductService;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/updateReview.sh")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		String userId = member.getMid();
		String content = request.getParameter("review");
		String odate = request.getParameter("odate");
		String sbno = request.getParameter("sbno");
		String oid = request.getParameter("oid");
		
		int result = new ProductService().updateReview(userId,content,oid);
		
		RequestDispatcher view = null;
		if(result>0) {
			request.setAttribute("msg", "리뷰 수정이 완료되었습니다.");
			view= request.getRequestDispatcher("myreview.my");
			
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

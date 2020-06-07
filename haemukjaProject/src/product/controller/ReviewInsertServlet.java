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
 * Servlet implementation class ReviewInsertServlet
 */
@WebServlet("/review.sh")
public class ReviewInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	      
		String odate = request.getParameter("odate");
		System.out.println("odate :" + odate);
		int sbno = Integer.valueOf(request.getParameter("sbno"));
		System.out.println("sbno :" + sbno);
		String review= request.getParameter("review");
		System.out.println("review : " +review );

		HttpSession session = request.getSession();
		Member member = (Member)(session.getAttribute("loginMember"));
		String userId = member.getMid();
      
		int result = new ProductService().review(odate,sbno,review,userId);
		RequestDispatcher view = null;      
		if(result>0) {
			request.setAttribute("msg", "리뷰작성이 완료되었습니다.");
			view=request.getRequestDispatcher("order.my");
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

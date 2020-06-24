package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Attachment;
import member.model.vo.Member;
import mypage.model.service.MypageService;
import product.model.vo.Review;

/**
 * Servlet implementation class MyReviewListServlet
 */
@WebServlet("/myreview.my")
public class MyReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReviewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)(session.getAttribute("loginMember"));
		
		String userId = member.getMid();
		MypageService mService = new MypageService();
		ArrayList<Review> review = mService.selectReview(userId);
		ArrayList<Attachment> flist = mService.selectThumbnail();
		
		RequestDispatcher view = null;
		
		if(!review.isEmpty()&&!flist.isEmpty()) {
			request.setAttribute("flist", flist);
			request.setAttribute("review", review);
			
		}
		view = request.getRequestDispatcher("mypage/myReview.jsp");
	
		
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

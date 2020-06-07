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
import mypage.model.vo.MCart;
import mypage.model.vo.PageInfo;
import product.model.vo.Sale;

/**
 * Servlet implementation class MypageCartServlet
 */
@WebServlet("/cart.my")
public class MypageCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageCartServlet() {
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
				
		int listCount = mService.getListCount(userId);
		
		int currentPage;	// 현재 페이지를 저장할 변수
		int limit;			// 한 페이지에 보여질 게시글 수
		int maxPage;		// 전체 페이지의 맨 마지막 페이지
		int startPage;		// 한번에 표시될 페이지가 시작할 페이지
		int endPage;		// 한번에 표시될 페이지가 끝나는 페이지
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
		}else {
			currentPage = 1;
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount/limit + 1);
		startPage =(((int)((double)currentPage/limit+0.9))-1)*limit +1;
		endPage = startPage +limit-1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		
		ArrayList<MCart> list = mService.selectList(currentPage,limit,userId);
		
		ArrayList<Attachment> flist = mService.selectThumbnail();
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("mypage/mypageCart.jsp");
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.setAttribute("pi", pi);
		
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

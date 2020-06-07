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
import mypage.model.vo.MyOrder;
import mypage.model.vo.PageInfo;

/**
 * Servlet implementation class MypageOrderServlet
 */
@WebServlet("/order.my")
public class MypageOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)(session.getAttribute("loginMember"));
		String msg=(String)request.getAttribute("msg");
		String userId = member.getMid();
		MypageService mService = new MypageService();
		
		// 1_1. 게시판 리스트 갯수 구하기
		int listCount = mService.getOrderListCount(userId);
		// BoardService에 getListCount()만들러 가자!
		
//		System.out.println("나오나?"+listCount);
		
		// --------- 페이징 처리 추가 ------------
		// 페이지 수 처리용 변수 선언
		
		int currentPage;	// 현재 페이지를 저장할 변수
		int limit;			// 한 페이지에 보여질 게시글 수
		int maxPage;		// 전체 페이지의 맨 마지막 페이지
		int startPage;		// 한번에 표시될 페이지가 시작할 페이지
		int endPage;		// 한번에 표시될 페이지가 끝나는 페이지
		
		// * currentPage - 현재 페이지
		// 기본 게시판 페이지는 1페이지부터 시작
		currentPage = 1;
		// 하지만 페이지 전환시 전달받은 현재 페이지가 있을 시 해당 페이지를 currentPage로 적용
		if(request.getParameter("currentPage") != null){
			// getParameter은 스트링을 반환
			
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
//			String -> Int
			
		
		}else {
			currentPage = 1;
		}
		
		// * limit - 한 페이지에 보여질 목록 갯수
		limit = 10;
		
		// * maxPAge - 총 페이지 
		// 목록 수가 123개 이면  페이지 수는 13페이지가 됨
		maxPage = (int)((double)listCount/limit + 1);
		
		// * startPage - 현재 페이지에 보여질  시작 페이지 수
		// 	아래쪽에 페이지 수가 10개씩 보여지게 할 경우
		// 1, 11, 21, 31, ...
		startPage =(((int)((double)currentPage/limit+0.9))-1)*limit +1;
		
		// * endPage - 현재 페이지에 보여질 마지막 페이지 수
		// 아래쪽에 페이지 수가 10개씩 보여지게 할 경우
		// 10, 20, 30 ,40, ...
		endPage = startPage +limit-1;
		
		// maxPage(총 페이지 수)가 endPage보다 작을 경우
		// ex) maxPage => 13이고 endPage => 20이면
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		
		ArrayList<MyOrder> list = mService.selectOrderList(currentPage,limit,userId);
		ArrayList<Attachment> flist = mService.selectThumbnail();
		 
		RequestDispatcher view = null;
	
		request.setAttribute("list", list);
		request.setAttribute("flist", flist);
		request.setAttribute("pi", pi);
		request.setAttribute("msg", msg);
		view = request.getRequestDispatcher("mypage/mypageOrder.jsp");
	
		
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

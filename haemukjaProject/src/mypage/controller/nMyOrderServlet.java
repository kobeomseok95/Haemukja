package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MypageService;
import mypage.model.vo.NMOrder;

/**
 * Servlet implementation class nMyOrderServlet
 */
@WebServlet("/nmorder.my")
public class nMyOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nMyOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String oid = request.getParameter("oid");
		
		NMOrder no = new MypageService().selectNmOrder(oid);
		
		RequestDispatcher view = null;
		if(no!=null) {
			request.setAttribute("no", no);
			view = request.getRequestDispatcher("mypage/nmOrderResult.jsp");
		}else {
			request.setAttribute("msg", "검색결과가 없습니다.");
			view =request.getRequestDispatcher("mypage/nmOrderResult.jsp");
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

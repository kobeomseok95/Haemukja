package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.PageInfo;
import member.model.vo.Seller;
import product.model.service.ProductService;
import product.model.vo.Order;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/list.or")
public class OrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = ((Seller)(request.getSession().getAttribute("loginSeller"))).getSid();
		ProductService ps = new ProductService();
		
		int listCount = ps.getListCount2(sId);
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
		} else {
			currentPage = 1;
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount / limit + 1);
		startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit + 1;
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Order> olist = ps.selectOlist(currentPage, limit, sId);
		
		ArrayList<String> pTitles = ps.selectPtitles(olist); 
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("seller/sellerPageOrder.jsp");
		request.setAttribute("olist", olist);
		request.setAttribute("pTitles", pTitles);
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

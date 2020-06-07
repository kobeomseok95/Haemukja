package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Attachment;
import product.model.service.ProductService;

/**
 * Servlet implementation class nonMemSellServlet
 */
@WebServlet("/nonmember.me")
public class nonMemSellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nonMemSellServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String ptitle= request.getParameter("product");
		int price = Integer.valueOf(request.getParameter("price"));
		int sbno = Integer.valueOf(request.getParameter("sbno"));
		int pcount = Integer.valueOf(request.getParameter("pcount"));
		int pid = Integer.valueOf(request.getParameter("pid"));
		
		int amprice = pcount*price; // 총가격
		
		Attachment thumbnail = new ProductService().selectThumbnail(sbno);
		
		RequestDispatcher view = null;
		request.setAttribute("ptitle", ptitle);
		request.setAttribute("price", price);
		request.setAttribute("pcount", pcount);
		request.setAttribute("amprice", amprice);
		request.setAttribute("thumbnail", thumbnail);
		request.setAttribute("pid", pid);
		view = request.getRequestDispatcher("member/nonMember.jsp");
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

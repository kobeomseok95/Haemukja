package product.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;
import member.model.vo.Seller;
import product.model.service.ProductService;

/**
 * Servlet implementation class UpdateOrderServlet
 */
@WebServlet("/update.or")
public class UpdateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int oId = 0;
		int shipNo = 0;
		try {
			oId = Integer.parseInt(request.getParameter("oId"));
			shipNo = Integer.parseInt(request.getParameter("shipNo"));
		} catch(NumberFormatException e) {
			e.getStackTrace();
		}
		String shipCom = request.getParameter("shipCom");
		
		int result = new ProductService().updateOrder(oId, shipCom, shipNo);

		HttpSession session = request.getSession();
		Seller loginSeller = (Seller)(session.getAttribute("loginSeller"));
		session.setAttribute("loginSeller", loginSeller);
		RequestDispatcher view = request.getRequestDispatcher("list.or");
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

package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Seller;
import product.model.service.ProductService;
import product.model.vo.Product;

/**
 * Servlet implementation class InsertProductServlet
 */
@WebServlet("/insert.pr")
public class InsertProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = ((Seller)(request.getSession().getAttribute("loginSeller"))).getSid();
		
		String[] pCode = request.getParameterValues("pCode");
		String[] productName = request.getParameterValues("productName");
		String[] price = request.getParameterValues("price");
		String[] discount = request.getParameterValues("discount");
		String[] amount = request.getParameterValues("amount");
		
		ArrayList<Product> plist = new ArrayList<>();
		try {
			for(int i = 0; i < productName.length; i++) {
				Product p = new Product();
				p.setpTitle(productName[i]);
				p.setPrice(Integer.parseInt(price[i]));
				p.setpAmount(Integer.parseInt(amount[i]));
				p.setsId(id);
				p.setpDiscount(Integer.parseInt(discount[i]));
				p.setpCode(pCode[i]);
				
				plist.add(p);
			}
			
		} catch(NumberFormatException e) {
			e.getStackTrace();
		}
		
		int result = new ProductService().insertProudct(plist);
		
		RequestDispatcher view = null;
		if(result > 0) {
			view = request.getRequestDispatcher("seller/sellerPageInsert.jsp");
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

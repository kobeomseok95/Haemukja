package product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.model.service.ProductService;

/**
 * Servlet implementation class DeleteSaleServlet
 */
@WebServlet("/deleteSale.sh")
public class DeleteSaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sbno = Integer.valueOf(request.getParameter("sbno"));
		int result = new ProductService().deleteSale(sbno);
		
		if(result > 0) {
			request.getRequestDispatcher("mainList.sh").forward(request, response);
		} else {
			//404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Attachment;
import product.model.service.ProductService;
import product.model.vo.Sale;

/**
 * Servlet implementation class ShopMainListServlet
 */
@WebServlet("/mainList.sh")
public class ShopMainListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopMainListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductService ps = new ProductService();
		
		ArrayList<Sale> slist = ps.selectSList();	

		ArrayList<Attachment> flist = new ArrayList<>();
		for(int i = 0; i < slist.size(); i++) {
			Attachment at = ps.selectThumbnail(slist.get(i).getSbNo());
			flist.add(at);
		}
		
		ArrayList<String> companies = new ArrayList<>();
		for(int i = 0; i < slist.size(); i++) {
			String company = ps.selectCompany(slist.get(i).getsId(), slist.get(i).getSbNo());
			companies.add(company);
		}
		
			
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("haemukshop/haemukshopMain.jsp");
		request.setAttribute("slist", slist);
		request.setAttribute("flist", flist);
		request.setAttribute("companies", companies);
		
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

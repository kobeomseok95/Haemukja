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
import common.PageInfo;
import product.model.service.ProductService;
import product.model.vo.Sale;

/**
 * Servlet implementation class ShopListServlet
 * @param <ShopService>
 */
@WebServlet("/list.sh")
public class ShopListServlet<ShopService> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String sbKind = request.getParameter("sbKind");
		
		ProductService ps = new ProductService();
		
		int listCount = ps.getListSCount(sbKind);
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
		
		PageInfo sp = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Sale> sList = ps.selectCaList(currentPage, limit, sbKind);
		
		ArrayList<Attachment> files = new ArrayList<>();
		for(int i = 0; i < sList.size(); i++) {
			Attachment a = new ProductService().selectThumbnail(sList.get(i).getSbNo());
			files.add(a);
		}
		
		ArrayList<String> companies = new ArrayList<>();
		for(int i = 0; i < sList.size(); i++) {
			String company = ps.selectCompany(sList.get(i).getsId(), sList.get(i).getSbNo());
			companies.add(company);
		}
		
	    RequestDispatcher view = null;
	    view = request.getRequestDispatcher("haemukshop/haemukshopList.jsp"); 	
	    request.setAttribute("sList", sList);
	    request.setAttribute("files", files);
	    request.setAttribute("companies", companies);
	    request.setAttribute("sp", sp);
	    	
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

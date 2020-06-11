package product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import product.model.service.ProductService;
import product.model.vo.Sale;

/**
 * Servlet implementation class SearchSaleServlet
 */
@WebServlet("/search.sa")
public class SearchSaleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSaleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchContent = request.getParameter("tag");
		
		ArrayList<Sale> slist = new ProductService().selectSList(searchContent);
		
		Sale sale = null;
		JSONObject saleObj = null;
		JSONArray saleArray = new JSONArray();
		
		for(int i = 0; i < slist.size(); i++) {
			saleObj = new JSONObject();
			
			saleObj.put("sbNo", slist.get(i).getSbNo());
			saleObj.put("sbTitle", slist.get(i).getSbTitle());
			saleObj.put("company", slist.get(i).getCompany());
			
			saleArray.add(saleObj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(saleArray);
		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

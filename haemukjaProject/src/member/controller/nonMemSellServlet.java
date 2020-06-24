package member.controller;

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
		String[] ptitle= request.getParameterValues("product");
		String[] price = request.getParameterValues("price");
		String[] sbno = request.getParameterValues("sbno");
		String[] pcount = request.getParameterValues("pcount");	//수량
		String[] pid = request.getParameterValues("pid");
		
		int [] sbno2 = new int[sbno.length];
		
		for(int i = 0;i<sbno.length;i++){
			sbno2[i] = Integer.parseInt(sbno[i]);	
		}
		
		
		ArrayList<String> pidList= new ArrayList<String>();
		for(int i =0 ; i<pid.length;i++) {
			pidList.add(pid[i]);
		}
		
		
		ArrayList<String> ptitleList= new ArrayList<String>();
		for(int i =0 ; i<pid.length;i++) {
			ptitleList.add(ptitle[i]);
		}
		
		

		 
		ArrayList<String> camountAr= new ArrayList<String>();	//수량
		for(int i =0 ; i<pid.length;i++) {
			camountAr.add(pcount[i]);
		}
		
		
	
		ArrayList<Integer> sbNo = new ArrayList<Integer>();
		for(int i = 0; i<pid.length;i++) {
			sbNo.add(sbno2[i]);
		}
		
		 
		 // camount[] 형변환
		int [] camount2 = new int[pcount.length];
		
		for(int i = 0;i<pcount.length;i++){
		
		camount2[i] = Integer.parseInt(pcount [i]);	
		}
		
		
		int [] price2 = new int[price.length];
		
		for(int i = 0;i<price.length;i++){
		
		price2[i] = Integer.parseInt(price [i]);	
		}
		
		
		int[] amprice = new int[price.length]; //총가격
		 for(int i = 0;i<price.length;i++) {
			amprice[i] = camount2[i]*price2[i];
		}
		
		 
		ArrayList<Integer> ampriceAr= new ArrayList<Integer>();
		for(int i =0 ; i<pid.length;i++) {
			ampriceAr.add(amprice[i]);
		}
		 
		int allamprice = 0; // 총결제가격
		for(int i = 0; i<pid.length; i++) {
			allamprice += ampriceAr.get(i);
		}
		
	
		
		ArrayList<Attachment> thumbnailList = new ArrayList<Attachment>();
		for(int i =0 ; i<pid.length;i++) {
			thumbnailList.add(new ProductService().selectThumbnail(sbNo.get(i)));
		}	
	
	
		RequestDispatcher view = null;
		request.setAttribute("ptitle", ptitleList);
		request.setAttribute("price", ampriceAr);
		request.setAttribute("pcount", camountAr);
		request.setAttribute("amprice", ampriceAr);
		request.setAttribute("thumbnail",thumbnailList);
		request.setAttribute("allamprice", allamprice);
		request.setAttribute("pid", pidList);
		request.setAttribute("sbno", sbNo);
		
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

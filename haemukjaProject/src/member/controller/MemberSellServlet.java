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
 * Servlet implementation class MemberSellServlet
 */
@WebServlet("/member.me")
public class MemberSellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSellServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 
		String [] ptitle = request.getParameterValues("product");
		String[] camount=request.getParameterValues("pcount"); // 수량
		String[] price = request.getParameterValues("price");
		String[] cid = request.getParameterValues("cid");
		String[] sbno = request.getParameterValues("sbno");
		System.out.println("sbno 잘넘오니" + sbno);
		
		 
		// sbno 형변환
		int [] sbno2 = new int[sbno.length];
		
		for(int i = 0;i<sbno.length;i++){
			sbno2[i] = Integer.parseInt(sbno[i]);	
		}
		 
		ArrayList<String> ptitleAr= new ArrayList<String>();
		for(int i =0 ; i<ptitle.length;i++) {
			ptitleAr.add(ptitle[i]);
		}
		 
		ArrayList<String> camountAr= new ArrayList<String>();
		for(int i =0 ; i<ptitle.length;i++) {
			camountAr.add(camount[i]);
		}
	
		ArrayList<String> cidAr =null; // 판매상세페이지에서 넘어갈땐 cid가 null 값이다
		if(cid!=null) {
			cidAr = new ArrayList<String>();
			for(int i =0 ; i<cid.length;i++) {
				cidAr.add(cid[i]);
			}
		}
	
		ArrayList<Integer> sbNo = new ArrayList<Integer>();
		for(int i = 0; i<ptitle.length;i++) {
			sbNo.add(sbno2[i]);
		}
		System.out.println("서블릿에서 sbno:" + sbNo);
		 
		 // camount[] 형변환
		int [] camount2 = new int[camount.length];
		
		for(int i = 0;i<camount.length;i++){
		
		camount2[i] = Integer.parseInt(camount [i]);	
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
		for(int i =0 ; i<ptitle.length;i++) {
			ampriceAr.add(amprice[i]);
		}
		 
		int allamprice = 0; // 총결제가격
		for(int i = 0; i<ptitle.length; i++) {
			allamprice += ampriceAr.get(i);
		}
		
		ArrayList<Attachment> thumbnailList = new ArrayList<Attachment>();
		for(int i =0 ; i<ptitle.length;i++) {
			thumbnailList.add(new ProductService().selectThumbnail(sbNo.get(i)));
		}	
		
		RequestDispatcher view = null;
		request.setAttribute("ptitle", ptitleAr);
		request.setAttribute("camount", camountAr);
		request.setAttribute("amprice",ampriceAr);
		request.setAttribute("allamprice",allamprice);
		request.setAttribute("cid",cidAr);
		request.setAttribute("thumbnailList", thumbnailList); 
		 
		view= request.getRequestDispatcher("member/member.jsp");
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

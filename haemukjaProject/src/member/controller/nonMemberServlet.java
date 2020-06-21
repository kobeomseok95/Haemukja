package member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Attachment;
import member.model.service.MemberService;
import mypage.model.vo.nMyCart;
import product.model.service.ProductService;
import product.model.vo.Product;


/**
 * Servlet implementation class nonMemberServlet
 */
@WebServlet("/nonorder.me")
public class nonMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nonMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		
	
		
		
		int payment = Integer.valueOf(request.getParameter("payment"));
		int osid = 0;
		if(payment==3 || payment==4) {
			osid=1;
		}else if(payment==1||payment==2) {
			osid=2;
		}
		
		int amprice = Integer.valueOf(request.getParameter("allamprice"));
		String[] count = request.getParameterValues("count");
		String[] pid = request.getParameterValues("pid");
		String[] sbno=request.getParameterValues("sbno");
		String[] price =request.getParameterValues("price");

		MemberService mservice = new MemberService();
		ProductService ps = new ProductService();
		
		int [] sbno2 = new int[sbno.length];
		
		for(int i = 0;i<sbno.length;i++){// sbno 형변환
			sbno2[i] = Integer.parseInt(sbno[i]);	
		}
		
	
		int [] pid2 = new int[pid.length];
		
		for(int i = 0;i<pid.length;i++){
			pid2[i] = Integer.parseInt(pid[i]);	
		}
	
		ArrayList<Integer> pidAr = new ArrayList<Integer>();
		for(int i=0; i < pid.length; i++) {
			pidAr.add(pid2[i]);
		}
		
		ArrayList<Integer> sbnoAr = new ArrayList<Integer>();
		for(int i=0; i < sbno2.length; i++) {
			sbnoAr.add(sbno2[i]);
		}
		
		
		ArrayList<String> sbnoAr2 = new ArrayList<String>();
		for(int i=0; i < sbno.length; i++) {
			sbnoAr2.add(sbno[i]);
		}
		System.out.println("nonMemberServlet에서 sbnoAr2:"+ sbnoAr2);
		
		ArrayList<Product> ptitleAr = new ArrayList<Product>();
		for(int i =0; i<sbnoAr.size();i++) {
			ptitleAr.add(ps.selectProduct(pidAr.get(i)));
		}
		System.out.println("nonMemberServlet에서 ptitleAr:"+ptitleAr);
		ArrayList<Attachment> thumbnail = new ArrayList<Attachment>();
		for(int i =0; i<sbnoAr.size();i++) {// 썸네일 검색
			thumbnail.add(ps.selectThumbnail(sbnoAr.get(i)));
		}
		System.out.println("nonMemberServlet에서 thumbnail:"+thumbnail);
		
		
		String [] price2 = new String[ptitleAr.size()];
		
		for(int i = 0;i<pid.length;i++){
			price2[i] = String.valueOf((ptitleAr.get(i).getPrice()));	
		}
	
		ArrayList<String> priceAr = new ArrayList<String>();
		for(int i=0; i<pid.length;i++) {
			priceAr.add(price2[i]);
		}
		System.out.println("nonMembeServlet에서 priceAr:"+priceAr);
		ArrayList<String> pidAr2 = new ArrayList<String>();
		for(int i=0; i<pid.length;i++) {
			pidAr2.add(pid[i]);
		}
		System.out.println("nonMemberServlet에서 pidAr:"+ pidAr2);
		
		ArrayList<String> countAr = new ArrayList<String>();
		for(int i = 0; i<count.length;i++) {
			countAr.add(count[i]);
		}
		System.out.println("nonMemberServlet에서 countAr :"+ countAr);
		int result1 = mservice.oIdInsert(amprice);
		
		int oid = mservice.selectOid();
		int result3 =0;
		for(int i =0; i <pidAr.size();i++) {
			result3 = mservice.nMemOrder2(oid, payment, countAr.get(i), pidAr.get(i), osid);
		}
		
		
		
		HttpSession session=request.getSession();
		ArrayList<nMyCart> OrderList = (ArrayList<nMyCart>)session.getAttribute("Order_List");
		
		if(result3>0){
			Iterator<nMyCart> iter = OrderList.iterator();
			if(pidAr2.size()>1) {
				int i =0;
				while (iter.hasNext()) {
					nMyCart n = iter.next();
						
					if (n.getPid().equals(pidAr2.get(i))) {
						iter.remove();
					}
					
					i++;
				}
			}else {
				while (iter.hasNext()) {
					nMyCart n = iter.next();
						
					if (n.getPid().equals(pidAr2.get(0))) {
						iter.remove();
					}
					
					
				}
			}
			
		}
		
		RequestDispatcher view = null;
		
		request.setAttribute("oid", oid);
		request.setAttribute("msg", "주문이 완료되었습니다");
		view = request.getRequestDispatcher("member/orderResult.jsp");
		
		
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

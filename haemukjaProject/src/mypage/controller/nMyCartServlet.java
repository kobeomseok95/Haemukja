package mypage.controller;

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

import mypage.model.vo.nMyCart;

/**
 * Servlet implementation class nMyCartServlet
 */
@WebServlet("/ncart.sh")
public class nMyCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nMyCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	
		

		
		HttpSession session = request.getSession();
		ArrayList<nMyCart> OrderList = null;
		
		if(session.getAttribute("Order_List")==null) {
			OrderList=new ArrayList<nMyCart>();	//비어있으면 초기화
		}else {
			OrderList = (ArrayList<nMyCart>)session.getAttribute("Order_List");//비어있지 않으면 지금까지 데이터 배열(List)담기
			
		}
		String ptitle=request.getParameter("ptitle");
		String thumbnail=request.getParameter("thumbnail");
		String count=request.getParameter("count");
		String pid = request.getParameter("pid");
		String price= request.getParameter("price");
		String sbno = request.getParameter("sbno");

		nMyCart data = new nMyCart();
		

		
		//같은 물품일 경우 덮어쓰기
		Iterator<nMyCart> iter = OrderList.iterator();
		while (iter.hasNext()) {
			nMyCart n = iter.next();
		 
			if (n.getPid().equals(pid)) {
				iter.remove();
			}
		
		}
		
		data.setCount(count);
		data.setPid(pid);
		data.setPrice(price);
		data.setPtitle(ptitle);
		data.setSbno(sbno);
		data.setThumbnail(thumbnail);
		OrderList.add(data);
		
		session.setAttribute("Order_List", OrderList);
		
		RequestDispatcher view= request.getRequestDispatcher("mypage/nMyCart.jsp");
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

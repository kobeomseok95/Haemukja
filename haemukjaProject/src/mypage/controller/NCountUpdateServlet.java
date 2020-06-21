package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.model.vo.nMyCart;

/**
 * Servlet implementation class NCountUpdateServlet
 */
@WebServlet("/nCount.me")
public class NCountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NCountUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] count=request.getParameterValues("pcount");
		String[] pid=request.getParameterValues("pid");
		
		ArrayList<String> pidAr = new ArrayList<String>();
		for(int i=0;i<pid.length;i++) {
			pidAr.add(pid[i]);
		}
		System.out.println("pidAr:"+pidAr);
		ArrayList<String> countAr = new ArrayList<String>();
		for(int i=0;i<count.length;i++) {
			countAr.add(count[i]);
		}
		System.out.println("countAr:"+countAr);
		HttpSession session = request.getSession();
		ArrayList<nMyCart> OrderList = (ArrayList<nMyCart>)session.getAttribute("Order_List");
	
		for(int i=0; i<countAr.size();i++) {
			OrderList.get(i).setCount(countAr.get(i));
		}
		
		session.setAttribute("Order_List", OrderList);
		response.sendRedirect("mypage/nMyCart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

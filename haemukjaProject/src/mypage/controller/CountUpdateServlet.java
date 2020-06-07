package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import mypage.model.service.MypageService;

/**
 * Servlet implementation class CountUpdateServlet
 */
@WebServlet("/count.me")
public class CountUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf-8");
	       
	      
	       String[] camount=request.getParameterValues("pcount"); // 수량
	       String[] cid = request.getParameterValues("cid");
	      
	   
	       ArrayList<String> cidAr =null; // 판매상세페이지에서 넘어갈땐 cid가 null 값이다
	       if(cid!=null) {
	          cidAr = new ArrayList<String>();
	          for(int i =0 ; i<cid.length;i++) {
	            cidAr.add(cid[i]);
	          }
	       }
	   
	      
	       // camount[] 형변환
	      int [] camount2 = new int[camount.length];
	      
	      for(int i = 0;i<camount.length;i++){
	      
	      camount2[i] = Integer.parseInt(camount [i]);   
	      }
	      
	      
	      ArrayList<Integer> countAr = new ArrayList<Integer>();
	      for(int i =0;i<camount2.length;i++) {
	         countAr.add(camount2[i]);
	      }
	      

	       HttpSession session = request.getSession();
	       Member member = (Member)(session.getAttribute("loginMember"));
	       String userId = member.getMid();
	      
	       int result =0;
	       for(int i =0; i <countAr.size();i++) {
	       result= new MypageService().updateCount(countAr.get(i),cidAr.get(i),userId);
	      
	      }
	      

	       RequestDispatcher view = null;
	      if(result>0) {
	       request.setAttribute("cid",cidAr);
	       view= request.getRequestDispatcher("cart.my");
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

package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;


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
		String name = request.getParameter("orderer");
		
		String phone1= request.getParameter("phone1");
		String phone2= request.getParameter("phone2");
		String phone3= request.getParameter("phone3");
		String phone = phone1 + "-"+ phone2 + "-" + phone3;
		
		String address1 = request.getParameter("receiverAddress1");
		String address2 =request.getParameter("receiverAddress2");
		String address3 = request.getParameter("receiverAddress3");
		String address = address1 +""+ address2+""+ address3;
		
		
		String payment = request.getParameter("payment");
		int amprice = Integer.valueOf(request.getParameter("allamprice"));
		String count = request.getParameter("count");
		int pid = Integer.valueOf(request.getParameter("pid"));
		MemberService mservice = new MemberService();
		
		
	
		
		
		int result1 = mservice.oIdInsert(amprice);
		int oid = mservice.selectOid();
		int result2= mservice.nMemOrder(name,phone,address,payment);
		int nmno = mservice.selectNmno();
		int result3 = mservice.nMemOrder2(oid, payment, count, pid,nmno);
		
		RequestDispatcher view = null;
		
		request.setAttribute("nmno", nmno);
		request.setAttribute("msg", "결제가 완료되었습니다");
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

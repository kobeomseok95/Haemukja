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
	
		
	
		
		
		int payment = Integer.valueOf(request.getParameter("payment"));
		int osid = 0;
		if(payment==3 || payment==4) {
			osid=1;
		}else if(payment==1||payment==2) {
			osid=2;
		}
		
		int amprice = Integer.valueOf(request.getParameter("allamprice"));
		String count = request.getParameter("count");
		int pid = Integer.valueOf(request.getParameter("pid"));
		MemberService mservice = new MemberService();
		
	
		int result1 = mservice.oIdInsert(amprice);
		int oid = mservice.selectOid();
	
		
		int result3 = mservice.nMemOrder2(oid, payment, count, pid, osid);
		
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

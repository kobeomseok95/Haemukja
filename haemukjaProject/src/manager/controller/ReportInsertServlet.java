package manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import manager.model.service.ManagerService;
import manager.model.vo.Report;

/**
 * Servlet implementation class ReportInsertServlet
 */
@WebServlet("/insert.ro")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String badMember = request.getParameter("writer");
		String reportMid = request.getParameter("mId");
		String reportContent = request.getParameter("reportContent");
		
		Report r = new Report();
		r.setReportBNo(bNo);
		r.setBadMember(badMember);
		r.setReportMid(reportMid);
		r.setReportContent(reportContent);
		
		int result = new ManagerService().insertReport(r);
		
		RequestDispatcher view = null;
		request.setAttribute("msg", "신고 접수가 정상 처리되었습니다.");
		request.setAttribute("bNo", bNo);
		view = request.getRequestDispatcher("/detail.re");
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

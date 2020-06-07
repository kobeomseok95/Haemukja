package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Notice;


@WebServlet("/noticeDetail.qn")
public class QnaNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.valueOf(request.getParameter("nno"));
		Notice noticeDetail = new QnaService().getNotice(nno);
		if(noticeDetail != null) {
			request.setAttribute("noticeDetail", noticeDetail);
			request.getRequestDispatcher("qna/qnaboard_noticedetail.jsp").forward(request, response);
		} else {
//			404
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

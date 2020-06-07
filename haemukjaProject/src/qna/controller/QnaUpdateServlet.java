package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;


@WebServlet("/update.qn")
public class QnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qid = Integer.valueOf(request.getParameter("qid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int result = new QnaService().updateQna(qid, title, content);
		
		if(result > 0) {
			request.getRequestDispatcher("detail.qn?qid=" + qid).forward(request, response);
		} else {
			//404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

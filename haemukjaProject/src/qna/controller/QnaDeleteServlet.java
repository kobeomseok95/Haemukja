package qna.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;

/**
 * Servlet implementation class QnaDeleteServlet
 */
@WebServlet("/del.qn")
public class QnaDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qid = Integer.valueOf(request.getParameter("qid"));
		int dleQnaComments = new QnaService().deleteQnaComment(qid);	//해당 게시글의 댓글 삭제
		int delQna = new QnaService().deleteQna(qid);	//해당 게시글 삭제
		
		if(delQna > 0) {
//			request.getRequestDispatcher("qna/qnaboard.jsp").forward(request, response); 여기는 왜 servlet으로 가는지!
			request.getRequestDispatcher("/qna.qn").forward(request, response);
		} else {
			//404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

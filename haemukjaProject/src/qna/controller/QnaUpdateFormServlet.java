package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Qna;


@WebServlet("/upload.qn")
public class QnaUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qid = Integer.valueOf(request.getParameter("qid"));
		Qna qna = new QnaService().selectQna(qid);		// 해당 게시글 데이터 가져오기
		
		if(qna != null) {
			request.setAttribute("qna", qna);
			request.getRequestDispatcher("qna/qnaboard_write.jsp").forward(request, response);
		} else {
			//404
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

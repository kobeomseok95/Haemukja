package qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import qna.model.service.QnaService;
import qna.model.vo.Qna;


@WebServlet("/write.qn")
public class QnaWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 제목, 내용, 아이디를 받아와야 한다
		HttpSession session = request.getSession();
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		Member loginMember = (Member)session.getAttribute("loginMember");
		String mid = loginMember.getMid();
		Qna qna = new Qna(mid, title, content);
		
		int result = new QnaService().insertQna(qna);
		
		if(result > 0) {
			request.getRequestDispatcher("/qna.qn?currentPage=1").forward(request, response);
		} else {
			//404
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

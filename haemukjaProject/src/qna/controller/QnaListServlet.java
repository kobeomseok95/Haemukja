package qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.model.service.QnaService;
import qna.model.vo.Notice;
import qna.model.vo.PageInfo;
import qna.model.vo.Qna;


@WebServlet("/qna.qn")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaService qs = new QnaService();
		int totalCount = qs.getListCount();	//244
		int currentPage = 1;		// 현재 페이지
		int displayRow = 20;		// 한페이지에 보여줄 qna 게시글 수
		int displayPage = 10;		// 페이지네이션에서 보여질 페이지 수 ex)1~10 / 11~20...
		int maxPage = 0;					// 맨 마지막 페이지
		int beginPage = 0;				// 맨 처음 페이지
		int endPage = 0;					// 한번에 표시가 될 페이지
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
		}
		endPage = ((int)Math.ceil(currentPage/(double)displayPage))*displayPage;
		maxPage = (int)Math.ceil((double)totalCount / displayRow);
		beginPage = endPage - (displayPage - 1);
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(totalCount, currentPage, displayRow, displayPage, maxPage, beginPage, endPage);
		ArrayList<Qna> list = qs.selectList(currentPage, displayRow);
		ArrayList<Notice> noticeList = qs.selectNotice();
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		request.setAttribute("notice", noticeList);
		request.getRequestDispatcher("qna/qnaboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}

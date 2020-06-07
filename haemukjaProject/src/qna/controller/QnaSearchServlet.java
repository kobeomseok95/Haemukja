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


@WebServlet("/search.qn")
public class QnaSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Qna> list = new ArrayList<Qna>();
		String searchOption = request.getParameter("searchOption");
		String searchContent = request.getParameter("searchContent");
		//value = nickname, title, content
		if(searchOption.equals("nickname")) {
			list = new QnaService().searchNickname(searchContent);
		} else if (searchOption.equals("title")) {
			list = new QnaService().searchTitle(searchContent);
		} else {
			list = new QnaService().searchContent(searchContent);
		}

		int totalCount = list.size();
		int currentPage = 1;
		int displayRow = 20;		
		int displayPage = 10;	
		int maxPage = 0;					
		int beginPage = 0;				
		int endPage = 0;			
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
		ArrayList<Qna> sortedList = new ArrayList<Qna>();
		int endRow = currentPage * displayRow;
		int startRow = endRow - displayRow + 1;
		if(endRow > totalCount) {
			endRow = totalCount;
		}
		
		ArrayList<Notice> noticeList = new QnaService().selectNotice();
		
		if(!list.isEmpty()) {
			for(int i = startRow - 1; i < endRow; i++) {
				sortedList.add(list.get(i));
			}
			request.setAttribute("list", sortedList);
			request.setAttribute("pi", pi);
			request.setAttribute("notice", noticeList);
			request.setAttribute("searchOption", searchOption);
			request.setAttribute("searchContent", searchContent);
			
			request.getRequestDispatcher("qna/qnaboard.jsp").forward(request, response);
		} else {
			//404
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

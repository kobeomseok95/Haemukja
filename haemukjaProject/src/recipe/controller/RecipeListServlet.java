package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Attachment;
import qna.model.service.QnaService;
import qna.model.vo.Notice;
import common.PageInfo;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class RecipeListServlet
 */
@WebServlet("/list.re")
public class RecipeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nCode = request.getParameter("nCode");
		
		RecipeService rs = new RecipeService();
		
		int listCount = rs.getListCount(nCode);
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.valueOf(request.getParameter("currentPage"));
		} else {
			currentPage = 1;
		}
		
		limit = 10;
		
		maxPage = (int)((double)listCount / limit + 1);
		startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit + 1;
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<Recipe> rlist = rs.selectRList(currentPage, limit, nCode);
		
		ArrayList<Attachment> flist = new ArrayList<>();
		for(int i = 0; i < rlist.size(); i++) {
			Attachment at = rs.selectThumbnail(rlist.get(i).getbNo());
			flist.add(at);
		}
		ArrayList<Notice> noticeList = new QnaService().selectNotice();
		
		ArrayList<String> nicknames = new ArrayList<>();
		for(int i = 0; i < rlist.size(); i++) {
			String nickname = rs.selectMNickname(rlist.get(i).getbNo());
			nicknames.add(nickname);
		}
		
		RequestDispatcher view = null;
		if(rlist != null && flist != null && noticeList != null) {
			view = request.getRequestDispatcher("recipe/recipeBoardList.jsp");
			request.setAttribute("rlist", rlist);
			request.setAttribute("flist", flist);
			request.setAttribute("pi", pi);
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("nicknames", nicknames);
		}
		
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

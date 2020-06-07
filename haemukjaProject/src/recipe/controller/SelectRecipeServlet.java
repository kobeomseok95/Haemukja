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
import common.PageInfo;
import qna.model.service.QnaService;
import qna.model.vo.Notice;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class SelectRecipeServlet
 */
@WebServlet("/selectRecipe.re")
public class SelectRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeService rs = new RecipeService();
		String recipeSearchOption = request.getParameter("recipeSearchOption");
		String recipeSearchContent = request.getParameter("recipeSearchContent");
		ArrayList<Notice> noticeList = new QnaService().selectNotice();
		
		//pageinfo
		int listCount = rs.getListCount(recipeSearchOption, recipeSearchContent);
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
		
		ArrayList<Recipe> rlist = rs.selectRList(currentPage, limit, recipeSearchOption, recipeSearchContent);
		ArrayList<Attachment> flist = new ArrayList<>();
		for(int i = 0; i < rlist.size(); i++) {
			Attachment at = rs.selectThumbnail(rlist.get(i).getbNo());
			flist.add(at);
		}
		ArrayList<String> nicknames = new ArrayList<>();
		for(int i = 0; i < rlist.size(); i++) {
			nicknames.add(rs.selectMNickname(rlist.get(i).getbNo()));
		}
		int nCode = 13;
		
		if(rlist != null && flist != null && noticeList != null) {
			request.setAttribute("rlist", rlist);
			request.setAttribute("flist", flist);
			request.setAttribute("pi", pi);
			request.setAttribute("noticeList", noticeList);
			request.setAttribute("nicknames", nicknames);
			request.setAttribute("nCode", nCode);
			request.setAttribute("recipeSearchOption", recipeSearchOption);
			request.setAttribute("recipeSearchContent", recipeSearchContent);
			request.getRequestDispatcher("recipe/recipeBoardList.jsp").forward(request, response);
		}
		else {
			//404
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}















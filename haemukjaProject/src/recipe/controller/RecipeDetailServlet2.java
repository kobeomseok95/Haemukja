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
import recipe.model.service.RecipeService;
import recipe.model.vo.RComment;
import recipe.model.vo.Recipe;
import recipe.model.vo.Tag;

/**
 * Servlet implementation class RecipeDetailServlet2
 */
@WebServlet("/detail2.re")
public class RecipeDetailServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecipeDetailServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNo = Integer.valueOf(request.getParameter("bNo"));
		
		RecipeService rs = new RecipeService();
		
		String nickname = rs.selectMNickname(bNo);
		Recipe recipe = rs.selectRecipe(bNo);
		ArrayList<String> contents = rs.selectContents(bNo);
		ArrayList<Attachment> files = rs.selectFiles(bNo);
		ArrayList<Tag> tags = rs.selectTags(files);
		ArrayList<Tag> upgradeTags = rs.addPTitles(tags);
		ArrayList<RComment> comments = rs.selectComments(bNo);
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("recipe/recipeBoardDetail.jsp");
		request.setAttribute("recipe", recipe);
		request.setAttribute("contents", contents);
		request.setAttribute("files", files);
		request.setAttribute("tags", tags);
		request.setAttribute("upgradeTags", upgradeTags);
		request.setAttribute("nickname", nickname);
		request.setAttribute("comments", comments);
		
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

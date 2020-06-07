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
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/main.re")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeService rs = new RecipeService();
		
		ArrayList<Recipe> rlist = rs.selectRList();
		
		ArrayList<Attachment> flist = new ArrayList<>();
		for(int i = 0; i < rlist.size(); i++) {
			Attachment at = rs.selectThumbnail(rlist.get(i).getbNo());
			flist.add(at);
		}
		
		ArrayList<String> nicknames = new ArrayList<>();
		for(int i = 0; i < rlist.size(); i++) {
			String nickname = rs.selectMNickname(rlist.get(i).getbNo());
			nicknames.add(nickname);
		}
		
		RequestDispatcher view = null;
		view = request.getRequestDispatcher("main.jsp");
		request.setAttribute("rlist", rlist);
		request.setAttribute("flist", flist);
		request.setAttribute("nicknames", nicknames);
		
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

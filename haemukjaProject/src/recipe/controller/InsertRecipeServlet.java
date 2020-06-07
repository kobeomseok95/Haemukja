package recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.Attachment;
import common.HaemukjaFileRenamePolicy;
import member.model.vo.Member;
import recipe.model.service.RecipeService;
import recipe.model.vo.Recipe;

/**
 * Servlet implementation class InsertRecipeServlet
 */
@WebServlet("/insert.re")
public class InsertRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRecipeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RecipeService rs = new RecipeService();
		
		int maxSize = 1024*1024*10;
		
		String root = request.getSession().getServletContext().getRealPath("/");
		
		String savePath = root + "uploadFiles/";
		
		MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize,
											"UTF-8", new HaemukjaFileRenamePolicy());
		
		ArrayList<String> saveFiles = new ArrayList<>();
		
		Enumeration<String> files = multiRequest.getFileNames();
		while(files.hasMoreElements()) {
			String name = files.nextElement();
			
			if(multiRequest.getFilesystemName(name) != null) {
				saveFiles.add(multiRequest.getFilesystemName(name));
			}
		}
		
		String title = multiRequest.getParameter("title");
		
		String nCode = multiRequest.getParameter("nCode");
		
		String[] contentArr = multiRequest.getParameterValues("content");
		
		String id = ((Member)(request.getSession().getAttribute("loginMember"))).getMid();
		
		Recipe r = new Recipe();
		r.setbTitle(title);
		r.setnCode(nCode);
		r.setmId(id);
		
		ArrayList<Attachment> fileList = new ArrayList<>();		
		
		String[] tagArr = multiRequest.getParameterValues("tag");
		
		for(int i = saveFiles.size()-1; i >= 0; i--) {
			Attachment at = new Attachment();
			
			at.setFileName(saveFiles.get(i));
			at.setFilePath(savePath);
			
			if(i == saveFiles.size()-1) {
				at.setLevel(0);
			} else {
				at.setLevel(1);
			}
			
			fileList.add(at);
		}
		
		int result = rs.insertRecipe(r,contentArr,fileList,tagArr);
		int bNo = rs.selectBNo(r);
		
		RequestDispatcher view = null;
		if(result > 0) {
			view = request.getRequestDispatcher("/detail.re");
			request.setAttribute("bNo", bNo);
		} else {
			for(int i = 0; i < saveFiles.size(); i++) {
				File failedFile = new File(savePath + saveFiles.get(i));
				failedFile.delete();
			}
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

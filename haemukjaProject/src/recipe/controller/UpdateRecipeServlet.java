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
import recipe.model.vo.Tag;

/**
 * Servlet implementation class UpdateRecipeServlet
 */
@WebServlet("/update.re")
public class UpdateRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRecipeServlet() {
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
		
		int bNo = Integer.valueOf(multiRequest.getParameter("bNo"));
		
		String title = multiRequest.getParameter("title");
		
		String nCode = multiRequest.getParameter("nCode");
		
		String[] contentArr = multiRequest.getParameterValues("content");
		
		String aIdArr[] = multiRequest.getParameterValues("aId");
		ArrayList<String> alist = new ArrayList<>();
		for(int i = 0; i < aIdArr.length; i++) {
			if(!aIdArr[i].equals("")) {
				alist.add(aIdArr[i]);
			}
		}
		
		ArrayList<Attachment> fileList = new ArrayList<>();		
		
		String[] tagArr = multiRequest.getParameterValues("tag");
		ArrayList<String> tlist = new ArrayList<>();
		String[] tagAIdArr = multiRequest.getParameterValues("tagAId");
		ArrayList<String> talist = new ArrayList<>();
		for(int i = 0; i < tagArr.length; i++) {
			if(!tagArr[i].equals("")) {
				tlist.add(tagArr[i]);
			}
		}
		for(int i = 0; i < tagAIdArr.length; i++) {
			if(!tagAIdArr[i].equals("")) {
				talist.add(tagAIdArr[i]);
			}
		}
		
		for(int i = saveFiles.size()-1; i >= 0; i--) {
			Attachment at = new Attachment();
			
			at.setFileName(saveFiles.get(i));
			at.setFilePath(savePath);

			fileList.add(at);
		}
		
		int result = rs.updateRecipe(bNo, title, contentArr, fileList, tlist, talist, alist);
		
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

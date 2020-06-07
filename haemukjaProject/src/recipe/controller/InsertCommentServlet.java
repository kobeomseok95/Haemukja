package recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import recipe.model.service.RecipeService;
import recipe.model.vo.RComment;


@WebServlet("/insertComment.bd")
public class InsertCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.valueOf(request.getParameter("bid"));
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		RComment rc = new RComment(content, bid, writer);
		ArrayList<RComment> list = new RecipeService().insertComment(rc);
		
		JSONArray rlistArray = new JSONArray();
		JSONObject rlistObj = null;
		
		for(RComment r : list) {
			rlistObj = new JSONObject();
			java.util.Date createDate = new java.util.Date(r.getcDate().getTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String cDate = sdf.format(createDate);
			//포맷 설정
			
			rlistObj.put("rnum", r.getrNo());
			rlistObj.put("bno", r.getbNo());
			rlistObj.put("comment", r.getCcoment());
			rlistObj.put("nickname", r.getNickname());
			rlistObj.put("cdate", cDate);
			
			rlistArray.add(rlistObj);
		}
		PrintWriter out = response.getWriter();
		
		response.setContentType("application/json; charset=utf-8");
		out.print(rlistArray);
		out.flush();
		out.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

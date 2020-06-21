package recipe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import qna.model.vo.QComment;
import recipe.model.service.RecipeService;
import recipe.model.vo.RComment;

@WebServlet("/changeComment.re")
public class ChangeRecipeCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType = request.getParameter("actionType");
		int bno = Integer.valueOf(request.getParameter("bno"));
		RecipeService rs = new RecipeService();
		int result = 0;
		if(actionType.equals("addComment") || actionType.equals("addReply")) {
			String rComment = request.getParameter("rComment");
			String mid = request.getParameter("mid");
			int parentNo = Integer.valueOf(request.getParameter("parentNo"));
			int orderNo = Integer.valueOf(request.getParameter("orderNo"));
			int groupNo = Integer.valueOf(request.getParameter("groupNo"));
			int depth = Integer.valueOf(request.getParameter("depth"));
			
			RComment rc = new RComment();
			rc.setBno(bno);
			rc.setrComment(rComment);
			rc.setmNickname(mid);	//아이디입니다.
			rc.setParentNo(parentNo);
			rc.setOrderNo(orderNo);
			rc.setGroupNo(groupNo);
			rc.setDepth(depth);
			
			result = rs.insertComment(rc);
		} 
		else if(actionType.equals("deleteComment") || actionType.equals("deleteReply")) {
			int rcno = Integer.valueOf(request.getParameter("rcno"));
			if(actionType.equals("deleteComment")) {
				int groupNo = rs.selectGroupNo(rcno);
				result = rs.deleteComment(rcno);
				result = rs.updateGroupNo(groupNo);
			}
			else {	
				int orderNo = rs.selectReplyOrderNo(rcno);
				int parentNo = rs.selectReplyParentNo(rcno);
				rs.deleteComment(rcno);
				result = rs.updateReplyOrderNo(orderNo, parentNo);
			}
		}
		else if(actionType.equals("update")) {
			int rcno = Integer.valueOf(request.getParameter("rcno"));
			String rComment = request.getParameter("rComment");
			result = rs.updateComment(rcno, rComment);
		}
		
		
		ArrayList<RComment> commentList = rs.selectComments(bno);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(commentList, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

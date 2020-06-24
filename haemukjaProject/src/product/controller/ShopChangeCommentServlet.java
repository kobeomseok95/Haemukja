package product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import product.model.service.ProductService;
import product.model.vo.SComment;
import recipe.model.vo.RComment;

@WebServlet("/changeComment.sh")
public class ShopChangeCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType = request.getParameter("actionType");
		int sbno = Integer.valueOf(request.getParameter("sbno"));
		ProductService ps = new ProductService();
		int result = 0;
		if(actionType.equals("addComment") || actionType.equals("addReply")) {
			String sComment = request.getParameter("sComment");
			String mid = request.getParameter("mid");
			int parentNo = Integer.valueOf(request.getParameter("parentNo"));
			int orderNo = Integer.valueOf(request.getParameter("orderNo"));
			int groupNo = Integer.valueOf(request.getParameter("groupNo"));
			int depth = Integer.valueOf(request.getParameter("depth"));
			
			SComment sc = new SComment();
			sc.setSbno(sbno);
			sc.setsComment(sComment);
			sc.setmNickname(mid);	//아이디입니다.
			sc.setParentNo(parentNo);
			sc.setOrderNo(orderNo);
			sc.setGroupNo(groupNo);
			sc.setDepth(depth);
			
//			result = ps.insertComment(sc);
		} 
		else if(actionType.equals("deleteComment") || actionType.equals("deleteReply")) {
			int rcno = Integer.valueOf(request.getParameter("rcno"));
			if(actionType.equals("deleteComment")) {
//				int groupNo = ps.selectGroupNo(rcno);
//				result = ps.deleteComment(rcno);
//				result = ps.updateGroupNo(groupNo);
			}
			else {	
//				int orderNo = ps.selectReplyOrderNo(rcno);
//				int parentNo = ps.selectReplyParentNo(rcno);
//				ps.deleteComment(rcno);
//				result = ps.updateReplyOrderNo(orderNo, parentNo);
			}
		}
		else if(actionType.equals("update")) {
			int rcno = Integer.valueOf(request.getParameter("rcno"));
			String rComment = request.getParameter("rComment");
//			result = ps.updateComment(scno, sComment);
		}
		
		
		ArrayList<SComment> commentList = ps.selectCommentList(sbno);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(commentList, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

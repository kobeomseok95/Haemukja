package qna.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import qna.model.service.QnaService;
import qna.model.vo.QComment;
import qna.model.vo.Qna;

@WebServlet("/changeComment.qn")
public class ChangeCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionType = request.getParameter("actionType");
		int qid = Integer.valueOf(request.getParameter("qid"));
		QnaService qs = new QnaService();
		int result = 0;
		if(actionType.equals("addComment") || actionType.equals("addReply")) {
			String qComment = request.getParameter("qComment");
			String mid = request.getParameter("mid");
			int parentNo = Integer.valueOf(request.getParameter("parentNo"));
			int orderNo = Integer.valueOf(request.getParameter("orderNo"));
			int groupNo = Integer.valueOf(request.getParameter("groupNo"));
			int depth = Integer.valueOf(request.getParameter("depth"));
			
			QComment c = new QComment();
			c.setQid(qid);
			c.setqComment(qComment);
			c.setmNickname(mid);	//아이디입니다.
			c.setParentNo(parentNo);
			c.setOrderNo(orderNo);
			c.setGroupNo(groupNo);
			c.setDepth(depth);
			
			result = qs.insertComment(c);
		} 
		else if(actionType.equals("deleteComment") || actionType.equals("deleteReply")) {
			int qcno = Integer.valueOf(request.getParameter("qcno"));
			if(actionType.equals("deleteComment")) {
				int groupNo = qs.selectGroupNo(qcno);
				result = qs.deleteComment(qcno);
				result = qs.updateGroupNo(groupNo);
			}
			else {	
				int orderNo = qs.selectReplyOrderNo(qcno);
				int parentNo = qs.selectReplyParentNo(qcno);
				qs.deleteComment(qcno);
				result = qs.updateReplyOrderNo(orderNo, parentNo);
			}
		}
		else if(actionType.equals("update")) {
			int qcno = Integer.valueOf(request.getParameter("qcno"));
			String qComment = request.getParameter("qComment");
			result = qs.updateComment(qcno, qComment);
		}
		
		ArrayList<QComment> commentList = qs.selectReplyList(qid);

		if(commentList.isEmpty() && qs.selectQna(qid).getAnswer().equals("Y")) {
			qs.updateQnaAnswer(qid, false);
		}
		else if(!commentList.isEmpty()){
			for(QComment c : commentList) {
				if(c.getmNickname().equals("관리자") && qs.selectQna(qid).getAnswer().equals("N")) {
					qs.updateQnaAnswer(qid, true);
				}
			}
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(commentList, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

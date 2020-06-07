package qna.controller;

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

import qna.model.service.QnaService;
import qna.model.vo.Comment;

/**
 * Servlet implementation class QnaCommentInsertServlet
 */
@WebServlet("/writeComment.qn")
public class QnaCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");			//닉네임
		int qid = Integer.valueOf(request.getParameter("bid")); //게시글번호
		String content = request.getParameter("content");		//내용
		Comment c = new Comment(qid, content, writer);
		
		ArrayList<Comment> list = new QnaService().insertReply(c);
		//답변 완료
		int answerComplete = new QnaService().answerComplete(qid);
		
		JSONArray rlistArray = new JSONArray();
		JSONObject rlistObj = null;
		
		for(Comment cm : list) {
			rlistObj = new JSONObject();
			java.util.Date createDate = new java.util.Date(cm.getCdate().getTime());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String cDate = sdf.format(createDate);
			//포맷 설정
			
			rlistObj.put("rnum", cm.getRnum());
			rlistObj.put("qid", cm.getQid());
			rlistObj.put("comment", cm.getComment());
			rlistObj.put("writer", cm.getWriter());
			rlistObj.put("cdate", cDate);
			
			rlistArray.add(rlistObj);
		}
		
		PrintWriter out = response.getWriter();
//		for(int i = 0; i < rlistArray.size(); i++) {
//			System.out.println(rlistArray.get(i));
//		}
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





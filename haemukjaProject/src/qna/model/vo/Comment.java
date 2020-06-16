package qna.model.vo;

import java.sql.Date;

public class Comment {
	private int qcno;					//qnacom의 인위적식별자
	private int qid;						//qna게시글 번호
	private String qComment;		//댓글내용
	private Date qDate;				//작성날짜
	private String mNickname;		//닉네임
	private int parentNo;				//대댓글시 부모댓글
	private int orderNo;				//한 그룹에서의 순서
	private int groupNo;				//그룹넘버(댓글부모순)
	private int depth;					//깊이(대댓글 판단)
	public Comment() {
	}
	public Comment(int qcno, int qid, String qComment, Date qDate, String mNickname, int parentNo, int orderNo,
			int groupNo, int depth) {
		this.qcno = qcno;
		this.qid = qid;
		this.qComment = qComment;
		this.qDate = qDate;
		this.mNickname = mNickname;
		this.parentNo = parentNo;
		this.orderNo = orderNo;
		this.groupNo = groupNo;
		this.depth = depth;
	}
	public int getQcno() {
		return qcno;
	}
	public void setQcno(int qcno) {
		this.qcno = qcno;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getqComment() {
		return qComment;
	}
	public void setqComment(String qComment) {
		this.qComment = qComment;
	}
	public Date getqDate() {
		return qDate;
	}
	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}
	public String getmNickname() {
		return mNickname;
	}
	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "Comment [qcno=" + qcno + ", qid=" + qid + ", qComment=" + qComment + ", qDate=" + qDate + ", mNickname="
				+ mNickname + ", parentNo=" + parentNo + ", orderNo=" + orderNo + ", groupNo=" + groupNo + ", depth="
				+ depth + "]";
	}
	
}
package recipe.model.vo;

import java.sql.Date;

public class RComment {
	private int rcno;					//	인위적 식별자(sequence)
	private int bno;						// qna 게시판의 게시글 번호
	private String rComment;		//	댓글내용
	private Date rDate;				//	작성날짜
	private String mNickname;		//	닉네임
	private int parentNo;				//	대댓글시 부모댓글
	private int orderNo;				//	한 그룹에서의 순서
	private int groupNo;				//	그룹넘버(댓글부모순)
	private int depth;					//	깊이(대댓글 판단)
	public RComment() {
	}
	public RComment(int rcno, int bno, String rComment, Date rDate, String mNickname, int parentNo, int orderNo,
			int groupNo, int depth) {
		this.rcno = rcno;
		this.bno = bno;
		this.rComment = rComment;
		this.rDate = rDate;
		this.mNickname = mNickname;
		this.parentNo = parentNo;
		this.orderNo = orderNo;
		this.groupNo = groupNo;
		this.depth = depth;
	}
	public int getRcno() {
		return rcno;
	}
	public void setRcno(int rcno) {
		this.rcno = rcno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getrComment() {
		return rComment;
	}
	public void setrComment(String rComment) {
		this.rComment = rComment;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
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
		return "RComment [rcno=" + rcno + ", bno=" + bno + ", rComment=" + rComment + ", rDate=" + rDate
				+ ", mNickname=" + mNickname + ", parentNo=" + parentNo + ", orderNo=" + orderNo + ", groupNo="
				+ groupNo + ", depth=" + depth + "]";
	}
}

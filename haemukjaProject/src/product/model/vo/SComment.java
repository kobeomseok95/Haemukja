package product.model.vo;

import java.sql.Date;

public class SComment {
	private int scno;						//	인위적 식별자(sequence)
	private int sbno;					// Sell 게시판의 게시글 번호
	private String sComment;		//	댓글내용
	private Date sDate;				//	작성날짜
	private String mNickname;		//	닉네임
	private int parentNo;				//	대댓글시 부모댓글
	private int orderNo;				//	한 그룹에서의 순서
	private int groupNo;				//	그룹넘버(댓글부모순)
	private int depth;					//	깊이(대댓글 판단)
	
	public SComment() {
	}
	public SComment(int scno, int sbno, String sComment, Date sDate, String mNickname, int parentNo, int orderNo,
			int groupNo, int depth) {
		this.scno = scno;
		this.sbno = sbno;
		this.sComment = sComment;
		this.sDate = sDate;
		this.mNickname = mNickname;
		this.parentNo = parentNo;
		this.orderNo = orderNo;
		this.groupNo = groupNo;
		this.depth = depth;
	}
	public int getScno() {
		return scno;
	}
	public void setScno(int scno) {
		this.scno = scno;
	}
	public int getSbno() {
		return sbno;
	}
	public void setSbno(int sbno) {
		this.sbno = sbno;
	}
	public String getsComment() {
		return sComment;
	}
	public void setsComment(String sComment) {
		this.sComment = sComment;
	}
	public Date getsDate() {
		return sDate;
	}
	public void setsDate(Date sDate) {
		this.sDate = sDate;
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
		return "SComment [scno=" + scno + ", sbno=" + sbno + ", sComment=" + sComment + ", sDate=" + sDate
				+ ", mNickname=" + mNickname + ", parentNo=" + parentNo + ", orderNo=" + orderNo + ", groupNo="
				+ groupNo + ", depth=" + depth + "]";
	}
	
}

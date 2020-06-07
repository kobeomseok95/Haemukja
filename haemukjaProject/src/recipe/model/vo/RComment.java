package recipe.model.vo;

import java.sql.Date;

public class RComment {
	private int rNo;
	private int cNo;
	private String ccoment;
	private Date cDate;
	private int bNo;
	private String nickname;
	private int groupNo;
	private int parentNo;
	private int depth;
	private int orderNo;
	public RComment() {
	}
	
	public RComment(String ccoment, int bNo, String nickname) {
		this.ccoment = ccoment;
		this.bNo = bNo;
		this.nickname = nickname;
	}

	public RComment(int rNo, int cNo, String ccoment, Date cDate, int bNo, String nickname, int groupNo, int parentNo,
			int depth, int orderNo) {
		super();
		this.rNo = rNo;
		this.cNo = cNo;
		this.ccoment = ccoment;
		this.cDate = cDate;
		this.bNo = bNo;
		this.nickname = nickname;
		this.groupNo = groupNo;
		this.parentNo = parentNo;
		this.depth = depth;
		this.orderNo = orderNo;
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getCcoment() {
		return ccoment;
	}
	public void setCcoment(String ccoment) {
		this.ccoment = ccoment;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	@Override
	public String toString() {
		return "RComment [rNo=" + rNo + ", cNo=" + cNo + ", ccoment=" + ccoment + ", cDate=" + cDate + ", bNo=" + bNo
				+ ", nickname=" + nickname + ", groupNo=" + groupNo + ", parentNo=" + parentNo + ", depth=" + depth
				+ ", orderNo=" + orderNo + "]";
	}
	
}

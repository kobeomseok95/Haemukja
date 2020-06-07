package qna.model.vo;

import java.sql.Date;

public class Qna {
	private int rno;
	private int qid;
	private String mnickname;
	private String qcontent;
	private String qtitle;
	private Date qdate;
	private String answer;
	public Qna() {}
	
	
	public Qna(String mnickname, String qtitle, String qcontent) {
		this.mnickname = mnickname;	//이때는 아이디의 역할을 한다
		this.qtitle = qtitle;
		this.qcontent = qcontent;
	}


	public Qna(int qid, String mnickname, String qcontent, String qtitle, Date qdate, String answer) {
		this.qid = qid;
		this.mnickname = mnickname;
		this.qcontent = qcontent;
		this.qtitle = qtitle;
		this.qdate = qdate;
		this.answer = answer;
	}

	public Qna(int rno, int qid, String qtitle, String mnickname, Date qdate, String answer) {
		this.rno = rno;
		this.qid = qid;
		this.qtitle = qtitle;
		this.mnickname = mnickname;
		this.qdate = qdate;
		this.answer = answer;
	}

	public Qna(int rno, int qid, String mnickname, String qcontent, String qtitle, Date qdate, String answer) {
		this.rno = rno;
		this.qid = qid;
		this.mnickname = mnickname;
		this.qcontent = qcontent;
		this.qtitle = qtitle;
		this.qdate = qdate;
		this.answer = answer;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getMnickname() {
		return mnickname;
	}
	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Qna [rno=" + rno + ", qid=" + qid + ", mnickname=" + mnickname + ", qcontent=" + qcontent + ", qtitle="
				+ qtitle + ", qdate=" + qdate + ", answer=" + answer + "]";
	}
	
}

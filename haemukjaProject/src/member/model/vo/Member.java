package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mid;
	private String mpw;
	private String mname;
	private String mtel;
	private String addr;
	private String email;
	private String mno;
	private int mpoint;
	private String mnickname;
	private Date infoUpdate;
	private String mout;
	private Date enrollDate;
	private int mscore;
	private String mcode;
	
	public Member() {
		super();
	}

	public Member(String mid, String mpw, String mname, String mtel, String addr, String email, String mno, int mpoint,
			String mnickname, Date infoUpdate, String mout, Date enrollDate, int mscore, String mcode) {
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mtel = mtel;
		this.addr = addr;
		this.email = email;
		this.mno = mno;
		this.mpoint = mpoint;
		this.mnickname = mnickname;
		this.infoUpdate = infoUpdate;
		this.mout = mout;
		this.enrollDate = enrollDate;
		this.mscore = mscore;
		this.mcode = mcode;
	}
	
	public Member(String mid, String mpw) { // login
		this.mid = mid;
		this.mpw = mpw;
	}



	public Member(String mid, String mpw, String mname, String mtel, String maddr, String email, String mno,
			String mnickname, String mcode) {  // insert
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mtel = mtel;
		this.addr = maddr;
		this.email = email;
		this.mno = mno;
		this.mnickname = mnickname;
		this.mcode = mcode;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public int getMpoint() {
		return mpoint;
	}

	public void setMpoint(int mpoint) {
		this.mpoint = mpoint;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	public Date getInfoUpdate() {
		return infoUpdate;
	}

	public void setInfoUpdate(Date infoUpdate) {
		this.infoUpdate = infoUpdate;
	}

	public String getMout() {
		return mout;
	}

	public void setMout(String mout) {
		this.mout = mout;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getMscore() {
		return mscore;
	}

	public void setMscore(int mscore) {
		this.mscore = mscore;
	}
	
	
	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Member [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", mtel=" + mtel + ", addr=" + addr
				+ ", email=" + email + ", mno=" + mno + ", mpoint=" + mpoint + ", mnickname=" + mnickname
				+ ", infoUpdate=" + infoUpdate + ", mout=" + mout + ", enrollDate=" + enrollDate + ", mscore=" + mscore
				+ ", mcode=" + mcode + "]";
	}
	
}

package member.model.vo;

import java.io.Serializable;

public class Seller implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -951810464657238823L;
	
	private String sid;            // 판매회원 id
	private String spw;         // 판매회원 pw
	private String company;   // 판매회원 회사이름
	private String stel;            // 회사 전화번호
	private String caddr;         // 회사 주소 
	private String cno;            // 사업자번호(개인 포함)
	private String sout;         // 판매회원 탈퇴여부
	private String scode;
	   
	public Seller(String sid, String spw, String company, String stel, String caddr, String cno, String sout, String scode) {
		this.sid = sid;
	    this.spw = spw;
	    this.company = company;
	    this.stel = stel;
	    this.caddr = caddr;
	    this.cno = cno;
	    this.sout = sout;
	    this.scode = scode;
	}
	
	public Seller(String sid, String spw) {
		this.sid = sid;
	    this.spw = spw;
	}
	
	
	public Seller(String sid, String spw, String company, String stel, String caddr, String cno, String scode) {
		this.sid = sid;
	    this.spw = spw;
	    this.company = company;
	    this.stel = stel;
	    this.caddr = caddr;
	    this.cno = cno;
	    this.scode = scode;
	}

	public String getSid() {
	    return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getSpw() {
	    return spw;
	}
	public void setSpw(String spw) {
	    this.spw = spw;
	}
	public String getCompany() {
	    return company;
	}
	public void setCompany(String company) {
	    this.company = company;
	}
	public String getStel() {
	    return stel;
	}
	public void setStel(String stel) {
		
	    this.stel = stel;
	}
	public String getCaddr() {
	    return caddr;
	}
	public void setCaddr(String caddr) {
	    this.caddr = caddr;
	}
	public String getCno() {
	    return cno;
	}
	public void setCno(String cno) {
	    this.cno = cno;
	}
	public String getSout() {
	    return sout;
	}
	public void setSout(String sout) {
	    this.sout = sout;
	}
	
	public String getScode() {
		return scode;
	}

	public void setScode(String scode) {
		this.scode = scode;
	}

	public static long getSerialversionuid() {
	    return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Seller [sid=" + sid + ", spw=" + spw + ", company=" + company + ", stel=" + stel + ", caddr=" + caddr
				+ ", cno=" + cno + ", sout=" + sout + ", scode=" + scode + "]";
	}

}

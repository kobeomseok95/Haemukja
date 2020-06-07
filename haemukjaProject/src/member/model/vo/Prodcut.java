package member.model.vo;

import java.io.Serializable;

public class Prodcut implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -1730581433340933761L;

	
	private int pid;
	private String ptitle;
	private int pprice;
	private int pamount;
	private String psellyn;
	private String sid;
	private int pdiscount;
	public Prodcut() {
	}
	public Prodcut(int pid, String ptitle, int pprice, int pamount, String psellyn, String sid, int pdiscount) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pprice = pprice;
		this.pamount = pamount;
		this.psellyn = psellyn;
		this.sid = sid;
		this.pdiscount = pdiscount;
	}
	int getPid() {
		return pid;
	}
	void setPid(int pid) {
		this.pid = pid;
	}
	String getPtitle() {
		return ptitle;
	}
	void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	int getPprice() {
		return pprice;
	}
	void setPprice(int pprice) {
		this.pprice = pprice;
	}
	int getPamount() {
		return pamount;
	}
	void setPamount(int pamount) {
		this.pamount = pamount;
	}
	String getPsellyn() {
		return psellyn;
	}
	void setPsellyn(String psellyn) {
		this.psellyn = psellyn;
	}
	String getSid() {
		return sid;
	}
	void setSid(String sid) {
		this.sid = sid;
	}
	int getPdiscount() {
		return pdiscount;
	}
	void setPdiscount(int pdiscount) {
		this.pdiscount = pdiscount;
	}
	static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Prodcut [pid=" + pid + ", ptitle=" + ptitle + ", pprice=" + pprice + ", pamount=" + pamount
				+ ", psellyn=" + psellyn + ", sid=" + sid + ", pdiscount=" + pdiscount + "]";
	}
	
	
}

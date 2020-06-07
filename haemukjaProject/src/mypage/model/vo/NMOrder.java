package mypage.model.vo;

import java.sql.Date;

public class NMOrder {
	private String ptitle;
	private int price;
	private Date odate;
	private int osid;
	private int pid;
	private int pcount;
	private String oname;
	public NMOrder() {
	}
	public NMOrder(String ptitle, int price, Date odate, int osid, int pid, int pcount, String oname) {
		super();
		this.ptitle = ptitle;
		this.price = price;
		this.odate = odate;
		this.osid = osid;
		this.pid = pid;
		this.pcount = pcount;
		this.oname = oname;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public int getOsid() {
		return osid;
	}
	public void setOsid(int osid) {
		this.osid = osid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	@Override
	public String toString() {
		return "NMOrder [ptitle=" + ptitle + ", price=" + price + ", odate=" + odate + ", osid=" + osid + ", pid=" + pid
				+ ", pcount=" + pcount + ", oname=" + oname + "]";
	}
	
	
	
	
}

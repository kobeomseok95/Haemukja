package mypage.model.vo;

import java.io.Serializable;

public class nMyCart implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4896365878636408755L;
	private String ptitle;
	private String thumbnail;	//파일이름
	private String pid;
	private String price;
	private String sbno;
	private String count;
	public nMyCart() {
		super();
	}
	public nMyCart(String ptitle, String thumbnail, String pid, String price, String sbno, String count) {
		super();
		this.ptitle = ptitle;
		this.thumbnail = thumbnail;
		this.pid = pid;
		this.price = price;
		this.sbno = sbno;
		this.count = count;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSbno() {
		return sbno;
	}
	public void setSbno(String sbno) {
		this.sbno = sbno;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "nMyCart [ptitle=" + ptitle + ", thumbnail=" + thumbnail + ", pid=" + pid + ", price=" + price
				+ ", sbno=" + sbno + ", count=" + count + "]";
	}
	
	
}

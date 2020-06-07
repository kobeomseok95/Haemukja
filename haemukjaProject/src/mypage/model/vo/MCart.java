package mypage.model.vo;

public class MCart {

	
	private int cid;
	private String mid;
	private int pid;
	private int camount;
	private String ptitle;
	private int pprice;
	private int sbno; // 판매글 번호
	public MCart() {
	}
	
	
	public MCart(int cid, String mid,String ptitle, int camount,  int pprice) {
		super();
		this.cid = cid;
		this.mid = mid;
		this.ptitle = ptitle;
		this.camount = camount;
		this.pprice = pprice;
	}


	public MCart(int cid, String mid,  String ptitle,int camount, int pprice, int sbno) {
		this.cid = cid;
		this.mid = mid;
		this.ptitle = ptitle;
		this.camount = camount;
		this.pprice = pprice;
		this.sbno = sbno;
	}
	
	
	public MCart(int cid, String mid, int pid, int camount, String ptitle, int pprice, int sbno) {
		super();
		this.cid = cid;
		this.mid = mid;
		this.pid = pid;
		this.camount = camount;
		this.ptitle = ptitle;
		this.pprice = pprice;
		this.sbno = sbno;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public int getCamount() {
		return camount;
	}


	public void setCamount(int camount) {
		this.camount = camount;
	}


	public String getPtitle() {
		return ptitle;
	}


	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}


	public int getPprice() {
		return pprice;
	}


	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


	public int getSbno() {
		return sbno;
	}


	public void setSbno(int sbno) {
		this.sbno = sbno;
	}


	@Override
	public String toString() {
		return "MCart [cid=" + cid + ", mid=" + mid + ", pid=" + pid + ", camount=" + camount + ", ptitle=" + ptitle
				+ ", pprice=" + pprice + ", sbno=" + sbno + "]";
	}



	
	
	
	
	
	
	
}

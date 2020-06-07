package product.model.vo;

import java.io.Serializable;

public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4502798713914275391L;
	
	private int pId;
	private String pTitle;
	private int price;
	private int pAmount;
	private String soldout;
	private String sId;
	private int pDiscount;
	private String pCode;
	
	public Product() {
		super();
	}
	
	public Product(int pId, String pTitle, int price, int pAmount, String soldout, String sId, int pDiscount,
			String pCode) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.price = price;
		this.pAmount = pAmount;
		this.soldout = soldout;
		this.sId = sId;
		this.pDiscount = pDiscount;
		this.pCode = pCode;
	}
	
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getpAmount() {
		return pAmount;
	}
	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}
	public String getSoldout() {
		return soldout;
	}
	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public int getpDiscount() {
		return pDiscount;
	}
	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pTitle=" + pTitle + ", price=" + price + ", pAmount=" + pAmount + ", soldout="
				+ soldout + ", sId=" + sId + ", pDiscount=" + pDiscount + ", pCode=" + pCode + "]";
	}

}

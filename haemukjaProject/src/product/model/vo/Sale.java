package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Sale implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2191876086174922791L;
	
	private int sbNo;
	private String sbTitle;
	private Date sbDate;
	private String sbContent;
	private String sbKind;
	private String sId;
	private int pId;
	
	public Sale() {
		super();
	}
	
	public Sale(int sbNo, String sbTitle, Date sbDate, String sbContent, String sbKind, String sId, int pId) {
		super();
		this.sbNo = sbNo;
		this.sbTitle = sbTitle;
		this.sbDate = sbDate;
		this.sbContent = sbContent;
		this.sbKind = sbKind;
		this.sId = sId;
		this.pId = pId;
	}
	
	public int getSbNo() {
		return sbNo;
	}
	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}
	public String getSbTitle() {
		return sbTitle;
	}
	public void setSbTitle(String sbTitle) {
		this.sbTitle = sbTitle;
	}
	public Date getSbDate() {
		return sbDate;
	}
	public void setSbDate(Date sbDate) {
		this.sbDate = sbDate;
	}
	public String getSbContent() {
		return sbContent;
	}
	public void setSbContent(String sbContent) {
		this.sbContent = sbContent;
	}
	public String getSbKind() {
		return sbKind;
	}
	public void setSbKind(String sbKind) {
		this.sbKind = sbKind;
	}
	public String getsId() {
		return sId;
	}
	public void setsId(String sId) {
		this.sId = sId;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		return "Sale [sbNo=" + sbNo + ", sbTitle=" + sbTitle + ", sbDate=" + sbDate + ", sbContent=" + sbContent
				+ ", sbKind=" + sbKind + ", sId=" + sId + ", pId=" + pId + "]";
	}
	

}

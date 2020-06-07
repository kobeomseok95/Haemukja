package product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7497237165412711316L;
	
	private int oId;
	private Date oDate;
	private String oWay;
	private Date oPayDate;
	private String shipCom;
	private int shipNo;
	private int pAmount;
	private String mId;
	private int pId;
	private int osId;
	private Date refDate;
	
	public Order() {
	}

	public Order(int oId, Date oDate, String oWay, Date oPayDate, String shipCom, int shipNo, int pAmount, String mId,
			int pId, int osId, Date refDate) {
		this.oId = oId;
		this.oDate = oDate;
		this.oWay = oWay;
		this.oPayDate = oPayDate;
		this.shipCom = shipCom;
		this.shipNo = shipNo;
		this.pAmount = pAmount;
		this.mId = mId;
		this.pId = pId;
		this.osId = osId;
		this.refDate = refDate;
	}

	public int getoId() {
		return oId;
	}

	public void setoId(int oId) {
		this.oId = oId;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	public String getoWay() {
		return oWay;
	}

	public void setoWay(String oWay) {
		this.oWay = oWay;
	}

	public Date getoPayDate() {
		return oPayDate;
	}

	public void setoPayDate(Date oPayDate) {
		this.oPayDate = oPayDate;
	}

	public String getShipCom() {
		return shipCom;
	}

	public void setShipCom(String shipCom) {
		this.shipCom = shipCom;
	}

	public int getShipNo() {
		return shipNo;
	}

	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}

	public int getpAmount() {
		return pAmount;
	}

	public void setpAmount(int pAmount) {
		this.pAmount = pAmount;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getOsId() {
		return osId;
	}

	public void setOsId(int osId) {
		this.osId = osId;
	}

	public Date getRefDate() {
		return refDate;
	}

	public void setRefDate(Date refDate) {
		this.refDate = refDate;
	}

	@Override
	public String toString() {
		return "Order [oId=" + oId + ", oDate=" + oDate + ", oWay=" + oWay + ", oPayDate=" + oPayDate + ", shipCom="
				+ shipCom + ", shipNo=" + shipNo + ", pAmount=" + pAmount + ", mId=" + mId + ", pId=" + pId + ", osId="
				+ osId + ", refDate=" + refDate + "]";
	}
	
}

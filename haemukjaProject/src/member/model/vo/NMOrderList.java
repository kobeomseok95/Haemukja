package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class NMOrderList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8220592040997503848L;
	

	
	private int oid;
	private Date odate;
	private String oway;
	private Date opaydate;
	private String opayyn;
	private String shipcom;
	private int shipno;
	private String ostate;
	private int nmno;
	public NMOrderList() {
	}
	public NMOrderList(int oid, Date odate, String oway, Date opaydate, String opayyn, String shipcom, int shipno,
			String ostate, int nmno) {
		super();
		this.oid = oid;
		this.odate = odate;
		this.oway = oway;
		this.opaydate = opaydate;
		this.opayyn = opayyn;
		this.shipcom = shipcom;
		this.shipno = shipno;
		this.ostate = ostate;
		this.nmno = nmno;
	}
	int getOid() {
		return oid;
	}
	void setOid(int oid) {
		this.oid = oid;
	}
	Date getOdate() {
		return odate;
	}
	void setOdate(Date odate) {
		this.odate = odate;
	}
	String getOway() {
		return oway;
	}
	void setOway(String oway) {
		this.oway = oway;
	}
	Date getOpaydate() {
		return opaydate;
	}
	void setOpaydate(Date opaydate) {
		this.opaydate = opaydate;
	}
	String getOpayyn() {
		return opayyn;
	}
	void setOpayyn(String opayyn) {
		this.opayyn = opayyn;
	}
	String getShipcom() {
		return shipcom;
	}
	void setShipcom(String shipcom) {
		this.shipcom = shipcom;
	}
	int getShipno() {
		return shipno;
	}
	void setShipno(int shipno) {
		this.shipno = shipno;
	}
	String getOstate() {
		return ostate;
	}
	void setOstate(String ostate) {
		this.ostate = ostate;
	}
	int getNmno() {
		return nmno;
	}
	void setNmno(int nmno) {
		this.nmno = nmno;
	}
	static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "NMOrderList [oid=" + oid + ", odate=" + odate + ", oway=" + oway + ", opaydate=" + opaydate
				+ ", opayyn=" + opayyn + ", shipcom=" + shipcom + ", shipno=" + shipno + ", ostate=" + ostate
				+ ", nmno=" + nmno + "]";
	}
	
	

}

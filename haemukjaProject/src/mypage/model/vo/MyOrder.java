package mypage.model.vo;

import java.sql.Date;

public class MyOrder {

   private String ptitle;
   private int oid;            //주문번호
   private Date odate;      //주문날짜
   private String oway;      //주문수단
   private Date opatdate;   //결제날짜
   private String shipcom;   //운송장
   private int shipno;         //운송장번호
   private int pamount;      //구매수량
   private String mid;         //회원아이디
   private int pid;            //물품번호
   private int payment;      // 결제금액
   private int osid;            //교환,환불,배송완료여부ID
   private String oname;   //교환,환불,배송완료여부
   private Date refdate;      //교환신청날짜
   private int sbno;   //게시글 번호
   
   public MyOrder() {
   }
   
   
   
   public MyOrder(String ptitle, Date odate,  Date refdate,String oname,int sbno) {
      super();
      this.ptitle = ptitle;
      this.odate = odate;
      this.refdate = refdate;
      this.oname = oname;
      this.sbno=sbno;
      
   }



   public MyOrder(int pid, String ptitle, Date odate, String shipcom, int shipno, String mid, int osid, String oname, int oid, int pamount, int sbno) {
      this.pid = pid;
      this.ptitle = ptitle;
      this.odate = odate;
      this.shipcom = shipcom;
      this.shipno = shipno;
      this.mid = mid;
      this.osid=osid;
      this.oname=oname;
      this.oid=oid;
      this.pamount=pamount;
      this.sbno=sbno;
   }



   public MyOrder(String ptitle, int oid, Date odate, String oway, Date opatdate, String shipcom, int shipno,
         int pamount, String mid, int pid, int payment, int osid, String oname, Date refdate, int sbno) {
      this.ptitle = ptitle;
      this.oid = oid;
      this.odate = odate;
      this.oway = oway;
      this.opatdate = opatdate;
      this.shipcom = shipcom;
      this.shipno = shipno;
      this.pamount = pamount;
      this.mid = mid;
      this.pid = pid;
      this.payment = payment;
      this.osid = osid;
      this.oname = oname;
      this.refdate = refdate;
      this.sbno = sbno;
   }



   public String getPtitle() {
      return ptitle;
   }



   public void setPtitle(String ptitle) {
      this.ptitle = ptitle;
   }



   public int getOid() {
      return oid;
   }



   public void setOid(int oid) {
      this.oid = oid;
   }



   public Date getOdate() {
      return odate;
   }



   public void setOdate(Date odate) {
      this.odate = odate;
   }



   public String getOway() {
      return oway;
   }



   public void setOway(String oway) {
      this.oway = oway;
   }



   public Date getOpatdate() {
      return opatdate;
   }



   public void setOpatdate(Date opatdate) {
      this.opatdate = opatdate;
   }



   public String getShipcom() {
      return shipcom;
   }



   public void setShipcom(String shipcom) {
      this.shipcom = shipcom;
   }



   public int getShipno() {
      return shipno;
   }



   public void setShipno(int shipno) {
      this.shipno = shipno;
   }



   public int getPamount() {
      return pamount;
   }



   public void setPamount(int pamount) {
      this.pamount = pamount;
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



   public int getPayment() {
      return payment;
   }



   public void setPayment(int payment) {
      this.payment = payment;
   }



   public int getOsid() {
      return osid;
   }



   public void setOsid(int osid) {
      this.osid = osid;
   }



   public String getOname() {
      return oname;
   }



   public void setOname(String oname) {
      this.oname = oname;
   }



   public Date getRefdate() {
      return refdate;
   }



   public void setRefdate(Date refdate) {
      this.refdate = refdate;
   }



   public int getSbno() {
      return sbno;
   }



   public void setSbno(int sbno) {
      this.sbno = sbno;
   }



   @Override
   public String toString() {
      return "MyOrder [ptitle=" + ptitle + ", oid=" + oid + ", odate=" + odate + ", oway=" + oway + ", opatdate="
            + opatdate + ", shipcom=" + shipcom + ", shipno=" + shipno + ", pamount=" + pamount + ", mid=" + mid
            + ", pid=" + pid + ", payment=" + payment + ", osid=" + osid + ", oname=" + oname + ", refdate="
            + refdate + ", sbno=" + sbno + "]";
   }
   
}
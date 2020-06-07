package product.model.vo;

import java.sql.Date;

public class Review {
	private int rno;   // 리뷰번호
	private int sbno;   // 게시글번호
	private String mid; // 아이디
	private String content; // 리뷰글
	private Date odate;      // 주문날짜
	private String name;   
	private String nickname;
	
	public Review() {
	}
	
	public Review(int rno, int sbno, String mid, String content, Date odate, String name, String nickname) {
		this.rno = rno;
	    this.sbno = sbno;
	    this.mid = mid;
	    this.content = content;
	    this.odate = odate;
	    this.name = name;
	    this.nickname = nickname;
	}
	
	public int getRno() {
	    return rno;
	}
	public void setRno(int rno) {
	    this.rno = rno;
	}
	public int getSbno() {
	    return sbno;
	}
	public void setSbno(int sbno) {
	    this.sbno = sbno;
	}
	public String getMid() {
	    return mid;
	}
	public void setMid(String mid) {
	    this.mid = mid;
	}
	public String getContent() {
	    return content;
	}
   public void setContent(String content) {
      this.content = content;
   }
   public Date getOdate() {
      return odate;
   }
   public void setOdate(Date odate) {
      this.odate = odate;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getNickname() {
      return nickname;
   }
   public void setNickname(String nickname) {
      this.nickname = nickname;
   }
   
   @Override
   public String toString() {
      return "Review [rno=" + rno + ", sbno=" + sbno + ", mid=" + mid + ", content=" + content + ", odate=" + odate
            + ", name=" + name + ", nickname=" + nickname + "]";
   }

}

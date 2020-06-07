package qna.model.vo;

import java.sql.Date;

public class Comment {
   private int rnum;      //댓글번호
   private int qid;      //질문아이디
   private String comment;   //내용
   private String writer;   //작성자(별명)
   private Date cdate;      //작성날짜
   public Comment() {
   }
   public Comment(int qid, String comment, String writer) {
      this.qid = qid;
      this.comment = comment;
      this.writer = writer;
   }
   public Comment(int rnum, int qid, String comment, String writer, Date cdate) {
      this.rnum = rnum;
      this.qid = qid;
      this.comment = comment;
      this.writer = writer;
      this.cdate = cdate;
   }
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public int getQid() {
      return qid;
   }
   public void setQid(int qid) {
      this.qid = qid;
   }
   public String getComment() {
      return comment;
   }
   public void setComment(String comment) {
      this.comment = comment;
   }
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public Date getCdate() {
      return cdate;
   }
   public void setCdate(Date cdate) {
      this.cdate = cdate;
   }
   @Override
   public String toString() {
      return "Comment [rnum=" + rnum + ", qid=" + qid + ", comment=" + comment + ", writer=" + writer + ", cdate="
            + cdate + "]";
   }
   
}
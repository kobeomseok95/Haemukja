package manager.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6712125669389617839L;
	
	private int reportNo;
	private String reportMid;
	private String badMember;
	private int reportBNo;
	private String reportContent;
	private Date reportDate;
	private String checkAdmin;
	
	public Report() {
	}
	
	public Report(int reportNo, String reportMid, String badMember, int reportBNo, String reportContent,
			Date reportDate, String checkAdmin) {
		this.reportNo = reportNo;
		this.reportMid = reportMid;
		this.badMember = badMember;
		this.reportBNo = reportBNo;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.checkAdmin = checkAdmin;
	}
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public String getReportMid() {
		return reportMid;
	}
	public void setReportMid(String reportMid) {
		this.reportMid = reportMid;
	}
	public String getBadMember() {
		return badMember;
	}
	public void setBadMember(String badMember) {
		this.badMember = badMember;
	}
	public int getReportBNo() {
		return reportBNo;
	}
	public void setReportBNo(int reportBNo) {
		this.reportBNo = reportBNo;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public Date getReportDate() {
		return reportDate;
	}
	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}
	public String getCheckAdmin() {
		return checkAdmin;
	}
	public void setCheckAdmin(String checkAdmin) {
		this.checkAdmin = checkAdmin;
	}
	
	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportMid=" + reportMid + ", badMember=" + badMember + ", reportBNo="
				+ reportBNo + ", reportContent=" + reportContent + ", reportDate=" + reportDate + ", checkAdmin="
				+ checkAdmin + "]";
	}
	
}

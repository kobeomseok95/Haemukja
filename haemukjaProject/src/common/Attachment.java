package common;

import java.sql.Date;

public class Attachment {
	private int aId;
	private int bNo;
	private int sbNo;
	private String fileName;
	private String filePath;
	private Date uploadDate;
	private int level;
	private String status;
	
	public Attachment() {
	}

	public Attachment(int aId, int bNo, int sbNo, String fileName, String filePath, Date uploadDate, int level,
			String status) {
		super();
		this.aId = aId;
		this.bNo = bNo;
		this.sbNo = sbNo;
		this.fileName = fileName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.level = level;
		this.status = status;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public int getSbNo() {
		return sbNo;
	}

	public void setSbNo(int sbNo) {
		this.sbNo = sbNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [aId=" + aId + ", bNo=" + bNo + ", sbNo=" + sbNo + ", fileName=" + fileName + ", filePath="
				+ filePath + ", uploadDate=" + uploadDate + ", level=" + level + ", status=" + status + "]";
	}
	
}

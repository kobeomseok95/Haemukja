package qna.model.vo;

public class Notice {
	private int nno;
	private String ntitle;
	private String ncontent;
	   
	public Notice() {
	}

	public Notice(int nno, String ntitle, String ncontent) {
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", ntitle=" + ntitle + ", ncontent=" + ncontent + "]";
	}


}

package recipe.model.vo;

public class Tag {
	private int aId;
	private int tNo;
	private String tag;
	private String pTitle;
	
	public Tag() {
	}

	public Tag(int aId, int tNo, String tag, String pTitle) {
		this.aId = aId;
		this.tNo = tNo;
		this.tag = tag;
		this.pTitle = pTitle;
	}

	public Tag(int aId, int tNo, String tag) {
		super();
		this.aId = aId;
		this.tNo = tNo;
		this.tag = tag;
	}

	public int getaId() {
		return aId;
	}

	public void setaId(int aId) {
		this.aId = aId;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getpTitle() {
		return pTitle;
	}

	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}

	@Override
	public String toString() {
		return "Tag [aId=" + aId + ", tNo=" + tNo + ", tag=" + tag + ", pTitle=" + pTitle + "]";
	}

}

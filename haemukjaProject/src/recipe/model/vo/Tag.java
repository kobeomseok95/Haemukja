package recipe.model.vo;

public class Tag {
	private int aId;
	private int tNo;
	private String tag;
	
	public Tag() {
	}

	public Tag(int aId, int tNo, String tag) {
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

	@Override
	public String toString() {
		return "Tag [aId=" + aId + ", tNo=" + tNo + ", tag=" + tag + "]";
	}
}

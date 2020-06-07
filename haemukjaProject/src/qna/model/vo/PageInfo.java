package qna.model.vo;

public class PageInfo {
	private int totalCount;
	private int currentPage;
	private int displayRow;
	private int displayPage;
	private int maxPage;
	private int beginPage;
	private int endPage;
	public PageInfo(int totalCount, int currentPage, int displayRow, int displayPage, int maxPage, int beginPage,
			int endPage) {
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.displayRow = displayRow;
		this.displayPage = displayPage;
		this.maxPage = maxPage;
		this.beginPage = beginPage;
		this.endPage = endPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "PageInfo [totalCount=" + totalCount + ", currentPage=" + currentPage + ", displayRow=" + displayRow
				+ ", displayPage=" + displayPage + ", maxPage=" + maxPage + ", beginPage=" + beginPage + ", endPage="
				+ endPage + "]";
	}
}

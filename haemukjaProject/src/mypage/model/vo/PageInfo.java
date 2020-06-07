package mypage.model.vo;

public class PageInfo {
	private int currentPage;	// 현재 페이지를 저장할 변수
	private int listCount;
	private int limit;			// 한 페이지에 보여질 게시글 수
	private int maxPage;		// 전체 페이지의 맨 마지막 페이지
	private int startPage;		// 한번에 표시될 페이지가 시작할 페이지
	private int endPage;		// 한번에 표시될 페이지가 끝나는 페이지
	
	
	public PageInfo() {
		
	}


	public PageInfo(int currentPage, int listCount, int limit, int maxPage, int startPage, int endPage) {
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.limit = limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getListCount() {
		return listCount;
	}


	public void setListCount(int listCount) {
		this.listCount = listCount;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public int getMaxPage() {
		return maxPage;
	}


	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", limit=" + limit + ", maxPage="
				+ maxPage + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	



}

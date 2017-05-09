package b90ft4.web.repository.vo;

public class PageVO {
	private int pageNo = 1;

	public int getBegin() {
		return (pageNo-1) * 6;
	}
	public int getEnd() {
		return 6;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}

package b90ft4.web.repository.vo;

import java.util.Date;

public class DiaryVO {
	private int diaryNo;
	private String userId;
	private int latitude;
	private int longitude;
	private String weatherCity;
	private String title;
	private String content;
	private Date diaryDate;
	private String fileOri;
	
	public Date getDiaryDate() {
		return diaryDate;
	}
	public void setDiaryDate(Date diaryDate) {
		this.diaryDate = diaryDate;
	}
	private String fileNew;
	private String filePath;
	
	public String getFileOri() {
		return fileOri;
	}
	public void setFileOri(String fileOri) {
		this.fileOri = fileOri;
	}
	public String getFileNew() {
		return fileNew;
	}
	public void setFileNew(String fileNew) {
		this.fileNew = fileNew;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getUserId() {
		return userId;
	}
	public int getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(int diaryNo) {
		this.diaryNo = diaryNo;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	public String getWeatherCity() {
		return weatherCity;
	}
	public void setWeatherCity(String weatherCity) {
		this.weatherCity = weatherCity;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

}

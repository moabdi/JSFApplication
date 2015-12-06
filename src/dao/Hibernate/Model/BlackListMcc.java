package dao.Hibernate.Model;
// default package
// Generated 27 juil. 2009 11:31:40 by Hibernate Tools 3.2.2.GA

/**
 * BlackListMcc generated by hbm2java
 */
public class BlackListMcc implements java.io.Serializable {

	private String mccCode;
	private String wording;

	public BlackListMcc() {
	}

	public BlackListMcc(String mccCode) {
		this.mccCode = mccCode;
	}

	public BlackListMcc(String mccCode, String wording) {
		this.mccCode = mccCode;
		this.wording = wording;
	}

	public String getMccCode() {
		return this.mccCode;
	}

	public void setMccCode(String mccCode) {
		this.mccCode = mccCode;
	}

	public String getWording() {
		return this.wording;
	}

	public void setWording(String wording) {
		this.wording = wording;
	}

}
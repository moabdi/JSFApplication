package dao.Hibernate.Model;

// Generated 12 ao�t 2009 12:08:03 by Hibernate Tools 3.2.2.GA

/**
 * City generated by hbm2java
 */
public class City implements java.io.Serializable {

	private String cityCode;
	private String countryCode;
	private String wording;
	
	public City() {
	}

	public City(String cityCode) {
		this.cityCode = cityCode;
	}

	public City(String cityCode, String countryCode, String wording) {
		this.cityCode = cityCode;
		this.countryCode = countryCode;
		this.wording = wording;
	}

	public String getCityCode() {
		return this.cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getWording() {
		return this.wording;
	}

	public void setWording(String wording) {
		this.wording = wording;
	}

	

}

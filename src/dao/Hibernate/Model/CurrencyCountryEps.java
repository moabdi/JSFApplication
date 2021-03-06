package dao.Hibernate.Model;

/**
 * CurrencyCountryEpsId generated by MyEclipse Persistence Tools
 */

public class CurrencyCountryEps implements java.io.Serializable {

	// Fields

	private String currencyCode;

	private String wording;

	private Long exponent;

	private String isoCurrencyAlpha;

	private String countryCode;

	private String wordingCountry;

	private String countryLabelVisa;

	private String isoCountryAlpha;

	// Constructors

	/** default constructor */
	public CurrencyCountryEps() {
	}

	/** full constructor */
	public CurrencyCountryEps(String currencyCode, String wording,
			Long exponent, String isoCurrencyAlpha, String countryCode,
			String wordingCountry, String countryLabelVisa,
			String isoCountryAlpha) {
		this.currencyCode = currencyCode;
		this.wording = wording;
		this.exponent = exponent;
		this.isoCurrencyAlpha = isoCurrencyAlpha;
		this.countryCode = countryCode;
		this.wordingCountry = wordingCountry;
		this.countryLabelVisa = countryLabelVisa;
		this.isoCountryAlpha = isoCountryAlpha;
	}

	// Property accessors

	public String getCurrencyCode() {
		return this.currencyCode;
	}

	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}

	public String getWording() {
		return this.wording;
	}

	public void setWording(String wording) {
		this.wording = wording;
	}

	public Long getExponent() {
		return this.exponent;
	}

	public void setExponent(Long exponent) {
		this.exponent = exponent;
	}

	public String getIsoCurrencyAlpha() {
		return this.isoCurrencyAlpha;
	}

	public void setIsoCurrencyAlpha(String isoCurrencyAlpha) {
		this.isoCurrencyAlpha = isoCurrencyAlpha;
	}

	public String getCountryCode() {
		return this.countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getWordingCountry() {
		return this.wordingCountry;
	}

	public void setWordingCountry(String wordingCountry) {
		this.wordingCountry = wordingCountry;
	}

	public String getCountryLabelVisa() {
		return this.countryLabelVisa;
	}

	public void setCountryLabelVisa(String countryLabelVisa) {
		this.countryLabelVisa = countryLabelVisa;
	}

	public String getIsoCountryAlpha() {
		return this.isoCountryAlpha;
	}

	public void setIsoCountryAlpha(String isoCountryAlpha) {
		this.isoCountryAlpha = isoCountryAlpha;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CurrencyCountryEps))
			return false;
		CurrencyCountryEps castOther = (CurrencyCountryEps) other;

		return ((this.getCurrencyCode() == castOther.getCurrencyCode()) || (this
				.getCurrencyCode() != null
				&& castOther.getCurrencyCode() != null && this
				.getCurrencyCode().equals(castOther.getCurrencyCode())))
				&& ((this.getWording() == castOther.getWording()) || (this
						.getWording() != null
						&& castOther.getWording() != null && this.getWording()
						.equals(castOther.getWording())))
				&& ((this.getExponent() == castOther.getExponent()) || (this
						.getExponent() != null
						&& castOther.getExponent() != null && this
						.getExponent().equals(castOther.getExponent())))
				&& ((this.getIsoCurrencyAlpha() == castOther
						.getIsoCurrencyAlpha()) || (this.getIsoCurrencyAlpha() != null
						&& castOther.getIsoCurrencyAlpha() != null && this
						.getIsoCurrencyAlpha().equals(
								castOther.getIsoCurrencyAlpha())))
				&& ((this.getCountryCode() == castOther.getCountryCode()) || (this
						.getCountryCode() != null
						&& castOther.getCountryCode() != null && this
						.getCountryCode().equals(castOther.getCountryCode())))
				&& ((this.getWordingCountry() == castOther.getWordingCountry()) || (this
						.getWordingCountry() != null
						&& castOther.getWordingCountry() != null && this
						.getWordingCountry().equals(
								castOther.getWordingCountry())))
				&& ((this.getCountryLabelVisa() == castOther
						.getCountryLabelVisa()) || (this.getCountryLabelVisa() != null
						&& castOther.getCountryLabelVisa() != null && this
						.getCountryLabelVisa().equals(
								castOther.getCountryLabelVisa())))
				&& ((this.getIsoCountryAlpha() == castOther
						.getIsoCountryAlpha()) || (this.getIsoCountryAlpha() != null
						&& castOther.getIsoCountryAlpha() != null && this
						.getIsoCountryAlpha().equals(
								castOther.getIsoCountryAlpha())));
	}

	public int hashCode() {
		int result = 17;

		result = 37
				* result
				+ (getCurrencyCode() == null ? 0 : this.getCurrencyCode()
						.hashCode());
		result = 37 * result
				+ (getWording() == null ? 0 : this.getWording().hashCode());
		result = 37 * result
				+ (getExponent() == null ? 0 : this.getExponent().hashCode());
		result = 37
				* result
				+ (getIsoCurrencyAlpha() == null ? 0 : this
						.getIsoCurrencyAlpha().hashCode());
		result = 37
				* result
				+ (getCountryCode() == null ? 0 : this.getCountryCode()
						.hashCode());
		result = 37
				* result
				+ (getWordingCountry() == null ? 0 : this.getWordingCountry()
						.hashCode());
		result = 37
				* result
				+ (getCountryLabelVisa() == null ? 0 : this
						.getCountryLabelVisa().hashCode());
		result = 37
				* result
				+ (getIsoCountryAlpha() == null ? 0 : this.getIsoCountryAlpha()
						.hashCode());
		return result;
	}

}
package dao.Hibernate.Model;

/**
 * PageAccessParamId generated by MyEclipse Persistence Tools
 */

public class PageAccessParamId implements java.io.Serializable {

	// Fields

	private String role;

	private String page;

	// Constructors

	/** default constructor */
	public PageAccessParamId() {
	}

	/** full constructor */
	public PageAccessParamId(String role, String page) {
		this.role = role;
		this.page = page;
	}

	// Property accessors

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPage() {
		return this.page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof PageAccessParamId))
			return false;
		PageAccessParamId castOther = (PageAccessParamId) other;

		return ((this.getRole() == castOther.getRole()) || (this.getRole() != null
				&& castOther.getRole() != null && this.getRole().equals(
				castOther.getRole())))
				&& ((this.getPage() == castOther.getPage()) || (this.getPage() != null
						&& castOther.getPage() != null && this.getPage()
						.equals(castOther.getPage())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getRole() == null ? 0 : this.getRole().hashCode());
		result = 37 * result
				+ (getPage() == null ? 0 : this.getPage().hashCode());
		return result;
	}

}
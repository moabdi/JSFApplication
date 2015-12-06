package dao.Hibernate.Model;

import java.io.Serializable;
import java.util.Date;

public class ApplicationTracesId implements Serializable {

	
	private Date logDate;
	private String moduleCode;	
	
	public ApplicationTracesId() {

	}

	public ApplicationTracesId(Date logDate, String moduleCode) {
	
		this.logDate = logDate;
		this.moduleCode = moduleCode;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	public String getModuleCode() {
		return moduleCode;
	}

	public void setModuleCode(String moduleCode) {
		this.moduleCode = moduleCode;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((logDate == null) ? 0 : logDate.hashCode());
		result = prime * result
				+ ((moduleCode == null) ? 0 : moduleCode.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final ApplicationTracesId other = (ApplicationTracesId) obj;
		if (logDate == null) {
			if (other.logDate != null)
				return false;
		} else if (!logDate.equals(other.logDate))
			return false;
		if (moduleCode == null) {
			if (other.moduleCode != null)
				return false;
		} else if (!moduleCode.equals(other.moduleCode))
			return false;
		return true;
	}
	
	
	
}

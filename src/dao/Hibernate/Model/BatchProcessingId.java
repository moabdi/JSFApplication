package dao.Hibernate.Model;

// Generated 18 juin 2009 15:40:33 by Hibernate Tools 3.2.2.GA

import java.math.BigDecimal;
import java.util.Date;

/**
 * BatchProcessingId generated by hbm2java
 */
public class BatchProcessingId implements java.io.Serializable {

	private String bankCode;
	private String batchCode;
	private String batchGroup;
	

	public BatchProcessingId() {
	}

	public BatchProcessingId(String bankCode, String batchCode,
			String batchGroup) {
		this.bankCode = bankCode;
		this.batchCode = batchCode;
		this.batchGroup = batchGroup;
		
	}

	public String getBankCode() {
		return this.bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBatchCode() {
		return this.batchCode;
	}

	public void setBatchCode(String batchCode) {
		this.batchCode = batchCode;
	}

	public String getBatchGroup() {
		return this.batchGroup;
	}

	public void setBatchGroup(String batchGroup) {
		this.batchGroup = batchGroup;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((bankCode == null) ? 0 : bankCode.hashCode());
		result = prime * result
				+ ((batchCode == null) ? 0 : batchCode.hashCode());
		result = prime * result
				+ ((batchGroup == null) ? 0 : batchGroup.hashCode());
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
		final BatchProcessingId other = (BatchProcessingId) obj;
		if (bankCode == null) {
			if (other.bankCode != null)
				return false;
		} else if (!bankCode.equals(other.bankCode))
			return false;
		if (batchCode == null) {
			if (other.batchCode != null)
				return false;
		} else if (!batchCode.equals(other.batchCode))
			return false;
		if (batchGroup == null) {
			if (other.batchGroup != null)
				return false;
		} else if (!batchGroup.equals(other.batchGroup))
			return false;
		return true;
	}

	


}

package dao.Hibernate.Model;

// Generated 16 avr. 2010 09:34:42 by Hibernate Tools 3.2.2.GA

import java.io.Serializable;

/**
 * ErrorsType generated by hbm2java
 */
public class ErrorsType implements java.io.Serializable {

	private String errorCode;
	private String errorName;
	private String errorSend;

	public ErrorsType() {
	}

	public ErrorsType(String errorCode) {
		this.errorCode = errorCode;
	}

	public ErrorsType(String errorCode, String errorName, String errorSend) {
		this.errorCode = errorCode;
		this.errorName = errorName;
		this.errorSend = errorSend;
	}

	public String getErrorCode() {
		return this.errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorName() {
		return this.errorName;
	}

	public void setErrorName(String errorName) {
		this.errorName = errorName;
	}

	public Serializable getErrorSend() {
		return this.errorSend;
	}

	public void setErrorSend(String errorSend) {
		this.errorSend = errorSend;
	}

}

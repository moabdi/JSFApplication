package metier.epsTools;

import java.io.Serializable;
import java.math.BigDecimal;

public class InterfaceNodeObject implements Serializable {

	private String nodeCode;
	private String nodeTitle;
	private String nodeImg;
	private String nodeMenu;
	private String nodeComments;
	private String nodeBank;
	
	public InterfaceNodeObject() {
	}
	

	public InterfaceNodeObject(String nodeCode, String nodeTitle,
			String nodeImg, String nodeMenu, String nodeBank) {
		this.nodeCode = nodeCode;
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
		this.nodeMenu = nodeMenu;
		this.nodeBank = nodeBank;
	}



	public InterfaceNodeObject(String nodeCode, String nodeTitle,
			String nodeImg, String nodeMenu, String nodeComments,
			String nodeBank) {
		this.nodeCode = nodeCode;
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
		this.nodeMenu = nodeMenu;
		this.nodeComments = nodeComments;
		this.nodeBank = nodeBank;
	}


	public String getNodeCode() {
		return nodeCode;
	}


	public void setNodeCode(String nodeCode) {
		this.nodeCode = nodeCode;
	}


	public String getNodeTitle() {
		return nodeTitle;
	}


	public void setNodeTitle(String nodeTitle) {
		this.nodeTitle = nodeTitle;
	}


	public String getNodeImg() {
		return nodeImg;
	}


	public void setNodeImg(String nodeImg) {
		this.nodeImg = nodeImg;
	}


	public String getNodeMenu() {
		return nodeMenu;
	}


	public void setNodeMenu(String nodeMenu) {
		this.nodeMenu = nodeMenu;
	}


	public String getNodeComments() {
		return nodeComments;
	}


	public void setNodeComments(String nodeComments) {
		this.nodeComments = nodeComments;
	}


	public String getNodeBank() {
		return nodeBank;
	}


	public void setNodeBank(String nodeBank) {
		this.nodeBank = nodeBank;
	}


}

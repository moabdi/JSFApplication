package metier.epsTools;

import java.io.Serializable;
import java.math.BigDecimal;

public class AtmNodeObject implements Serializable {

	private String nodeTitle;
	private String nodeImg;
	private String nodeMenu;
	private String nodeComments;
	private String nodeTerminal;
	
    private String cassetteRendred;
	public AtmNodeObject() {
	}

	public AtmNodeObject(String nodeTitle, String nodeImg, String nodeComments) {
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
		this.nodeComments = nodeComments;
	}
	public AtmNodeObject(String nodeTitle, String nodeImg, String nodeMenu,String cassetteRendred) {
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
		this.nodeMenu = nodeMenu;		
		this.cassetteRendred = cassetteRendred;
	}
	
	public AtmNodeObject(String nodeTitle, String nodeImg, String nodeMenu,String cassetteRendred, String nodeTerminal) {
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
		this.nodeMenu = nodeMenu;
		this.nodeTerminal = nodeTerminal;
		this.cassetteRendred = cassetteRendred;
	}


	public AtmNodeObject(String nodeTitle, String nodeImg, String nodeMenu,
			String cassetteRendred, String nodeTerminal, String nodeComments) {
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
		this.nodeMenu = nodeMenu;
		this.cassetteRendred = cassetteRendred;
		this.nodeTerminal = nodeTerminal;
		this.nodeComments = nodeComments;
	}

	public String getNodeComments() {
		return nodeComments;
	}

	public void setNodeComments(String nodeComments) {
		this.nodeComments = nodeComments;
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

	

	public String getCassetteRendred() {
		return cassetteRendred;
	}

	public void setCassetteRendred(String cassetteRendred) {
		this.cassetteRendred = cassetteRendred;
	}

	public String getNodeTerminal() {
		return nodeTerminal;
	}

	public void setNodeTerminal(String nodeTerminal) {
		this.nodeTerminal = nodeTerminal;
	}

}

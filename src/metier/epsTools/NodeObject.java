package metier.epsTools;

import java.io.Serializable;

public class NodeObject implements Serializable {
	
	private String nodeTitle;
	private String nodeImg;
	
	
	public NodeObject() {
	}


	public NodeObject(String nodeTitle, String nodeImg) {
		this.nodeTitle = nodeTitle;
		this.nodeImg = nodeImg;
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
	
	

}

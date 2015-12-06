package web.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.richfaces.component.html.HtmlDataTable;

import dao.Hibernate.Model.EpsAdministrationMessage;
import dao.Hibernate.Model.EpsMemos;
import dao.Hibernate.Model.EpsPlanning;
import dao.Hibernate.Model.VListOfClaim;
import metier.appLists.ApplicationLists;
import dao.DAO;
import dao.HibernateSessionFactory;
import metier.globalVars.GlobalVars;
import metier.eps.jsf.security.AbstractBakingBean;
import metier.eps.jsf.security.LoginSecurity;
import metier.eps.jsf.security.user.UserContext;

public class WelcomeBB extends AbstractBakingBean implements LoginSecurity {

private List criteriaHUO;
private List criteriaMEMO;
private List criteriaADMN_MSG;
private List criteriaPlanning;
private List criteriaCARDFavor;
private List criteriaTerminalFavor;
private List criteriaClaim=new ArrayList();
private List criteriaClaimMerchant;
private List pass;

public HtmlDataTable datableHUO;
public HtmlDataTable datableMEMO;
public HtmlDataTable datableADMN_MSG;
public HtmlDataTable datablePlanning;
public HtmlDataTable datableCARDFavor;
public HtmlDataTable datableTERMFavor;
public HtmlDataTable datableClaim;
public HtmlDataTable datableClaimMerchant;

public static EpsMemos memoApasser;
public static EpsAdministrationMessage admnApasser;
public static EpsPlanning planningApasser;
public static VListOfClaim claimAPasser;
public String  result;
public String  resultmerch;
public static boolean pollEnabled = false;
public static String FORWARD_TO_WELCOME_ARA="ForwardToWellcomeAra";

private String enterModif = "WelcomeBB-search"; // variable pour le menu



public String usercode;
public HtmlDataTable getDatableHUO() {
	return datableHUO;
}


public void setDatableHUO(HtmlDataTable datableHUO) {
	this.datableHUO = datableHUO;
}


public HtmlDataTable getDatableMEMO() {
	return datableMEMO;
}


public void setDatableMEMO(HtmlDataTable datableMEMO) {
	this.datableMEMO = datableMEMO;
}


public WelcomeBB(){
	initUserContext();
	/*criteriaClaim=new ArrayList();
	//loadHistoryUserOpt();
	setPollEnabled(true);
	ApplicationLists.InitStaticLists();
	//initiate GlobalVars
	GlobalVars.init();
	
	loadMemos();
	loadAdmin_msg();
	loadPlanning();
	loadCardFavor();
	loadTerminalFavor();
	loadClaim();
	loadMerchant();
	//setPollEnabled(false);
*/}



public List loadCardFavor() {
	
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaCARDFavor = dao.findThreeResult("CardFavoris", "expiryDate", "id.userCharging", usercode);
	return criteriaCARDFavor;
}

public List loadTerminalFavor() {
	
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaTerminalFavor= dao.findThreeResult("TerminalFavoris", "id.atmTerminalNumber", "id.userCharging", usercode);
	return criteriaTerminalFavor;
}

public List loadClaim() {
	
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaClaim= dao.findThreeResultPersonaliser("VListOfClaim", "dateAndTimeCall", "userProcessing",
			usercode,"statusCode","O","entity","C");
	
	/*for (VListOfClaim temp: (List<VListOfClaim>)criteriaClaim){
		String champ=temp.getCallReason();
		result= (String) dao.findWording("CallReasonCard", "id.reasonCode",champ,"wording");
		
		//result=val.getWording();
	}*/
	//criteriaClaim.add(result);
	//criteriaClaim=pass;
	return criteriaClaim;
}

public List loadMerchant() {
	
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaClaimMerchant= dao.findThreeResultPersonaliser("VListOfClaim", "dateAndTimeCall", "userProcessing",
			usercode,"statusCode","O","entity","M");
	
	for (VListOfClaim temp: (List<VListOfClaim>)criteriaClaimMerchant){
		String champ=temp.getCallReason();
		resultmerch= (String) dao.findWording("CallReasonMerchant", "id.reasonCode",champ,"wording");
		//resultmerch=valMerch.getWording();
	}
	return criteriaClaimMerchant;
}

public List loadPlanning() {	
	
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaPlanning = dao.findThreeResult("EpsPlanning", "startDate", "id.userCode", usercode);
	return criteriaPlanning;
}

public List loadAdmin_msg() {
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaADMN_MSG = dao.findThreeResult("EpsAdministrationMessage", "messageDate", "id.userCode", usercode);
	return criteriaADMN_MSG;
	
}

public List loadMemos() {
	
	DAO dao= new DAO();
	initUserContext();
	usercode=getUserContext().userCode;
	criteriaMEMO = dao.findThreeResult("EpsMemos", "executionDate", "id.userCode", usercode);
	return criteriaMEMO;
}
public String changeUserLocale_en(){
		initUserContext();
		FacesContext context = FacesContext.getCurrentInstance();
		userContext= getUserContext();
		userContext.setUserLocale("en");
		
		return "BackToWelcomePage";
}

public String changeUserLocale_ar(){
	initUserContext();
	FacesContext context = FacesContext.getCurrentInstance();
	userContext= getUserContext();
	userContext.setUserLocale("ar");
		
	return "BackToWelcomePage";
}

public void deroule(){
	//loadHistoryUserOpt();
	loadAdmin_msg();
	
}
public void deroulePlaning(){
	loadPlanning();
}
public void derouleMemo(){
	loadMemos();
}

public void onPageLoad() {
	if (!checkUserAccess(userContext.getUserCode(),this.getClass().getName()))
	{
		FacesContext fctx = FacesContext.getCurrentInstance();
		ExternalContext ectx = fctx.getExternalContext();
		String url = ((HttpServletRequest) ectx.getRequest())
		.getContextPath()
		+ "/pages/common/restrictionAccess.jsf";	
		try {
			ectx.redirect(url);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}else{ // pour permettre au menu de suivre l'utilisateur
		initUserContext();
		userContext.setModifyView("<script language='JavaScript'> var vModif = '"+ enterModif +"'.split('-'); </script>");
	};
	
}

public void selectIdMEMO(ActionEvent evt){
    DAO dao = new DAO();
    EpsMemos camor1 = (EpsMemos) datableMEMO.getRowData();
     
     List paramList;
     EpsMemos camor = new EpsMemos();
     EpsMemos Results;
     camor.setId(camor1.getId());
     		
     memoApasser = (EpsMemos) dao.findByIdObject(EpsMemos.class, camor1.getId());

}


public void selectIdADMN_MSG(ActionEvent evt){
    DAO dao = new DAO();
    EpsAdministrationMessage camor1 = (EpsAdministrationMessage) datableADMN_MSG.getRowData();
     
     List paramList;
     EpsAdministrationMessage camor = new EpsAdministrationMessage();
     EpsAdministrationMessage Results;
     camor.setId(camor1.getId());
     		
     admnApasser = (EpsAdministrationMessage) dao.findByIdObject(EpsAdministrationMessage.class, camor1.getId());

}


public void selectIdPlanning(ActionEvent evt){
    DAO dao = new DAO();
    EpsPlanning camor1 = (EpsPlanning) datablePlanning.getRowData();
     
     List paramList;
     EpsPlanning camor = new EpsPlanning();
     EpsPlanning Results;
     camor.setId(camor1.getId());
     		
     planningApasser = (EpsPlanning) dao.findByIdObject(EpsPlanning.class, camor1.getId());

}


/*public void selectIdHUO(ActionEvent evt){   
    DAO dao = new DAO();
	HistoryUserOperation hUserOpr1 = (HistoryUserOperation) datableHUO
			.getRowData();
	HistoryUserOperationId id = new HistoryUserOperationId();
	HistoryUserOperation hUserOpr = new HistoryUserOperation();
	HistoryUserOperationId Results;
	id.setDateHourOp(hUserOpr1.getId().getDateHourOp());
	id.setTableName(hUserOpr1.getId().getTableName());
	id.setUserCode(hUserOpr1.getId().getUserCode());		
	hUserOpr.setId(id);
	Criteria criteria = HibernateSessionFactory.currentSession()
			.createCriteria(HistoryUserOperation.class);
	criteria.add(Restrictions.eq("id", hUserOpr.getId()));

	historyAPasser = (HistoryUserOperation) criteria.uniqueResult();
                                                                    		
   

}
*/


public List getCriteriaHUO() {
	return criteriaHUO;
}



public void setCriteriaHUO(List criteriaHUO) {
	this.criteriaHUO = criteriaHUO;
}



public List getCriteriaMEMO() {
	return criteriaMEMO;
}



public void setCriteriaMEMO(List criteriaMEMO) {
	this.criteriaMEMO = criteriaMEMO;
}


public  EpsMemos getMemoApasser() {
	return memoApasser;
}


public  void setMemoApasser(EpsMemos memoApasser) {
	WelcomeBB.memoApasser = memoApasser;
}


public List getCriteriaADMN_MSG() {
	return criteriaADMN_MSG;
}


public void setCriteriaADMN_MSG(List criteriaADMN_MSG) {
	this.criteriaADMN_MSG = criteriaADMN_MSG;
}


public HtmlDataTable getDatableADMN_MSG() {
	return datableADMN_MSG;
}


public void setDatableADMN_MSG(HtmlDataTable datableADMN_MSG) {
	this.datableADMN_MSG = datableADMN_MSG;
}


public List getCriteriaPlanning() {
	return criteriaPlanning;
}


public void setCriteriaPlanning(List criteriaPlanning) {
	this.criteriaPlanning = criteriaPlanning;
}


public HtmlDataTable getDatablePlanning() {
	return datablePlanning;
}


public void setDatablePlanning(HtmlDataTable datablePlanning) {
	this.datablePlanning = datablePlanning;
}


public String getUsercode() {
	return usercode;
}


public void setUsercode(String usercode) {
	this.usercode = usercode;
}


public  EpsAdministrationMessage getAdmnApasser() {
	return admnApasser;
}


public  void setAdmnApasser(EpsAdministrationMessage admnApasser) {
	WelcomeBB.admnApasser = admnApasser;
}


public  EpsPlanning getPlanningApasser() {
	return planningApasser;
}


public  void setPlanningApasser(EpsPlanning planningApasser) {
	WelcomeBB.planningApasser = planningApasser;
}


/*public  HistoryUserOperation getHistoryAPasser() {
	return historyAPasser;
}


public  void setHistoryAPasser(HistoryUserOperation historyAPasser) {
	WelcomeBB.historyAPasser = historyAPasser;
}*/


public List getCriteriaCARDFavor() {
	return criteriaCARDFavor;
}


public void setCriteriaCARDFavor(List criteriaCARDFavor) {
	this.criteriaCARDFavor = criteriaCARDFavor;
}


public HtmlDataTable getDatableCARDFavor() {
	return datableCARDFavor;
}


public void setDatableCARDFavor(HtmlDataTable datableCARDFavor) {
	this.datableCARDFavor = datableCARDFavor;
}


/*public  CardFavoris getCardAPasser() {
	return cardAPasser;
}


public  void setCardAPasser(CardFavoris cardAPasser) {
	WelcomeBB.cardAPasser = cardAPasser;
}*/


public List getCriteriaTerminalFavor() {
	return criteriaTerminalFavor;
}


public void setCriteriaTerminalFavor(List criteriaTerminalFavor) {
	this.criteriaTerminalFavor = criteriaTerminalFavor;
}


public HtmlDataTable getDatableTERMFavor() {
	return datableTERMFavor;
}


public void setDatableTERMFavor(HtmlDataTable datableTERMFavor) {
	this.datableTERMFavor = datableTERMFavor;
}


/*public  TerminalFavoris getTermAPasser() {
	return termAPasser;
}


public  void setTermAPasser(TerminalFavoris termAPasser) {
	WelcomeBB.termAPasser = termAPasser;
}*/


public List getCriteriaClaim() {
	return criteriaClaim;
}


public void setCriteriaClaim(List criteriaClaim) {
	this.criteriaClaim = criteriaClaim;
}


public HtmlDataTable getDatableClaim() {
	return datableClaim;
}


public void setDatableClaim(HtmlDataTable datableClaim) {
	this.datableClaim = datableClaim;
}


public  VListOfClaim getClaimAPasser() {
	return claimAPasser;
}


public  void setClaimAPasser(VListOfClaim claimAPasser) {
	WelcomeBB.claimAPasser = claimAPasser;
}


public List getCriteriaClaimMerchant() {
	return criteriaClaimMerchant;
}


public void setCriteriaClaimMerchant(List criteriaClaimMerchant) {
	this.criteriaClaimMerchant = criteriaClaimMerchant;
}


public HtmlDataTable getDatableClaimMerchant() {
	return datableClaimMerchant;
}


public void setDatableClaimMerchant(HtmlDataTable datableClaimMerchant) {
	this.datableClaimMerchant = datableClaimMerchant;
}


/*public  CallReasonCard getVal() {
	return val;
}


public  void setVal(CallReasonCard val) {
	WelcomeBB.val = val;
}*/


public  boolean isPollEnabled() {
	return pollEnabled;
}


public  void setPollEnabled(boolean pollEnabled) {
	WelcomeBB.pollEnabled = pollEnabled;
}


public String getResult() {
	return result;
}


public void setResult(String result) {
	this.result = result;
}


public String getResultmerch() {
	return resultmerch;
}


public void setResultmerch(String resultmerch) {
	this.resultmerch = resultmerch;
}


/*public  CallReasonMerchant getValMerch() {
	return valMerch;
}


public  void setValMerch(CallReasonMerchant valMerch) {
	WelcomeBB.valMerch = valMerch;
}*/


public List getPass() {
	return pass;
}


public void setPass(List pass) {
	this.pass = pass;
}


}

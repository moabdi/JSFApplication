<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/tlds/richfaces.tld" prefix="rich"%>
<%@ include file="/commun/taglibs.jsp"%>
<html>
<head>
<title>Easy Payment System</title>
<h:outputText value="#{userContext.alertMsg}" id="alert" escape="false"
	rendered="true" />
<h:outputText value="#{userContext.modifyView}" id="alertView" escape="false"
	rendered="true" />
<script type="text/javascript" language="JavaScript" src="/MBANK/charte/js/eps2.js" ></script>
<link rel="stylesheet" href="/MBANK/charte/css/eps.css" type="text/css">
<f:loadBundle var="msg" basename="i18n.messages" />
</head>
<body>
<table id="mainTable" class="layout" cellpadding="1" cellspacing="0"
	width="100%">

	<tbody>
		<tr>
			<td valign="top">
			<table cellpadding="0" cellspacing="0" width="100%">
				<tbody>
					<tr class="barreMenu1">
						<td class="lib">
						<td align="left" height="44"><img src="/EPS/images/logo.png"
							width="77" height="45" style="background-color: transparent;"></td>
						<td width="100%" align="left">
						<%@ include  file="barreMenu.jsp"%></td>
						<td>
						<table>
						<tr style="height:50px">
							<td class="libInfoUser"><h:outputText
								value="#{userContext.connexionDate}" /></td>
							<td class="libInfoUser"><h:outputText
								value="#{userContext.connexionTime}" /></td>

							<td class="libInfoUser" width="100 px"><h:outputText
								value="#{userContext.ipAddress}" /></td>
							<td class="libInfoUser" width="100 px"><h:outputText
								value="#{userContext.userCode}" /></td>
								
							<td class="changePassLink" align="left" width="100%" >
								<h:commandLink value="#{msg.Gen_changePass}" action="#{changePassBean.activePanel}" />
								
							</td>
							
							<td class="logout"  >
								<h:commandLink value="#{msg.Gen_Logout}" action="#{userContextManagement.disconnect}" />
								
							</td>
							</tr>
						</table>
					</td></tr></tbody>
		</table></td></tr>
				<tr>
					<td>
						<h:panelGroup rendered="#{changePassBean.showPassPanel}" id="updatePassPanel"  style="background-color:#BAD9EF;">
						<table width="100%" class="tile">
							<tr>
								<td class="lib"><strong> <h:outputLabel
									value="Current Password" for="oldpass" /> </strong></td>
								<td><h:inputSecret id="oldpass" value="#{changePassBean.oldPassword}"></h:inputSecret></td>
								
								<td class="lib" ><strong> <h:outputLabel
									value="New password" for="newpass" /> </strong></td>
								<td><h:inputSecret maxlength="20" id="newpass" value="#{changePassBean.newPassword}">
									<a4j:support limitToList="true" event="onkeyup" actionListener="#{changePassBean.checkpassvalue}" reRender="strengthlbl" ajaxSingle="true"></a4j:support>
									</h:inputSecret>
									<h:graphicImage id="password_help" width="15" value="#{facesContext.externalContext.requestContextPath}/images/aide.gif" >
										<rich:toolTip for="password_help" layout="block" direction="top-right" zorder="1000" value="#{msg.Gen_pass_model}" />
									</h:graphicImage>
									<h:outputText id="strengthlbl" style="#{changePassBean.passStyle}" value="#{changePassBean.passValue}" />
								</td>
							
								<td class="lib" ><strong> <h:outputLabel
									value="Confirm password" for="cpass" /> </strong></td>
								<td><h:inputSecret maxlength="20" id="cpass" value="#{changePassBean.cpassword}"></h:inputSecret></td>
							
								<td align="right"><a4j:commandButton reRender="updatePassPanel" oncomplete="#{changePassBean.showUpassPanel}"  action="#{changePassBean.validateSecondPassword}" value="validate" /></td>
							</tr>
						</table>
						</h:panelGroup>
					</td>
				</tr>
		</tbody></table>
	</body>
						<a4j:region>
    													
    													<a4j:status id="status_back" onstart="Richfaces.showModalPanel('wait')" onstop="Richfaces.hideModalPanel('wait')"/>
    												<rich:modalPanel id="wait" style="background-color: #BAD9EF" autosized="true" width="400" height="120">
    												    <f:facet name="header">
      													      <h:outputText value="#{msg.E_P_S}"/>
      													  </f:facet>
       								<h:form>
         										   <table width="100%" class="tile">
              										  <tbody>
              										  <br>
              										<tr>  <h:outputLabel styleClass="instance" value="#{msg.Message_pending}" /></tr>
              										<br>
                 										   <tr>
                 										   <br><td align="center" width="100%">
        							<h:graphicImage width="40" value="/EPS/images/ajax-loader.gif" /></td>
        							</tr>
        							</tbody>
        						</table>
        						        							</h:form>
        						
    													</rich:modalPanel>
    													</a4j:region>
    													
    													<a4j:region>
    													<rich:modalPanel id="validatePanel" style="background-color: #BAD9EF" autosized="true" width="400" height="120">
       										 <f:facet name="header" >
            										<h:outputText value="#{msg.E_P_S}"
             												   style="padding-right:15px;" />
       										 </f:facet>
       										 <f:facet name="controls">
           										 <h:panelGroup>
               										 <h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png"
                  										  id="hidelink" />
               										 <rich:componentControl for="backPanel" attachTo="hidelink"
                 									   operation="hide" event="onclick" />
          											 </h:panelGroup>
        									</f:facet>
      										 <h:form>
      										 
         										   <table width="100%" class="tile">
              										  <tbody>
              										  
              										  
              										<tr>
              									
              										<td valign="top" class="zoneTravail">
					<rich:messages id="msgPopUp" showDetail="true" showSummary="false" infoClass="infoMessage" errorClass="errorMessage" layout="list"/>
					</td></tr>
              										
              										<br>
              										                </tbody>
              										
                 										   
            </table>
        </h:form>
    </rich:modalPanel>
 	<a4j:status id="status_validate" 
 		onstart="Richfaces.showModalPanel('wait')" 
 		onstop="Richfaces.hideModalPanel('wait');Richfaces.showModalPanel('validatePanel')"
 	/>
 </a4j:region>
 <a4j:region>
								<rich:modalPanel id="upassPanel" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage width="90" value="/images/sucess.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passUpdated}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton action="#{changePassBean.logout}" value="ok" onclick="Richfaces.hideModalPanel('upassPanel')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel5" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel5')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passError}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel5')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel6" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel6')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passWarn}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel6')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel7" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel7')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_oldPassError}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel7')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
		<rich:modalPanel id="exitPanel" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink2" />
					<rich:componentControl for="backPanel" attachTo="hidelink2"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<h:form>
				<table width="100%" class="tile">
					<tbody>

						<tr>
							<td width="20%"><h:graphicImage
								value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif"
								width="32" height="31" /></td>
							<td width="10%"></td>
							<td width="70%"><h:outputLabel styleClass="instance"
								value="#{msg.confirm_exit_whitout_saving}" /></td>

						</tr>
				</table>

				<table width=100% class="tile" align="center">
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton value="#{msg.Gen_yes}" action="#{changePassBean.beforeExit}"		
							oncomplete="vModif='allBean,exit';Richfaces.hideModalPanel('exitPanel');allowRedirect(newForm);" 
							style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton 
							value="#{msg.Gen_no}" style=" width : 67px;" 
							onclick="Richfaces.hideModalPanel('exitPanel');return false;" />
						</td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>
	</a4j:region>
</html>

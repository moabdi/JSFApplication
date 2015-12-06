<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="utf8"%>
<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>
<script type="text/javascript">
var entity= 'StartingPoints';
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	</head>
	<body class="body" background="images/BITS3.jpg">
	<h:form>
		<%@ include file="/commun/header.jsp"%>
	</h:form>
	<h:form>

		<table id="mainTable" class="layout" cellpadding="1" cellspacing="0"
			width="100%">
			<tr>
				<td class="instance_lang" >
					<rich:spacer width="10px" />
					<h:commandLink style="text-decoration:underline;" id="en" action="#{welcomeBB.changeUserLocale_en}" value="Anglais" />
					<rich:spacer width="10px" />
					<h:commandLink style="text-decoration:underline;" id="ar" action="#{welcomeBB.changeUserLocale_ar}" value="عربي" />
					<rich:spacer width="18px" />
					<a4j:commandButton onclick="Richfaces.showModalPanel('refreshPanel')" oncomplete="Richfaces.hideModalPanel('refreshPanel')" status="status_load" style="width:15px" action="#{applicationLists.LoadStaticLists}"  image="/images/refresh.png" >
						<rich:toolTip value="Reload EPS environment"  ></rich:toolTip>
					</a4j:commandButton>
				</td>
			</tr>
			<tr>
			<td>
			<table class="titrePage" width="100%">
				<tr>
					<h:panelGrid columns="2" width="100%" >
						<rich:panel header="Favor Cards" style="overflow-x: auto; height:150px;background-color: #DFE6EC;" headerClass="tile" >
						<f:facet name="header">
						<h:graphicImage id="favorcard_msg_tooltip" value="#{facesContext.externalContext.requestContextPath}/images/Favorites2.png" width="25" height="25" >  
						<rich:toolTip value="#{msg.Gen_message_cardfavorite}"  ></rich:toolTip>
						</h:graphicImage>
						</f:facet>
							<rich:dataTable id="sampleDataCard"
							value="#{welcomeBB.criteriaCARDFavor}" var="event"
								binding="#{welcomeBB.datableCARDFavor}"
							sortMode="single" frame="above"
							 styleClass="tiletable" captionStyle="tiletable"
								columnClasses="tiletable" rowClasses="tiletable"
								headerClass="tiletable" rows="3" width="100%"  >
								
								<rich:column  id="Card_Number" width="30%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_CardNbr}"></h:outputText>
									</f:facet>
										<h:outputText value="#{event.id.cardNumber}" />
								</rich:column>
								<rich:column  id="EmbossName" width="30%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_embossName}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.embossedName}" />
								</rich:column>
								<rich:column  id="CardHolder">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_Card_Sequence}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.cardSequence}" />
								</rich:column>
								<rich:column  id="Expiry">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_expireDate}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.libelleDate}" />
								</rich:column>

							</rich:dataTable>

						</rich:panel>
						<rich:panel header="Claim Card" style="overflow-x: auto; height:150px;background-color: #DFE6EC;" headerClass="tile" > 
						<f:facet name="header">
								<h:graphicImage id="history_msg_tooltip" value="#{facesContext.externalContext.requestContextPath}/images/Telephone.gif" width="25" height="25" >
							<rich:toolTip value="#{msg.Gen_msgClaimcard}" ></rich:toolTip>
							</h:graphicImage>
							</f:facet>
							
							<rich:dataTable id="sampleDataClaim"
							value="#{welcomeBB.criteriaClaim}" var="event"
								binding="#{welcomeBB.datableClaim}"
							sortMode="single" frame="above"
							 styleClass="tiletable" captionStyle="tiletable"
								columnClasses="tiletable" rowClasses="tiletable"
								headerClass="tiletable" rows="3" width="100%" >
							
								<rich:column  width="10%"
									headerClass="dataTableHeader" styleClass="tile">
									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_callId}" />
									</f:facet>
								
									<h:outputText value="#{event.id.callId}" />
									
								</rich:column>
								
								<rich:column width="30%"
									headerClass="dataTableHeade" styleClass="tile">
									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_callReason}" />
									</f:facet>
									<h:outputText value="#{event.wording}" />
								</rich:column>

								<rich:column width="30%"
									headerClass="dataTableHeade" styleClass="tile">
									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_CardNbr}" />
									</f:facet>
									<h:outputText value="#{event.cardNumber}" />
								</rich:column>


								<rich:column   styleClass="tile"
									headerClass="dataTableHeader">

									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_DateTimeCall}" />
									</f:facet>
									<h:outputText value="#{event.libelleDate}"  />
								</rich:column>
							
							</rich:dataTable>
							</rich:panel>
						
						<rich:panel header="Favor Terminal" style="overflow-x: auto; height:150px;background-color: #DFE6EC;" headerClass="tile" >
						<f:facet name="header">
						<h:graphicImage id="favorClient_msg_tooltip" value="#{facesContext.externalContext.requestContextPath}/images/DossierFavorisSZ.png" width="25" height="25" > 
						<rich:toolTip value="#{msg.Gen_message_favoriteClient}" ></rich:toolTip>
						</h:graphicImage>
						 </f:facet>
							<rich:dataTable id="sampleDataTerminal"
							value="#{welcomeBB.criteriaTerminalFavor}" var="event"
								binding="#{welcomeBB.datableTERMFavor}"
							sortMode="single" frame="above"
							 styleClass="tiletable" captionStyle="tiletable"
								columnClasses="tiletable" rowClasses="tiletable"
								headerClass="tiletable" rows="3" width="100%">
								<rich:column  id="atm_Number" width="25%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_Terminal_Nbr}"></h:outputText>
									</f:facet>									
									<h:outputText value="#{event.id.atmTerminalNumber}" />								
								</rich:column>
								
								<rich:column  id="atmName" width="25%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_Name}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.atmName}" />
								</rich:column>
									<rich:column  id="atmGroupe" width="25%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_Group}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.atmGroupeName}" />
								</rich:column>
								
									<rich:column  id="atmIpAdresse" width="25%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_IpAdresse}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.terminalIpAddress}" />
								</rich:column>
							</rich:dataTable>
						</rich:panel>
						
						<rich:panel   header="Claim Merchant" style="overflow-x: auto; height:150px;background-color: #DFE6EC;" headerClass="tile" >
						<f:facet name="header">
								<h:graphicImage id="claim_msg" value="#{facesContext.externalContext.requestContextPath}/images/pos.gif" width="25" height="25" >
							<rich:toolTip value="#{msg.Gen_msgCallMercg}" ></rich:toolTip>
							</h:graphicImage>
							</f:facet>
							<rich:dataTable id="sampleDataClaimMerchant"
							value="#{welcomeBB.criteriaClaimMerchant}" var="event"
								binding="#{welcomeBB.datableClaimMerchant}"
							sortMode="single" frame="above"
							 styleClass="tiletable" captionStyle="tiletable"
								columnClasses="tiletable" rowClasses="tiletable"
								headerClass="tiletable" rows="3" width="100%" >
							
								<rich:column  width="10%"
									headerClass="dataTableHeader" styleClass="tile">
									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_callId}" />
									</f:facet>
								
									<h:outputText value="#{event.id.callId}" />
							
								</rich:column>
								
								<rich:column width="30%"
									headerClass="dataTableHeade" styleClass="tile">
									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_callReason}" />
									</f:facet>
									<h:outputText value="#{event.wordingmerchant}" />
								</rich:column>

								<rich:column width="30%"
									headerClass="dataTableHeade" styleClass="tile">
									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_MerchantNumber}" />
									</f:facet>
									<h:outputText value="#{event.merchantNumber}" />
								</rich:column>

								<rich:column   styleClass="tile"
									headerClass="dataTableHeader">

									<f:facet name="header">
										<h:outputLabel value="#{msg.Gen_DateTimeCall}" />
									</f:facet>
									<h:outputText value="#{event.libelleDate}" />
								</rich:column>
								
							</rich:dataTable>
						</rich:panel>
					
						<rich:panel header="Mnemos" style="overflow-x: auto; height:150px;background-color: #DFE6EC;" headerClass="tile" >
							<f:facet name="header">
							<h:graphicImage id="memo_msg_tooltip" value="#{facesContext.externalContext.requestContextPath}/images/kwrite.png" width="25" height="25" > 
							<rich:toolTip value="#{msg.Gen_message_memo}"  ></rich:toolTip>
							</h:graphicImage>
							</f:facet>
							<rich:dataTable id="sampleDataMEMO"
							value="#{welcomeBB.criteriaMEMO}" var="event"
								binding="#{welcomeBB.datableMEMO}"
							sortMode="single" frame="above"
							 styleClass="tiletable" captionStyle="tiletable"
								columnClasses="tiletable" rowClasses="tiletable"
								headerClass="tiletable" rows="3" width="100%"  >
								
								<rich:column width="50%" >
									<f:facet name="header">
										<h:outputText value="#{msg.GEN_SUBJECT}"></h:outputText>
									</f:facet>
									
										<h:outputText value="#{event.id.subject}" />
									
								</rich:column>
								
								<rich:column   >
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_Execution_Date}"></h:outputText>
									</f:facet>
										<h:outputText value="#{event.libelleDate}" />
								</rich:column>
								
							</rich:dataTable>
							
						</rich:panel>
						
						
						<rich:panel header="Plannigs" style="overflow-x: auto; height:150px;background-color: #DFE6EC;" headerClass="tile" >
							<f:facet name="header">
							<h:graphicImage id="planning_msg_tooltip" value="#{facesContext.externalContext.requestContextPath}/images/kspread.png" width="25" height="25" > 
							<rich:toolTip value="#{msg.Gen_message_planning}"  ></rich:toolTip>
							</h:graphicImage>
							</f:facet>
							<rich:dataTable id="sampleDataPlanning"
							value="#{welcomeBB.criteriaPlanning}" var="event"
								binding="#{welcomeBB.datablePlanning}"
							sortMode="single" frame="above"
							 styleClass="tiletable" captionStyle="tiletable"
								columnClasses="tiletable" rowClasses="tiletable"
								headerClass="tiletable" rows="3" width="100%"  >
								
								<rich:column id="SUBJECT" width="30%">
									<f:facet name="header">
										<h:outputText value="#{msg.GEN_SUBJECT}"></h:outputText>
									</f:facet>
									
									<h:outputText  value="#{event.id.subject}" />
									
								</rich:column>
								
								<rich:column id="startDate" width="30%">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_startDate}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.libelleDate}" />
								</rich:column>
								
								<rich:column id="endDate">
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_endDate}"></h:outputText>
									</f:facet>
									<h:outputText value="#{event.libelleDate2}" />
								</rich:column>
								
							</rich:dataTable>
						</rich:panel>
					
					</h:panelGrid>

					<rich:simpleTogglePanel switchType="client" opened="false"   bodyClass="tileWelcome"  >
					<f:facet name="header">
								<h:graphicImage id="Admin_msg_tooltips"
									value="#{facesContext.externalContext.requestContextPath}/images/folder_inbox.png"
									width="25" height="25" >
									<rich:toolTip value="#{msg.Gen_message_admin_message}"  ></rich:toolTip>
									</h:graphicImage>
							</f:facet>
				
							<rich:dataTable id="sampleDataADMNMSG"
								value="#{welcomeBB.criteriaADMN_MSG}" var="event"
									binding="#{welcomeBB.datableADMN_MSG}"
								sortMode="single" frame="above"
								 styleClass="tiletable" captionStyle="tiletable"
									columnClasses="tiletable" rowClasses="tiletable"
									headerClass="tiletable" rows="3" width="100%"  >
								
									
								<rich:column  id="Mnemo_ID" width="30%"  >
									<f:facet name="header">
										<h:outputText value="#{msg.GEN_SUBJECT}"></h:outputText>
									</f:facet>
									
									<h:outputText value="#{event.id.subject}" />
									
								</rich:column>

								<rich:column  id="messageDate" width="30%">
									<f:facet name="header">
										<h:outputText value="#{msg.GEN_MESSAGE_DATE}"></h:outputText>
									</f:facet>
									<h:outputText  value="#{event.libelleDate}" />
								</rich:column>

								<rich:column  id="priority" >
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_priority}"></h:outputText>
									</f:facet>
									<h:outputText  value="#{event.libelle}" />
								</rich:column>
								
								<rich:column  id="details" >
									<f:facet name="header">
										<h:outputText value="#{msg.Gen_Details}"></h:outputText>
									</f:facet>
									<h:outputText  value="#{event.details}" />
								</rich:column>
								
							</rich:dataTable>
						
					</rich:simpleTogglePanel>
							
					
				</tr>
		</table>
<a4j:status onstart="#{rich:component('wait')}.show()" onstop="#{rich:component('wait')}.hide()"/>
    						<rich:modalPanel moveable="false" id="wait" style="background-color: #BAD9EF"
							autosized="true" width="400" height="120">
							<f:facet name="header">
								<h:outputText value="#{msg.E_P_S}" />
							</f:facet>
							<h:form>
								<table width="100%" class="tile">
									<tbody>
										<br>
										<tr>
											<h:outputLabel styleClass="instance"
												value="Chargement de vos parametres..." />
										</tr>
										<br>
										<tr>
											<br>
											<td align="center" width="100%"><h:graphicImage
												width="40" value="/images/ajax-loader.gif" /></td>
										</tr>
									</tbody></table></h:form>
						</rich:modalPanel>
<a4j:region>

<a4j:poll id="poll" ajaxSingle="true"
	
	oncomplete="Richfaces.hideModalPanel('wait')"
	interval="2000" enabled="#{welcomeBB.pollEnabled}"
	reRender="wait" limitToList="true" />
</a4j:region>



		<rich:modalPanel id="sessionExpiredPanel">
			<f:facet name="header">Session expired</f:facet>

			
			<h:outputText value="Votre session a expiré!" />

		</rich:modalPanel>

		<a4j:region>
			<a4j:form>
				<a4j:poll id="sessioncheck" interval="1250000"
					reRender="sessioncheck" />
			</a4j:form>
			<script type="text/javascript">
        A4J.AJAX.onExpired = function(loc,expiredMsg){
        Richfaces.showModalPanel('sessionExpiredPanel',{left:'auto',top:'auto'});} 
       </script>
		</a4j:region>
		<a4j:region>
			<rich:modalPanel id="refreshPanel" resizeable="false" style="background-color:#BAD9EF;" width="220" height="60" >
                <f:facet name="header">
                	<h:outputLabel value="Reloading..." />
                </f:facet>
				<a4j:status id="status_load" layout="block">
				<f:facet name="start">
                	<h:graphicImage width="200"  value="#{facesContext.externalContext.requestContextPath}/images/progress.gif"/>
                </f:facet>
			</a4j:status>
			</rich:modalPanel>
		</a4j:region>
	</td></tr></table></h:form></body>
</f:view>
</html>


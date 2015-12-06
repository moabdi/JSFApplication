<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	</head>
	<body class="body">
	<h:form>
	<%@ include file="/commun/header.jsp"%>
	</h:form>
	<a4j:form id="myForm">
		
		<table id="mainTable" class="layout" cellpadding="1" cellspacing="0"
			width="100%">
			<tr>
				<td>
				<table class="titrePage" width="50%">
					<tr>
						<td valign="top" class="zoneIdent">
						<table width="100%">

							<tr>
								<td>
								<table width="100%" class="ident">
									<tr>
										<td width="54%" align="left"><h:outputLabel
											value="#{msg.Gen_Daily_Rate}" /></td>
										<td width="40%" align="right"><h:outputText
											value="#{msg.Gen_Add}"
											rendered="#{DailyRateBB.addStatus}" /> <h:outputText
											value="#{msg.Gen_Modify}"
											rendered="#{DailyRateBB.modifyStatus}" /></td>
										<td width="1%">&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</td>

					</tr>
					<tr>
						<td valign="top" class="zoneTravail"><a4j:region>
							<rich:messages id="msg" showDetail="true" showSummary="false"  infoClass="infoMessage"
								errorClass="errorMessage" layout="list">
							</rich:messages>
						</a4j:region></td>
					</tr>
					<tr>
						<td>
						<table width="100%">
							<tr>
								<td>
								<table class="tile">
									<thead>
										<tr>
											<td class="title"><h:outputLabel
												value="#{msg.Gen_Identification}" /></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
											<table width="100%">
												<tr><td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_bank}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:selectOneMenu id="bank_code" required="true" requiredMessage="#{msg.Gen_bank} #{msg.Gen_required}"
														disabled="#{DailyRateBB.modifyStatus}"
														 value="#{DailyRateBB.bankCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.bankListSI}" />
														<a4j:support event="onchange" ajaxSingle="true"
															reRender="lbl_bankCode">
														</a4j:support>

														<rich:ajaxValidator event="onblur" />
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_bankCode" value="#{DailyRateBB.bankCode}"/>
														<rich:message for="bank_code" styleClass="warnningMessage" />
													</td>
														
														
														<td class="instance" width="20%"><h:outputLabel value="#{msg.networcode}"  /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
														<td width="30%"><h:selectOneMenu id="network" required="true" requiredMessage="#{msg.networcode} #{msg.Gen_required}"
														disabled="#{DailyRateBB.modifyStatus}"
														 value="#{DailyRateBB.networkCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.networkListSI}" />
														<rich:ajaxValidator event="onblur" />
														<a4j:support event="onchange" ajaxSingle="true"reRender="lbl_network"/>
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_network" value="#{DailyRateBB.networkCode}"/>
														<rich:message for="network" styleClass="warnningMessage" />
														</td>
														</tr>
														<tr>
														
														<td class="instance" width="20%"><h:outputLabel value="#{msg.RtDate}"  /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
														<td width="30%">
														<rich:calendar id="date" disabled="#{DailyRateBB.modifyStatus}" datePattern="dd/MM/yyyy"  zindex="1000" value="#{DailyRateBB.rateDate}"
														required="true" requiredMessage="#{msg.RtDate} #{msg.Gen_required}">
														<rich:ajaxValidator event="onchanged"></rich:ajaxValidator>
														</rich:calendar>
														 <rich:message styleClass="warnningMessage" for="date"/>
														</td>
														
														
														
														<td class="instance" width="20%"><h:outputLabel value="#{msg.transactParam_transactType}"  /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
														<td width="30%"><h:selectOneMenu id="transactTy" required="true" requiredMessage="#{msg.transactParam_transactType} #{msg.Gen_required}"
														disabled="#{DailyRateBB.modifyStatus}"
														 value="#{DailyRateBB.transactionType}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.transactTypeListSI}" />
														<rich:ajaxValidator event="onblur" />
														<a4j:support event="onchange" ajaxSingle="true"  reRender="lbl_transact"/> 
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_transact" value="#{DailyRateBB.transactionType}" />
														<rich:message for="transactTy" styleClass="warnningMessage" />
														</td>
														</tr>
														<tr>
														
													<td class="instance" width="20%"><h:outputLabel value="#{msg.currencyC}"  /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
														<td width="30%"><h:selectOneMenu id="currency" required="true" requiredMessage="#{msg.currencyC} #{msg.Gen_required}"
														disabled="#{DailyRateBB.modifyStatus}"
														value="#{DailyRateBB.currencyCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
														<rich:ajaxValidator event="onblur" />
															<a4j:support event="onchange" ajaxSingle="true" action="#{DailyRateBB.saveCurrency}" reRender="lbl_Currency"> 
															</a4j:support>
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_Currency" value="#{DailyRateBB.currencyCode}" />
														<rich:message for="currency" styleClass="warnningMessage" />
											</td>
														
														
														<td class="instance" width="20%"><h:outputLabel value="#{msg.flowcnv}"  /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
														<td width="30%"><h:selectOneRadio id="flow"  styleClass="panelRadio"
														required="true" requiredMessage="#{msg.flowcnv} #{msg.Gen_required}"
														disabled="#{DailyRateBB.modifyStatus}" value="#{DailyRateBB.flowConversion}">
														
														<f:selectItem itemLabel="#{msg.CL}" itemValue="CL" />
														<f:selectItem itemLabel="#{msg.LC}" itemValue="LC" />
														<rich:ajaxValidator event="onblur"></rich:ajaxValidator>
														</h:selectOneRadio>
														<rich:message for="flow" styleClass="warnningMessage" />
														</td>
														</tr>
														<tr>
														<td class="instance" width="20%"><h:outputText value="#{msg.Byrt}" /></td>
														<td width="30%"><h:inputText id="bayrate" styleClass="AlignRight" value="#{DailyRateBB.bayingRate}" size="9" maxlength="9" >
														<f:validator  validatorId="mustBePourcent"  />
														<rich:ajaxValidator event="onblur"/>
															</h:inputText>
															<rich:message for="bayrate"  styleClass="warnningMessage"  />
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.cellrt}" /></td>
														<td width="30%"><h:inputText id="cellrate" styleClass="AlignRight" value="#{DailyRateBB.cellingRate}" size="9" maxlength="9" >
														<f:validator  validatorId="mustBePourcent"  />
														<rich:ajaxValidator event="onblur"/>
															</h:inputText>
															<rich:message for="cellrate"  styleClass="warnningMessage"  />
														</td>
														</tr>
											</table>
											</td>
										</tr>

									</tbody>
								</table>
								</td>
							</tr>
						</table>
						</td>

					</tr>

					
										
				

					<tr>
						<td>
						<table width="100%" class="buttonPanel">
							<tr>
								<td width="35%">&nbsp;</td>
								<td><a4j:commandButton value="Back"
									actionListener="#{DailyRateBB.checkChanges}"
									action="#{DailyRateBB.back}"
									oncomplete="#{DailyRateBB.backPanel}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
									immediate="#{DailyRateBB.immediate}"></a4j:commandButton></td>

								<td><h:commandButton value="Add"
									action="#{DailyRateBB.ToAddRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
									rendered="#{DailyRateBB.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Duplicate"
									action="#{DailyRateBB.ToDuplicateRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
									rendered="#{DailyRateBB.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Refresh"
									action="#{DailyRateBB.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{DailyRateBB.addStatus}">
								</h:commandButton> <a4j:commandButton value="Delete"
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{DailyRateBB.modifyStatus}">
								</a4j:commandButton></td>
								<td><a4j:commandButton value="Validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{DailyRateBB.addStatus}"
									action="#{DailyRateBB.valider}"
									reRender="poll2,validatePanel,msg" limitToList="true"
									status="status_validate">

								</a4j:commandButton> <a4j:commandButton value="Modify"
									action="#{DailyRateBB.modify}"
									reRender="poll2,validatePanel,msg" limitToList="true"
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{DailyRateBB.modifyStatus}">
								</a4j:commandButton> <a4j:region>

									<a4j:poll id="poll" ajaxSingle="true"
										action="#{DailyRateSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="#{DailyRateBB.pollEnabled}"
										reRender="validatePanel" limitToList="true" />

									<a4j:poll id="poll2" ajaxSingle="true"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true" reRender="validatePanel"
										limitToList="true" />

								</a4j:region></td>
							</tr>

							<h:outputText value="" escape="false" rendered="false" />
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>

	</a4j:form>
	</body>
	<a4j:region>
		<rich:modalPanel id="backPanel" style="background-color: #BAD9EF"
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
								value="#{msg.confirm_back_to_search}" /></td>

						</tr>
				</table>

				<table width="100%" class="tile" align="center">
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}" action="#{DailyRateSearchBB.back}"
							onclick="Richfaces.hideModalPanel('backPanel')"
							style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}" style=" width : 67px;"
							onclick="Richfaces.hideModalPanel('backPanel');return false;" />
						</td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>
	</a4j:region>

	<a4j:region>

		<rich:modalPanel id="deletePanel" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink3" />
					<rich:componentControl for="backPanel" attachTo="hidelink3"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<h:form>
				<table width="100%" class="tile">

					<tr>
						<td width="20%"><h:graphicImage
							value="#{facesContext.externalContext.requestContextPath}/images/errorIco.ICO"
							width="32" height="31" /></td>
						<td width="10%"></td>
						<td width="70%"><h:outputLabel styleClass="instance"
							value="#{msg.confirm_delete}" /></td>
					</tr>
				</table>
				<table class="tile" width="100%">
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{DailyRateBB.delete}"
							reRender="poll,poll2,validatePanel,msg" limitToList="true"
							oncomplete="Richfaces.hideModalPanel('deletePanel');"
							status="status_delete" style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}"
							onclick="Richfaces.hideModalPanel('deletePanel');return false;"
							style=" width : 67px;" /></td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>

		<a4j:status id="status_delete"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('validatePanel');" />
	</a4j:region>
</f:view>
														
												
												
												
												

</html>
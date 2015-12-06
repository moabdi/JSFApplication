<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<f:loadBundle var="msg" basename="i18n.messages" />
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
											value="#{msg.Fraud_Alertes}" /></td>
										<td width="40%" align="right"><h:outputText
											value="#{msg.Gen_Add}"
											rendered="#{FraudAlertesBBean.addStatus}" /> <h:outputText
											value="#{msg.Gen_Modify}"
											rendered="#{FraudAlertesBBean.modifyStatus}" /></td>
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
						<table width="100%" >
							<tr>
								<td>
								<table class="tile" width="100%" >
									<thead>
										<tr>
											<td class="title"><h:outputLabel
												value="#{msg.Gen_Identification}" /></td>
										</tr>
									</thead>
								</table>
								<table width="100%" class="tile" >
									<tbody>
										<tr>
											<td>
											<table width="100%">
												
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_alerCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>

													<td width="30%">
													<h:inputText id="altertCode" required="true" requiredMessage="#{msg.Gen_alerCode} #{msg.Gen_required}"
														value="#{FraudAlertesBBean.altertCode}" disabled="#{FraudAlertesBBean.modifyStatus}" size="3" maxlength="3">
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="altertCode" styleClass="warnningMessage"/>
													</td>																			
												
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_Entity}" /><h:outputLabel style="color:red"
														value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:selectOneRadio disabled="#{FraudAlertesBBean.modifyStatus}" id="entiti"
														styleClass="panelRadio" required="true" requiredMessage="#{msg.Gen_Entity} #{msg.Gen_required}"
														value="#{FraudAlertesBBean.entity}">
														<f:selectItem itemValue="MER" itemLabel="Merchant" />
														<f:selectItem itemValue="CAR" itemLabel="Card" />
														<rich:ajaxValidator event="onblur" />
													</h:selectOneRadio>
													<rich:message for="entiti" styleClass="warnningMessage"/>
													</td>
												</tr>

												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_bankCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:selectOneMenu disabled="#{FraudAlertesBBean.modifyStatus}" id="bank_code"
														value="#{FraudAlertesBBean.bankCode}" required="true" requiredMessage="#{msg.Gen_bankCode} #{msg.Gen_required}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.bankListSI}" />
														<a4j:support event="onchange" ajaxSingle="true"  reRender="lbl_bankCode">
														</a4j:support>
															<rich:ajaxValidator event="onblur" />
													</h:selectOneMenu>
													<h:outputLabel styleClass="codelbl" id="lbl_bankCode" value="#{FraudAlertesBBean.bankCode}"></h:outputLabel>
													<rich:message for="bank_code" styleClass="warnningMessage"/>
													</td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_wording}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:inputText id="wordin" value="#{FraudAlertesBBean.wording}" autocomplete="off"
														required="true" requiredMessage="#{msg.Gen_wording} #{msg.Gen_required}">
															<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="wordin" styleClass="warnningMessage"/>
													</td>
												</tr>

												<tr>
													<td>&nbsp;</td>
												</tr>
											</table>
											<table class="tile">
												<thead>
													<tr style="height: 13px;">
														<td class="title" width="173"><h:outputLabel
															value="#{msg.Gen_Details}" /></td>
													</tr>
												</thead>
											</table>

											<table class="tile">
											
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_Currency}" /></td>
													<td width="30%"><h:selectOneMenu disabled="false"
														value="#{FraudAlertesBBean.currencyCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
														
														<a4j:support event="onchange" reRender="lbl_currencyCode" 
													action="#{FraudAlertesBBean.saveCurrency}" ajaxSingle="true"/>
													
													</h:selectOneMenu><h:outputLabel styleClass="codelbl" id="lbl_currencyCode"
														value="#{FraudAlertesBBean.currencyCode}"></h:outputLabel></td>
														
														
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Card_Limit_amount}" /></td>
													<td width="30%"><h:inputText id="limit_amount"
														value="#{FraudAlertesBBean.limitAmount}" styleClass="AlignRight" autocomplete="off">
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="limit_amount" />
														
													</h:inputText>
													</td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Card_Limit_number}" /></td>
													<td width="30%"><h:inputText
														value="#{FraudAlertesBBean.limitNumber}" autocomplete="off" size="8" maxlength="8">
													</h:inputText></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_Average}" /></td>
													<td width="30%"><h:inputText id="averageAmount" value="#{FraudAlertesBBean.average}" styleClass="AlignRight" autocomplete="off">
													<f:validator  validatorId="mustBePourcent"  />
													<rich:ajaxValidator event="onblur"/>
													</h:inputText>
													<rich:message for="averageAmount"  styleClass="warnningMessage" />
													</td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_usage_flag}" /></td>
													<td width="30%"><h:selectOneRadio styleClass="panelRadio"
														value="#{FraudAlertesBBean.usageFlag}">
														<f:selectItem itemValue="A" itemLabel="Active" />
														<f:selectItem itemValue="N" itemLabel="No Active" />
													</h:selectOneRadio></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Merchant_Number}" /></td>
													<td width="30%"><h:inputText value="#{FraudAlertesBBean.merchantNumber}" autocomplete="off"
														size="15" maxlength="15">
													</h:inputText></td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Period_calculation_average}" /></td>
													<td width="30%"><h:inputText
														value="#{FraudAlertesBBean.periodCalculationAverage}" autocomplete="off"
														size="3" maxlength="3">
													</h:inputText></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Period_work}" /></td>
													<td width="30%"><h:inputText value="#{FraudAlertesBBean.periodWork}" autocomplete="off"
														size="3" maxlength="3">
													</h:inputText></td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Number_retrieval_request}" /></td>
													<td width="30%"><h:inputText autocomplete="off"
														value="#{FraudAlertesBBean.numberRetrievalRequest}"
														size="6" maxlength="6">
													</h:inputText></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Amount_retrieval_request}" /></td>
													<td width="30%"><h:inputText id="amount_retrieve" value="#{FraudAlertesBBean.amountRetrievalRequest}" 
													styleClass="AlignRight" autocomplete="off">
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true" reRender="amount_retrieve" />
														
													</h:inputText>
													</td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_mcc}" /></td>
													<td width="30%"><h:selectOneMenu disabled="false"
														value="#{FraudAlertesBBean.mccCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.mccListSI}" />
														<a4j:support event="onchange" ajaxSingle="true" limitToList="true" reRender="lbl_mccCode">
														</a4j:support>
													</h:selectOneMenu>
													<h:outputLabel styleClass="codelbl" id="lbl_mccCode" value="#{FraudAlertesBBean.mccCode}"></h:outputLabel></td>
													<td>
												</tr>
												<tr style="height: 36px;">
												</tr>

											</table>

											<table width="100%" class="tile">
												<tr>
													<td>
													<table width="100%" class="buttonPanel">

														<tr>
															<td>
															<table width="100%" class="buttonPanel">
																<tr>
																	<td width="35%">&nbsp;</td>
																	<td><a4j:commandButton value="Back"
																		actionListener="#{FraudAlertesBBean.checkChanges}"
																		action="#{FraudAlertesBBean.back}"
																		oncomplete="#{FraudAlertesBBean.backPanel}"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
																		></a4j:commandButton></td>

																	<td><h:commandButton value="Add"
																		action="#{FraudAlertesBBean.ToAddRecord}"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
																		rendered="#{FraudAlertesBBean.modifyStatus}">
																	</h:commandButton></td>
																	<td><h:commandButton value="Duplicate"
																		action="#{FraudAlertesBBean.ToDuplicateRecord}"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
																		rendered="#{FraudAlertesBBean.modifyStatus}">
																	</h:commandButton></td>
																	<td><h:commandButton value="Refresh" immediate="true"
																		action="#{FraudAlertesBBean.refresh}"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
																		rendered="#{FraudAlertesBBean.addStatus}">
																	</h:commandButton> <a4j:commandButton value="Delete"
																		oncomplete="Richfaces.showModalPanel('deletePanel')"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
																		rendered="#{FraudAlertesBBean.modifyStatus}">
																	</a4j:commandButton></td>
																	<td><a4j:commandButton value="Validate"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
																		rendered="#{FraudAlertesBBean.addStatus}"
																		action="#{FraudAlertesBBean.valider}"
																		reRender="poll2,validatePanel,msg" 
																		status="status_validate">

																	</a4j:commandButton> <a4j:commandButton value="Modify"
																		action="#{FraudAlertesBBean.modify}"
																		reRender="poll2,validatePanel,msg" 
																		status="status_validate"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
																		rendered="#{FraudAlertesBBean.modifyStatus}">
																	</a4j:commandButton> <a4j:region>

																		<a4j:poll id="poll" ajaxSingle="true"
																			action="#{FraudAlertesSearchBBean.back}"
																			oncomplete="Richfaces.hideModalPanel('validatePanel')"
																			interval="2000"
																			enabled="#{FraudAlertesBBean.pollEnabled}"
																			reRender="validatePanel" limitToList="true" />

																		<a4j:poll id="poll2" ajaxSingle="true"
																			oncomplete="Richfaces.hideModalPanel('validatePanel')"
																			interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true"
																			reRender="validatePanel" limitToList="true" />

																	</a4j:region></td>
																</tr>
																<h:outputText value="" escape="false" rendered="false" />
															</table>
															</td>
														</tr>
													</table>
											</td></tr></table></td></tr></tbody></table></td></tr></table></td></tr></table></td></tr></table></a4j:form></body>

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
					<tr style="height: 30px;"></tr>
					<tr>
				
						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}" 
							action="#{FraudAlertesSearchBBean.back}"
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
					<tr style="height: 30px;"></tr>
					<tr>
					
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{FraudAlertesBBean.delete}"
							reRender="poll,validatePanel,msg" 
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
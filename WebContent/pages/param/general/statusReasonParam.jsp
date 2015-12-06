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

	<h:form>
		<table id="mainTable" class="layout" cellpadding="1" cellspacing="0"
			width="100%">
			<table class="titrePage" width="50%">
				<tr>
					<td valign="top" class="zoneIdent">
					<table width="100%">

						<tr>
							<td>
							<table width="100%" class="ident">
								<tr>
									<td width="54%" align="left"><h:outputText
										value="#{msg.statusReasonParam_StatusReasonParam}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.statusReasonParam_addStatusReason}"
										rendered="#{statusReasonBackingBean.addStatus}" /> <h:outputText
										value="#{msg.statusReasonParam_modifyStatusReason}"
										rendered="#{statusReasonBackingBean.modifyStatus}" /></td>
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
										<td class="title"><h:outputText
											value="#{msg.Gen_Identification}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%">
											<tr>
											<td class="instance" width="20%"><h:outputText
													value="#{msg.statusReasonParam_StatusReasonCode}" /> <h:outputLabel
													style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="statusReason_code"
													value="#{statusReasonBackingBean.reasonCode}"
													required="true"
													requiredMessage="#{msg.statusReasonParam_StatusReasonCode} #{msg.Gen_required}"
													disabled="#{statusReasonBackingBean.modifyStatus}" size="2"
													maxlength="2">
													<f:validator validatorId="mustBeNumber" />
													<rich:ajaxValidator event="onblur" />
												</h:inputText> 
												<rich:message for="statusReason_code" styleClass="warnningMessage" />
													</td>
											<td class="instance" width="20%"><h:outputText
												value="#{msg.BankCode}" /><h:outputLabel style="color:red"
												value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu id="bank_code" required="true"
												value="#{statusReasonBackingBean.bankCode}"
												disabled="#{statusReasonBackingBean.modifyStatus}"
												requiredMessage="#{msg.BankCode} #{msg.Gen_required}">
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
												<f:selectItems value="#{applicationLists.bankListSI}" />
												<a4j:support ajaxSingle="true"  event="onchange" reRender="lbl_bank"></a4j:support>
											<rich:ajaxValidator event="onblur" />
											</h:selectOneMenu>
											<h:outputLabel styleClass="codelbl" id="lbl_bank" value="#{statusReasonBackingBean.bankCode}"/>
											<rich:message for="bank_code"	styleClass="warnningMessage" />
											</td>
											</tr>
											<tr>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_Wording}" /><h:outputLabel
													style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="wordin" required="true"
													requiredMessage="#{msg.Gen_wording} #{msg.Gen_required}"
													value="#{statusReasonBackingBean.wording}" size="30"
													maxlength="30">
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
														<rich:message for="wordin"	styleClass="warnningMessage" />
													</td>
											<tr>
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
				<table width="100%">
					<tr>
						<td>
						<table class="tile">
							<thead>
								<tr>
									<td class="title"><h:outputText value="#{msg.Gen_Details}" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<table width="100%">
										<tr>
											<td class="instance" width="20%"><h:outputText
												value="#{msg.Gen_StatusReasonType}" /><h:outputLabel
												style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu required="true"
												requiredMessage="#{msg.Gen_StatusReasonType} #{msg.Gen_required}"
												value="#{statusReasonBackingBean.status}"
												id="statusReason_type"
												>
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
												<f:selectItem itemLabel="#{msg.Gen_Cancelled}" itemValue="C" />
												<f:selectItem itemLabel="#{msg.Gen_Normal}" itemValue="N" />
												<f:selectItem itemLabel="#{msg.Gen_Dormant}" itemValue="D" />
												<f:selectItem itemLabel="#{msg.Gen_Stop_List}" itemValue="L" />
												<f:selectItem itemLabel="#{msg.Gen_Prospect}" itemValue="P" />
												<f:selectItem itemLabel="#{msg.Gen_Monitoring}" itemValue="M" />
												<f:selectItem itemLabel="#{msg.Gen_Suspended}" itemValue="S" />
												<f:selectItem itemLabel="#{msg.Gen_Replaced}" itemValue="R" />
												<f:selectItem itemLabel="#{msg.Gen_Stop_Renewal}" itemValue="E" />
												<f:selectItem itemLabel="#{msg.Gen_Others}" itemValue="O" />
												<a4j:support event="onchange" ajaxSingle="true"
													actionListener="#{statusReasonBackingBean.refreshreplaceOperation}"
													reRender="CountryMessage, CityListId1">
												</a4j:support>

												<rich:ajaxValidator event="onblur" />
											</h:selectOneMenu>
											<rich:message for="statusReason_type"	styleClass="warnningMessage" /> 
											</td>
											
											<td class="instance" width="20%"><h:outputText
												value="#{msg.gen_replaceOperation}" /><h:outputLabel
												style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%s"><h:selectOneMenu required="true"
												requiredMessage="#{msg.gen_replaceOperation} #{msg.Gen_required}"
												value="#{statusReasonBackingBean.replaceOperation}"
												id="CityListId1">
												<f:selectItem itemLabel="#{msg.Gen_Select}" />
												<f:selectItems value="#{statusReasonBackingBean.lst}"/>
											</h:selectOneMenu></td>
											
										</tr>
										<tr>
											<td class="instance"><h:outputText
												value="#{msg.Gen_Online_response_code}" /><h:outputLabel
												style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td><h:selectOneMenu required="true"
												requiredMessage="#{msg.Gen_Online_response_code} #{msg.Gen_required}" id="online_response"
												value="#{statusReasonBackingBean.onlineResponseCode}">
												<f:selectItem itemLabel="#{msg.Gen_Select}" />
												<f:selectItems
													value="#{applicationLists.actionDefinitionListSI}" />
											<a4j:support ajaxSingle="true" event="onchange" reRender="lbl_online_response"></a4j:support>
											<rich:ajaxValidator event="onblur" />
											</h:selectOneMenu>
											<h:outputLabel styleClass="codelbl" id="lbl_online_response" value="#{statusReasonBackingBean.onlineResponseCode}"/>
											<rich:message for="online_response"	styleClass="warnningMessage" />
											</td>




											<td class="instance"><h:outputText
												value="#{msg.Gen_EntityCode}" /><h:outputLabel
												style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td><h:selectOneMenu id="entiteCode"
												disabled="#{statusReasonBackingBean.modifyStatus}"
												value="#{statusReasonBackingBean.entity}" required="true"
												requiredMessage="#{msg.Gen_EntityCode} #{msg.Gen_required}">
												<f:selectItem itemLabel="#{msg.Gen_Select}" />
												<f:selectItem itemLabel="#{msg.Gen_Card}" itemValue="C" />
												<f:selectItem itemLabel="#{msg.Gen_Merchant}" itemValue="M" />
												<f:selectItem itemLabel="#{msg.Gen_Host}" itemValue="H" />
												<f:selectItem itemLabel="#{msg.Gen_Loyalty}" itemValue="L" />
												<f:selectItem itemLabel="#{msg.Gen_Account}" itemValue="A" />
												<f:selectItem itemLabel="#{msg.Gen_atm}" itemValue="G" />
												<f:selectItem itemLabel="#{msg.Gen_pos}" itemValue="P" />
												<rich:ajaxValidator event="onblur"  />
											</h:selectOneMenu>
											<rich:message for="entiteCode"	styleClass="warnningMessage" />
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
									actionListener="#{statusReasonBackingBean.checkChanges}"
									action="#{statusReasonBackingBean.back}"
									oncomplete="#{statusReasonBackingBean.backPanel}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
									immediate="#{statusReasonBackingBean.immediate}"></a4j:commandButton></td>

								<td><h:commandButton value="Add"
									action="#{statusReasonBackingBean.ToAddRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
									rendered="#{statusReasonBackingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Duplicate"
									action="#{statusReasonBackingBean.ToDuplicateRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
									rendered="#{statusReasonBackingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Refresh"
									action="#{statusReasonBackingBean.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{statusReasonBackingBean.addStatus}">
									</h:commandButton>
									<a4j:commandButton value="Delete"
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{statusReasonBackingBean.modifyStatus}">
									</a4j:commandButton></td>
								<td><a4j:commandButton value="Validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{statusReasonBackingBean.addStatus}"
									action="#{statusReasonBackingBean.valider}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate">

								</a4j:commandButton> <a4j:commandButton value="Modify"
									action="#{statusReasonBackingBean.modify}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{statusReasonBackingBean.modifyStatus}">
								</a4j:commandButton> <a4j:region>

									<a4j:poll id="poll" ajaxSingle="true"
										action="#{statusReasonSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="#{statusReasonBackingBean.pollEnabled}"
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

				</tbody></table>
			</td></tr></table></td>
		</tr></table></table>
	</h:form>
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

				<table width=100% class="tile" align="center">
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}" action="#{statusReasonSearchBB.back}"
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
				<table class="tile" width=100%>
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{statusReasonBackingBean.delete}"
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
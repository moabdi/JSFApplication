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
										value="#{msg.Gen_Mcc}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.Gen_Add}"
										rendered="#{MccBakingBean.addStatus}" /> <h:outputText
										value="#{msg.Gen_Modify}"
										rendered="#{MccBakingBean.modifyStatus}" /></td>
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
													value="#{msg.Gen_MccCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="mcc_code"
													value="#{MccBakingBean.mccCode}"  required="true"
												requiredMessage="#{msg.Gen_MccCode} #{msg.Gen_required} "
													disabled="#{MccBakingBean.modifyStatus}" size="4"
													maxlength="4"><f:validator validatorId="mustBeNumber" />
												

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="mcc_code" styleClass="warnningMessage" />
												</td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_Wording}" /> <h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="wordin" required="true" requiredMessage="#{msg.Gen_wording} #{msg.Gen_required}"
													value="#{MccBakingBean.wording}" size="30" maxlength="30">
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="wordin" styleClass="warnningMessage" />
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
												value="#{msg.Tcc_Code}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%">
											<h:selectOneMenu id="Tcc_Code"
												
												value="#{MccBakingBean.tccCode}" required="true"
												requiredMessage="#{msg.Tcc_Code} #{msg.Gen_required}">
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue=""/>
												<f:selectItem itemLabel="#{msg.mcc_atm}" itemValue="Z" />
												<f:selectItem itemLabel="#{msg.mcc_cashAdv}" itemValue="C" />
												<f:selectItem itemLabel="#{msg.mcc_educat}" itemValue="O" />
												<f:selectItem itemLabel="#{msg.mcc_hotel}" itemValue="H" />
												<f:selectItem itemLabel="#{msg.mcc_petrol}" itemValue="P" />
												<f:selectItem itemLabel="#{msg.mcc_phone}" itemValue="T" />
												<f:selectItem itemLabel="#{msg.mcc_purchase}" itemValue="R" />
												<f:selectItem itemLabel="#{msg.mcc_rail}" itemValue="L" />
												<f:selectItem itemLabel="#{msg.mcc_rentcar}" itemValue="R" />
												<f:selectItem itemLabel="#{msg.mcc_restaur}" itemValue="F" />
												<f:selectItem itemLabel="#{msg.mcc_travel}" itemValue="X" />
												<f:selectItem itemLabel="#{msg.mcc_uniq	}" itemValue="U" />
												
												<rich:ajaxValidator event="onblur" />
											</h:selectOneMenu>
											 <rich:message for="Tcc_Code" styleClass="warnningMessage" />
											</td>
											<td class="instance" width="20%"><h:outputText
												value="#{msg.Gen_Network_Code}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu disabled="#{MccBakingBean.modifyStatus}"
												value="#{MccBakingBean.networkCode}" id="network_code" required="true"
												requiredMessage="#{msg.Gen_Network_Code} #{msg.Gen_required} ">
												<f:selectItem itemLabel="#{msg.Gen_Select}"/>
												<f:selectItems value="#{applicationLists.networkListSI}"  />
												<rich:ajaxValidator event="onblur" />
												<a4j:support ajaxSingle="true" event="onchange" reRender="lbl_processCode"></a4j:support>
											</h:selectOneMenu> 
											<h:outputLabel styleClass="codelbl" id="lbl_processCode"				
											value="#{MccBakingBean.networkCode}"></h:outputLabel>
											<rich:message for="network_code"
												styleClass="warnningMessage" /></td>


										</tr>

									</table>
									</td>
								</tr>

							</tbody>
						</table>
						</td>
					</tr>
					<tr>
						<td>


						<table width="100%" class="buttonPanel">
							<tr>
								<td width="35%">&nbsp;</td>
								<td><a4j:commandButton value="Back"
									actionListener="#{MccBakingBean.checkChanges}"
									action="#{MccBakingBean.back}"
									oncomplete="#{MccBakingBean.backPanel}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
									immediate="#{MccBakingBean.immediate}"></a4j:commandButton></td>

								<td><h:commandButton value="Add"
									action="#{MccBakingBean.ToAddRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
									rendered="#{MccBakingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Duplicate"
									action="#{MccBakingBean.ToDuplicateRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
									rendered="#{MccBakingBean.modifyStatus}">
								</h:commandButton></td>


								<td><h:commandButton value="Refresh"
									action="#{MccBakingBean.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{MccBakingBean.addStatus}">
								</h:commandButton> <a4j:commandButton value="Delete"
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{MccBakingBean.modifyStatus}">
								</a4j:commandButton></td>

								<td><a4j:commandButton value="Validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{MccBakingBean.addStatus}"
									action="#{MccBakingBean.valider}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate"></a4j:commandButton> <a4j:commandButton
									value="Modify" action="#{MccBakingBean.modify}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{MccBakingBean.modifyStatus}">
								</a4j:commandButton> <a4j:region>
									<a4j:poll id="poll" ajaxSingle="true"
										action="#{MccSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000" enabled="#{MccBakingBean.pollEnabled}"
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
			</table>
		</table>

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
						value="#{msg.Gen_yes}" action="#{MccSearchBB.back}"
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
							value="#{msg.Gen_yes}" action="#{MccBakingBean.delete}"
							reRender="poll,poll2,validatePanel,msg" 
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
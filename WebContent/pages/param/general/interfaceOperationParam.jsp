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
										value="#{msg.interfaceOperationParam_interfaceParam}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.interfaceOperationParam_addInterface}"
										rendered="#{interfaceOperationBackingBean.addStatus}" /> <h:outputText
										value="#{msg.interfaceOperationParam_modifyInterface}"
										rendered="#{interfaceOperationBackingBean.modifyStatus}" /></td>
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
													value="#{msg.interfaceOperationParam_InterfaceCode}" /><h:outputLabel
													style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText required="true"
												requiredMessage="#{msg.interfaceOperationParam_InterfaceCode} #{msg.Gen_required} "
													id="interfaceOperation_code" size="3" maxlength="3"
													value="#{interfaceOperationBackingBean.interfaceOperation}"
													disabled="#{interfaceOperationBackingBean.modifyStatus}">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> 
												<rich:message for="interfaceOperation_code" styleClass="warnningMessage" />
												</td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.oper}" /> <h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
												<td width="30%">
												<h:inputText id="wordin" size="35" maxlength="30" required="true" requiredMessage="#{msg.oper} #{msg.Gen_required}"
													value="#{interfaceOperationBackingBean.wording}">
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
												value="#{msg.Gen_Interface}" /><h:outputLabel
												style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30"><h:selectOneMenu required="true"
												requiredMessage="#{msg.Gen_Interface} #{msg.Gen_required} "
												value="#{interfaceOperationBackingBean.interfaceCode}"
												disabled="#{interfaceOperationBackingBean.modifyStatus}"
												id="interface">

												<f:selectItem itemLabel="#{msg.Gen_Select}"  />
												<f:selectItems value="#{applicationLists.interfaceListSI}" />

												<rich:ajaxValidator event="onblur" />
												<a4j:support event="onchange" reRender="lbl_processCode"></a4j:support>
											</h:selectOneMenu> <h:outputLabel styleClass="codelbl" id="lbl_processCode"
												value="#{interfaceOperationBackingBean.interfaceOperation}"></h:outputLabel>
											<rich:message for="interface" styleClass="warnningMessage" /></td>

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
									actionListener="#{interfaceOperationBackingBean.checkChanges}"
									action="#{interfaceOperationBackingBean.back}"
									oncomplete="#{interfaceOperationBackingBean.backPanel}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
									immediate="#{interfaceOperationBackingBean.immediate}"></a4j:commandButton></td>

								<td><h:commandButton value="Add"
									action="#{interfaceOperationBackingBean.ToAddRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
									rendered="#{interfaceOperationBackingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Duplicate"
									action="#{interfaceOperationBackingBean.ToDuplicateRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
									rendered="#{interfaceOperationBackingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Refresh"
									action="#{interfaceOperationBackingBean.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{interfaceOperationBackingBean.addStatus}">
								</h:commandButton> <a4j:commandButton value="Delete"
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{interfaceOperationBackingBean.modifyStatus}">
								</a4j:commandButton></td>
								<td><a4j:commandButton value="Validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{interfaceOperationBackingBean.addStatus}"
									action="#{interfaceOperationBackingBean.valider}"
									reRender="poll2,validatePanel,msg" limitToList="true"
									status="status_validate">

								</a4j:commandButton> <a4j:commandButton value="Modify"
									action="#{interfaceOperationBackingBean.modify}"
									reRender="poll2,validatePanel,msg" limitToList="true"
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{interfaceOperationBackingBean.modifyStatus}">
								</a4j:commandButton> <a4j:region>

									<a4j:poll id="poll" ajaxSingle="true"
										action="#{interfaceOperationSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="#{interfaceOperationBackingBean.pollEnabled}"
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
							value="#{msg.Gen_yes}"
							action="#{interfaceOperationSearchBB.back}"
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
							value="#{msg.Gen_yes}"
							action="#{interfaceOperationBackingBean.delete}"
							reRender="poll,validatePanel,msg" limitToList="true"
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
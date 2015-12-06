<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	</head>
	<body class="body">
	<h:form>
		<%@ include file="/commun/header.jsp"%></h:form>
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
										value="#{msg.Gen_Interface_Def}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.Gen_Add}"
										rendered="#{interfaceBackingBean.addStatus}" /> <h:outputText
										value="#{msg.Gen_Modify}"
										rendered="#{interfaceBackingBean.modifyStatus}" /></td>
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
													value="#{msg.Gen_BankCode}" /></td>
												<td width="30%"><h:selectOneMenu
													value="#{interfaceBackingBean.bankCode}" id="Bank_cod">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
													<f:selectItems value="#{applicationLists.bankListSI}" />
													<a4j:support ajaxSingle="true" event="onchange" reRender="lbl_bankCode"></a4j:support>
												</h:selectOneMenu> <h:outputLabel styleClass="codelbl" id="lbl_bankCode"
													value="#{interfaceBackingBean.bankCode}"></h:outputLabel></td>


												<td class="instance" width="20%"><h:outputText
													value="#{msg.interfaceParam_InterfaceCode}" /><h:outputLabel
													style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="interface_code"
													size="6" maxlength="6" required="true"
													requiredMessage="#{msg.interfaceParam_InterfaceCode} #{msg.Gen_required}"
													value="#{interfaceBackingBean.interfaceCode}"
													disabled="#{interfaceBackingBean.modifyStatus}">

													<rich:ajaxValidator event="onblur" />
												</h:inputText>
												<rich:message for="interface_code"styleClass="warnningMessage" />
												</td>
											</tr>
											<tr>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_Wording}" /> <h:outputLabel
													style="color:red" value="#{msg.Gen_RequireField}" /></td>

												<td><h:inputText required="true" id="wordin"
													requiredMessage="#{msg.Gen_wording} #{msg.Gen_required}"
													value="#{interfaceBackingBean.wording}" size="30"
													maxlength="30">
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="wordin" styleClass="warnningMessage" />
													</td>
												<td class="instance"><h:outputText
													value="#{msg.interfaceType}" /></td>


												<td><h:selectOneMenu 
													value="#{interfaceBackingBean.interfaceType}"
													id="InterfaceType">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
													<f:selectItem itemLabel="#{msg.Gen_Atm_Server}" itemValue="A" />
													<f:selectItem itemLabel="#{msg.Gen_Pos_Server}" itemValue="P" />
													<f:selectItem itemLabel="#{msg.Gen_Bank_Interf}" itemValue="B" />
													<f:selectItem itemLabel="#{msg.Gen_Nat_Interf}" itemValue="N" />
													<f:selectItem itemLabel="#{msg.Gen_Foreign_Interf}" itemValue="F" />
													<f:selectItem itemLabel="#{msg.Gen_Other_Interf}" itemValue="O" />
													<f:selectItem itemLabel="#{msg.Gen_EPS_Switch}" itemValue="E" />
													<f:selectItem itemLabel="#{msg.Gen_EPS_Virtual_Interf}" itemValue="T" />
													<f:selectItem itemLabel="#{msg.Gen_HSM_Prod}" itemValue="H" />
													<f:selectItem itemLabel="#{msg.Gen_HSM_Verif}" itemValue="V" />
													<a4j:support ajaxSingle="true" event="onchange" reRender="lbl_interfaceType"></a4j:support>
												</h:selectOneMenu> <h:outputLabel styleClass="codelbl" id="lbl_interfaceType"
													value="#{interfaceBackingBean.interfaceType}"></h:outputLabel>
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
					<table width="100%">
						<tr>
							<td>
							<table class="tile">
								<thead>
									<tr>
										<td class="title"><h:outputText value="#{msg.Gen_Conn}" /></td>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>
										<table width="100%">

											<tr>
												<td class="instance"><h:outputText
													value="#{msg.switchLinkComAddr}" /></td>
												<td><h:inputText
													value="#{interfaceBackingBean.switchLinkComAddr}"
													id="SwitchLinkComAddr" disabled="false" size="20"
													maxlength="20" >
													<f:validator validatorId="mustBeIpAdress" />
													<rich:ajaxValidator event="onkeyup" />
													</h:inputText>
													<rich:message for="SwitchLinkComAddr" styleClass="warnningMessage" />
													</td>
												<td class="instance"><h:outputText
													value="#{msg.switchPort}" /></td>
												<td><h:inputText dir="RTL"
													value="#{interfaceBackingBean.switchPort }" id="switchPort"
													disabled="false" size="6" maxlength="5" >
													<f:validator validatorId="mustBePortNumber"/> 
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="switchPort" styleClass="warnningMessage" />
													</td>

											</tr>
											<tr>
												<td width="20%" class="instance"><h:outputText
													value="#{msg.adminPort}" /></td>
												<td width="30%"><h:inputText dir="RTL"
													value="#{ interfaceBackingBean.adminPort}" id="adminPort"
													disabled="false" size="6" maxlength="5" >
													<f:validator validatorId="mustBePortNumber"/> 
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="adminPort" styleClass="warnningMessage" />
													</td>
											</tr>

											<tr>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.IP_Adress_Local}" /></td>
												<td width="30%"><h:inputText
													value="#{interfaceBackingBean.ipAddressLocal}"
													id="IpAdressLocal" size="20" maxlength="15">
													<f:validator validatorId="mustBeIpAdress" />
													<rich:ajaxValidator event="onkeyup" />
												</h:inputText> <rich:message for="IpAdressLocal"
													styleClass="warnningMessage" /></td>

												<td class="instance" width="20%"><h:outputText
													value="#{msg.ipAddressRemote}" /></td>
												<td width="30%"><h:inputText
													value="#{interfaceBackingBean.ipAddressRemote}"
													id="IpAddressRemote" size="20" maxlength="15">
													<f:validator validatorId="mustBeIpAdress" />
													<rich:ajaxValidator event="onkeyup" />
												</h:inputText> <rich:message for="IpAddressRemote"
													styleClass="warnningMessage" /></td>
											</tr>

											<tr>
												<td class="instance"><h:outputText
													value="#{msg.commsPort}" /></td>
												<td><h:inputText dir="RTL"
													value="#{interfaceBackingBean.commsPort }" id="CommsPort"
													disabled="false" size="6" maxlength="5" >
													<f:validator validatorId="mustBePortNumber"/> 
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="CommsPort" styleClass="warnningMessage" />
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
					<td width="100%">
					<table width="100%">
						<tr>
							<td>
							<table class="tile">
								<thead>
									<tr>
										<td colspan="4" class="title"><h:outputText
											value="#{msg.Gen_Informations}" /></td>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td class="instance" width="20%"><h:outputLabel
											value="#{msg.connectMode}">
										</h:outputLabel></td>
										<td width="30%" class="instance"><h:selectOneRadio
											styleClass="panelRadio" id="ConnectMode"
											value="#{interfaceBackingBean.connectMode}">
											<f:selectItem itemValue="M" itemLabel="Master" />
											<f:selectItem itemValue="S" itemLabel="Slave" />
										</h:selectOneRadio></td>

										<td class="instance" width="20%"><h:outputLabel
											value="#{msg.objetSupervise}" /></td>
										<td width="30%" class="instance"><h:selectOneRadio
											styleClass="panelRadio" id="ObjetSupervise"
											value="#{interfaceBackingBean.objetSupervise}">
											<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
											<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
										</h:selectOneRadio></td>
									</tr>
									<tr>
										<td class="instance" width="20%"><h:outputLabel
											value="#{msg.pciManagement}" /></td>
										<td width="30%" class="instance"><h:selectOneRadio
											styleClass="panelRadio" id="pci_management"
											value="#{interfaceBackingBean.pciManagement}">
											<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
											<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
										</h:selectOneRadio></td>

										<td class="instance"><h:outputText
											value="#{msg.keyIndex}" /></td>
										<td><h:selectOneMenu
											value="#{interfaceBackingBean.keyIndex}" id="KeyIndex">
											<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
											<f:selectItems value="#{applicationLists.keyMangeListSI}" />
												<a4j:support ajaxSingle="true" event="onchange" reRender="lbl_keyId"></a4j:support>
											</h:selectOneMenu> 
											<h:outputLabel styleClass="codelbl" id="lbl_keyId" value="#{interfaceBackingBean.keyIndex}"/>
											</td>
									</tr>
									<tr>
										<td width="20%" class="instance"><h:outputText
											value="#{msg.acquirerId}" /></td>
										<td width="30%"><h:inputText dir="RTL"
											value="#{interfaceBackingBean.acquirerId}" id="AcquirerId"
											disabled="false" size="11" maxlength="11" /></td>


										<td class="instance"><h:outputText value="#{msg.ica}" /></td>
										<td><h:inputText dir="RTL"
											value="#{interfaceBackingBean.ica}" id="Ica" disabled="false"
											size="11" maxlength="6" /></td>

									</tr>
									<tr>
										<td class="instance"><h:outputText
											value="#{msg.processorId}" /></td>
										<td><h:inputText dir="RTL"
											value="#{interfaceBackingBean.processorId}" disabled="false"
											id="ProcessorId" size="11" maxlength="11" /></td>
										<td class="instance"><h:outputText
											value="#{msg.stationId}" /></td>
										<td><h:inputText dir="RTL"
											value="#{interfaceBackingBean.stationId}" id="StationId"
											disabled="false" size="11" maxlength="6" /></td>
									</tr>
									<tr>
										<td class="instance"><h:outputText
											value="#{msg.traceLevel}" /></td>
										<td><h:selectOneMenu
											value="#{interfaceBackingBean.traceLevel}" id="traceLevel">
											<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
											<f:selectItem itemLabel="#{msg.normal}" itemValue="0" />
											<f:selectItem itemLabel="#{msg.warning}" itemValue="1" />
											<f:selectItem itemLabel="#{msg.fatal}" itemValue="2" />
										</h:selectOneMenu></td>

										<td class="instance"><h:outputText
											value="#{msg.traceFileName}" /></td>
										<td><h:inputText 
											value="#{interfaceBackingBean.traceFileName}"
											id="traceFileName" disabled="false" size="30" maxlength="30" /></td>
									</tr>

									<table class="tile">
										<thead>
											<tr>
												<td colspan="4" class="title"><h:outputText
													value="#{msg.Gen_Details}" /></td>
											</tr>
										</thead>



										<tr>

											<td class="instance" width="20%"><h:outputText
												value="#{msg.status}" rendered="#{interfaceBackingBean.modifyStatus}" /></td>
											<td width="30%"><h:selectOneMenu rendered="#{interfaceBackingBean.modifyStatus}" disabled="#{interfaceBackingBean.showHide}"
												value="#{interfaceBackingBean.status}" id="Status">
												<f:selectItem itemLabel="" itemValue="" />
												<f:selectItem itemLabel="#{msg.ONL}" itemValue="ONL" />
												<f:selectItem itemLabel="#{msg.OFL}" itemValue="OFL" />
												<f:selectItem itemLabel="#{msg.SON}" itemValue="SON" />
												<f:selectItem itemLabel="#{msg.SOF}" itemValue="SOF" />

											</h:selectOneMenu></td>
											<td class="instance" width="20%"><h:outputText
												value="#{msg.pidId}" /></td>
											<td width="30%"><h:inputText dir="RTL"
												value="#{interfaceBackingBean.pidId}" disabled="true"
												id="PidId" size="9" maxlength="8" /></td>
										</tr>
										<tr>
											<td class="instance"><h:outputText
												value="#{msg.threadId}" /></td>
											<td><h:inputText dir="RTL"
												value="#{interfaceBackingBean.threadId}" disabled="true"
												id="ThreadId" size="9" maxlength="8" /></td>

											<td class="instance"><h:outputText
												value="#{msg.commNbrthread}" /></td>
											<td><h:inputText dir="RTL"
												value="#{interfaceBackingBean.commNbrthread}"
												id="CommNbrthread" disabled="false" size="9" maxlength="8" /></td>
										</tr>
										<tr>
											<td class="instance"><h:outputText
												value="#{msg.authoNbrthread}" /></td>
											<td><h:inputText dir="RTL"
												value="#{interfaceBackingBean.authoNbrthread}"
												id="AuthoNbrthread" size="9" maxlength="8" /></td>

											<td class="instance"><h:outputText
												value="#{msg.interfaceTimeout}" /></td>
											<td><rich:inputNumberSpinner required="true"
												value="#{interfaceBackingBean.interfaceTimeout}"
												minValue="0" maxValue="99999999" step="1" /></td>



										</tr>



										<td class="instance"><h:outputText
											value="#{msg.echoTimer}" /></td>
										<td><rich:inputNumberSpinner required="true"
											value="#{interfaceBackingBean.echoTimer}" minValue="0"
											maxValue="99999999" step="1" /></td>

										<td class="instance"><h:outputText
											value="#{msg.genReversalTimeout}" /></td>
										<td class="instance"><h:selectOneRadio
											styleClass="panelRadio" id="ReversalTimeout"
											value="#{interfaceBackingBean.genReversalTimeout}">
											<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
											<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
										</h:selectOneRadio></td>
										<tr>

											<td class="instance"><h:outputText
												value="#{msg.safSendCounterMax}" /></td>
											<td><rich:inputNumberSpinner required="true"
												value="#{interfaceBackingBean.safSendCounterMax}"
												minValue="0" maxValue="99" step="1" /></td>

											<td class="instance"><h:outputText
												value="#{msg.adviceInterval}" /></td>
											<td><rich:inputNumberSpinner required="true"
												value="#{interfaceBackingBean.adviceInterval}" minValue="0"
												maxValue="9999" step="1" /></td>
										</tr>
										<tr>

											<td class="instance"><h:outputText
												value="#{msg.startShl}" /></td>
											<td><h:inputText
												value="#{interfaceBackingBean.startShl}" id="StartShl"
												disabled="false" size="25" maxlength="25" /></td>

											<td class="instance"><h:outputText
												value="#{msg.stopShl}" /></td>
											<td><h:inputText value="#{interfaceBackingBean.stopShl}"
												id="StopShl" disabled="false" size="25" maxlength="25" /></td>
										</tr>
									</table>
							</table>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" class="buttonPanel">
								<tr>
									<td width="35%">&nbsp;</td>
									<td><a4j:commandButton value="Back"
										actionListener="#{interfaceBackingBean.checkChanges}"
										action="#{interfaceBackingBean.back}"
										oncomplete="#{interfaceBackingBean.backPanel}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="#{interfaceBackingBean.immediate}"></a4j:commandButton></td>

									<td><h:commandButton value="Add"
										action="#{interfaceBackingBean.ToAddRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
										rendered="#{interfaceBackingBean.modifyStatus}">
									</h:commandButton></td>
									<td><h:commandButton value="Duplicate"
										action="#{interfaceBackingBean.ToDuplicateRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
										rendered="#{interfaceBackingBean.modifyStatus}">
									</h:commandButton></td>
									<td><h:commandButton value="Refresh"
										action="#{interfaceBackingBean.refresh}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
										rendered="#{interfaceBackingBean.addStatus}">
									</h:commandButton> <a4j:commandButton value="Delete"
										oncomplete="Richfaces.showModalPanel('deletePanel')"
										image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
										rendered="#{interfaceBackingBean.modifyStatus}">
									</a4j:commandButton></td>
									<td><a4j:commandButton value="Validate"
										image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
										rendered="#{interfaceBackingBean.addStatus}"
										action="#{interfaceBackingBean.valider}"
										reRender="poll2,validatePanel,msg" 
										status="status_validate">

									</a4j:commandButton> <a4j:commandButton value="Modify"
										action="#{interfaceBackingBean.modify}"
										reRender="poll2,validatePanel,msg" 
										status="status_validate"
										image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
										rendered="#{interfaceBackingBean.modifyStatus}">
									</a4j:commandButton> <a4j:region>

										<a4j:poll id="poll" ajaxSingle="true"
											action="#{interfaceSearchBB.back}"
											oncomplete="Richfaces.hideModalPanel('validatePanel')"
											interval="2000" enabled="#{interfaceBackingBean.pollEnabled}"
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
			</table>
		</table>
	</h:form>
	</body>

	<a4j:region>
		<!-- le code qui suit sert à mettre des popup pour demander si l utilsateur veut vraiment back -->
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
							value="#{msg.Gen_yes}" action="#{interfaceSearchBB.back}"
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
							value="#{msg.Gen_yes}" action="#{interfaceBackingBean.delete}"
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
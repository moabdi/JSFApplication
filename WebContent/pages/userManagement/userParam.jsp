<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>
<f:loadBundle var="msg" basename="i18n.messages"/>
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
									<td width="54%" align="left"><h:outputText
										value="#{msg.userParam_userParam}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.userParam_addUser}" rendered="#{userParamBB.addStatus}"/></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.userParam_modifyUser}" rendered="#{userParamBB.modifyStatus}"/></td>
									<td width="1%">&nbsp;</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
					</td>

				</tr>
				<tr>
					<td valign="top" class="zoneTravail">
					<a4j:region>
					<rich:messages id="msg" showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage" layout="list">
					</rich:messages>
					</a4j:region>
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
										<td class="title"><h:outputText
											value="#{msg.userParam_Identification}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%">
										<tr>
											<tr>
										<td valign="top" colspan="4" >
											<rich:simpleTogglePanel rendered="#{userParamBB.modifyStatus}" label="#{msg.Gen_Action}" bodyClass="tile" headerClass="title" style="background-color:#FFFFFF;" switchType="client" width="100%" height="20px">
											<table align="center" class="tile" width="100%">
												<tr>
													<td align="center"><a4j:commandButton value="#{msg.Gen_ResetSession}"
														oncomplete="Richfaces.showModalPanel('resetPanel')"
														rendered="#{userParamBB.modifyStatus}" >
														</a4j:commandButton>
													</td>
													<td align="center"><a4j:commandButton value="#{msg.Gen_AccountLocker}"
														oncomplete="Richfaces.showModalPanel('resetPanel2')"
														rendered="#{userParamBB.modifyStatus}">
														</a4j:commandButton>
													</td>
													<td align="center"><a4j:commandButton value="#{msg.Gen_ResetPassword}"
														oncomplete="Richfaces.showModalPanel('resetPanel3')"
														rendered="#{userParamBB.modifyStatus}">
														</a4j:commandButton>
													</td>
												</tr>
											</table>
											</rich:simpleTogglePanel>
											</td>
									</tr>
											<tr>
												<td class="instance" width="20%"><h:outputLabel value="#{msg.userParam_userCode}" ></h:outputLabel><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="user_code" value="#{userParamBB.userCode}">
												<rich:ajaxValidator event="onkeyup"/>
												
												</h:inputText>
												<rich:message for="user_code" showSummary="false" styleClass="errorMessage" tooltip="true"/>
												</td>
												
												<td class="instance" width="20%" ><h:outputLabel
													value="#{msg.userParam_userName}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText value="#{userParamBB.userName}"></h:inputText></td>
											</tr>
											<tr>
												<td class="instance"><h:outputLabel rendered="#{userParamBB.addStatus}"
													value="#{msg.userParam_userPassword}" /><h:outputLabel rendered="#{userParamBB.addStatus}" style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td><h:inputSecret id="user_password" rendered="#{userParamBB.addStatus}" maxlength="20" disabled="#{userParamBB.modifyStatus}" value="#{userParamBB.userPassword}" valueChangeListener="#{userParamBB.getNewPassword}">
													<a4j:support limitToList="true" event="onkeyup" actionListener="#{userParamBB.checkpassvalue}" reRender="strengthlbl" ajaxSingle="true"></a4j:support>
													</h:inputSecret>
													<h:graphicImage id="password_help" rendered="#{userParamBB.addStatus}" width="15" value="#{facesContext.externalContext.requestContextPath}/images/aide.gif" >
													<rich:toolTip for="password_help" rendered="#{userParamBB.addStatus}" layout="block" direction="top-right" zorder="1000" value="#{msg.Gen_pass_model}" />
													</h:graphicImage>
													<h:outputText id="strengthlbl" rendered="#{userParamBB.addStatus}" style="#{userParamBB.passStyle}" value="#{userParamBB.passValue}" />
												</td>
												<td class="instance"> <h:outputLabel rendered="#{userParamBB.addStatus}"
													value="#{msg.userParam_userPasswordConfirm}" /> </td>
												<td><h:inputSecret id="passwordConfirm" rendered="#{userParamBB.addStatus}" value="#{userParamBB.userPassword}" validator="#{userParamBB.validateSecondPassword}" 
												>
												<rich:message for="passwordConfirm"/>
												</h:inputSecret>
												
												
												</td>
											</tr>
											<tr>
												<td class="instance"><h:outputLabel value="Password expiration" /></td>
												<td class="instance"><h:selectOneRadio styleClass="panelRadio" value="#{userParamBB.expirationMang}">
													<f:selectItem itemLabel="Yes" itemValue="Y" />
													<f:selectItem itemLabel="No" itemValue="N" />
													<a4j:support event="onchange" reRender="expiry_Date" action="#{userParamBB.controlCal}" ajaxSingle="true"></a4j:support>
												</h:selectOneRadio></td>
												<td class="instance" ><h:outputLabel value="#{msg.Gen_expireDate}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td><rich:calendar id="expiry_Date" value="#{userParamBB.dateEndPass}"
															locale="en"
															datePattern="dd/MM/yyyy" disabled="#{userParamBB.offcal}"
															popup="true"
															direction="auto"
															zindex="1000"
															cellWidth="24px" cellHeight="22px" style="width:200px"/>
												</td>
											</tr>
											<tr>
												<td class="instance"> <h:outputLabel value="Number of sessions allowed" ></h:outputLabel></td>
												<td><rich:inputNumberSpinner step="1" maxValue="99" minValue="1" id="sessions_nbr" value="#{userParamBB.nbreSessionAllowed}">
													</rich:inputNumberSpinner>
												</td>
												
												<td class="instance"> <h:outputLabel value="Number of tries allowed" ></h:outputLabel></td>
												<td><rich:inputNumberSpinner step="1" maxValue="10" minValue="1" id="tries_nbr" value="#{userParamBB.numberOfTriesAllowed}" >
													</rich:inputNumberSpinner>
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
									<td class="title"><h:outputLabel
											value="#{msg.userParam_Details}" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<table width="100%">
										<tr>
											<td class="instance" width="20%"><h:outputLabel	value="#{msg.userParam_userBankCode}" /></td>
											<td width="30%"><h:selectOneMenu
												value="#{userParamBB.userBankCode}" immediate="true">
												<f:selectItem itemLabel="#{msg.Gen_Select}"
																itemValue="" />
												<f:selectItems  value="#{applicationLists.bankListSI}" />
												
												<a4j:support ajaxSingle="true" event="onchange" actionListener="#{userParamBB.refreshBranch}" reRender="branchSelectOneMenu"/>
											</h:selectOneMenu>
											</td>
											<td class="instance" width="20%" ><h:outputLabel value="#{msg.userParam_userBranchCode}" /></td>
											<td width="30%"><h:selectOneMenu id="branchSelectOneMenu" value="#{userParamBB.userBranchCode}" >
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
												<f:selectItems  value="#{applicationLists.brachListSI}" />
												</h:selectOneMenu></td>
										</tr>
										<tr>
											<td class="instance"><h:outputLabel value="#{msg.Gen_Account_blocked}"/><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td class="instance"><h:selectOneRadio styleClass="panelRadio"
												value="#{userParamBB.blockAccess}">
													<f:selectItem itemLabel="Yes" itemValue="Y" />
													<f:selectItem itemLabel="No" itemValue="N" />
												</h:selectOneRadio>
											</td>
											<td class="instance"><h:outputLabel	value="#{msg.userParam_userType}" /></td>
											<td ><h:selectOneMenu value="#{userParamBB.userType}">
													<f:selectItem itemLabel="#{msg.Gen_Select}"	itemValue="" />
													<f:selectItem itemLabel="Supervisor" itemValue="S" />
													<f:selectItem itemLabel="Operator" itemValue="O" />
												</h:selectOneMenu>
											</td>
										</tr>
										<tr>
											<td class="instance"><h:outputLabel value="#{msg.userParam_userIpAdressManag}"/> </td>
											<td class="instance"><h:selectOneRadio styleClass="panelRadio"
												value="#{userParamBB.ipAddressMang}">
												<f:selectItem itemLabel="Yes" itemValue="Y" />
													<f:selectItem itemLabel="No" itemValue="N" />
													<a4j:support ajaxSingle="true" event="onchange" action="#{userParamBB.controlIP}" reRender="user_ip" limitToList="true"></a4j:support>
												</h:selectOneRadio>
											</td>
											<td class="instance" ><h:outputLabel value="#{msg.Gen_Ip_adress}" ></h:outputLabel><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td ><h:inputText maxlength="15" size="15" disabled="#{userParamBB.offIp}" id="user_ip" value="#{userParamBB.ipAddress}">
												<f:validator validatorId="mustBeIpAdress"/>
												<rich:ajaxValidator event="onkeyup"/>
												
												</h:inputText>
												<rich:message for="user_ip" showSummary="false" styleClass="errorMessage" tooltip="true"/>
												</td>
										</tr>
										<tr>
											<td class="instance"><h:outputLabel value="#{msg.Gen_PasswordStatus}"/><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td>
												<h:selectOneMenu id="pstatusSelect" value="#{userParamBB.firstConnection}" >
												<f:selectItem itemValue="Y" itemLabel="First"/>
												<f:selectItem itemValue="M" itemLabel="Modified"/>
												<f:selectItem itemValue="N" itemLabel="Not first"/>
												</h:selectOneMenu>
											</td>
											<td class="instance"><h:outputText
												value="#{msg.Gen_Langue}" /><h:outputLabel
												style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td><h:selectOneMenu
												id="language_code" value="#{userParamBB.languageCode}">
												<f:selectItem itemLabel="#{msg.Gen_Select}"
													itemValue="" />
												<f:selectItems value="#{applicationLists.langListSI}" />
												</h:selectOneMenu></td>
														
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
											actionListener="#{userParamBB.checkChanges}"
											action="#{userParamBB.back}"									
                    						oncomplete="#{userParamBB.backPanel}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
											immediate="#{userParamBB.immediate}"
											 ></a4j:commandButton></td>
											
										<td>
										<h:commandButton value="Add"
											action="#{userParamBB.ToAddRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
											rendered="#{userParamBB.modifyStatus}" >
											</h:commandButton>
											</td>
										<td>
										<h:commandButton value="Duplicate"
											action="#{userParamBB.ToDuplicateRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
											 rendered="#{userParamBB.modifyStatus}" >
											 </h:commandButton>
										</td>
										<td>
										<h:commandButton value="Refresh"
											action="#{userParamBB.refresh}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
											 rendered="#{userParamBB.addStatus}"  >
											</h:commandButton>
											<a4j:commandButton value="Delete"
                    						oncomplete="Richfaces.showModalPanel('deletePanel')"
											image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
											 rendered="#{userParamBB.modifyStatus}">
											</a4j:commandButton>
											</td>
										<td>
										<a4j:commandButton value="Validate"
											
											image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png" 
											rendered="#{userParamBB.addStatus}" 
											action="#{userParamBB.valider}" 
											reRender="poll2,validatePanel,msg"
											limitToList="true"
											status="status_validate"
											>
											
											</a4j:commandButton>
											
											<a4j:commandButton value="Modify"
											action="#{userParamBB.modify}" 
											reRender="poll2,validatePanel,msg"
											limitToList="true"
											status="status_validate"
											image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
											rendered="#{userParamBB.modifyStatus}">
											</a4j:commandButton>
											
											<a4j:region>
											
											<a4j:poll id="poll" ajaxSingle="true" 
											action="#{userParamSearchBB.back}" 
											oncomplete="Richfaces.hideModalPanel('validatePanel')" 
											interval="2000" enabled="#{userParamBB.pollEnabled}" 
											reRender="validatePanel" limitToList="true"/>
											
											<a4j:poll id="poll2" le="true" oncomplete="Richfaces.hideModalPanel('validatePanel')" interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true" reRender="validatePanel" limitToList="true"/>
											
               								</a4j:region>
               								 </td>
									</tr>
									<h:outputText value="#{userParamBB.alertMsg}" 
										escape="false" rendered="#{userParamBB.render}" />
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
							value="#{msg.Gen_yes}" action="#{userParamSearchBB.back}"
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
							value="#{msg.Gen_yes}" action="#{userParamBB.delete}"
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
	<a4j:region>

		<rich:modalPanel id="resetPanel" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink4" />
					<rich:componentControl for="resetPanel" attachTo="hidelink4"
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
							value="#{msg.confirm_resetSession}" /></td>
					</tr>
				</table>
				<table class="tile" width=100%>
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{userParamBB.resetSession}"
							reRender="poll2,validatePanel,msg" limitToList="true"
							oncomplete="Richfaces.hideModalPanel('resetPanel');"
							status="status_reset" style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}"
							onclick="Richfaces.hideModalPanel('resetPanel');return false;"
							style=" width : 67px;" /></td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>

		<a4j:status id="status_reset"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('validatePanel');" />
	</a4j:region>
	<a4j:region>

		<rich:modalPanel id="resetPanel2" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink5" />
					<rich:componentControl for="resetPanel2" attachTo="hidelink5"
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
							value="#{msg.confirm_Lock_unlock}" /></td>
					</tr>
				</table>
				<table class="tile" width=100%>
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{userParamBB.lockAccount}"
							reRender="poll2,validatePanel,msg" limitToList="true"
							oncomplete="Richfaces.hideModalPanel('resetPanel2');"
							status="status_reset2" style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}"
							onclick="Richfaces.hideModalPanel('resetPanel2');return false;"
							style=" width : 67px;" /></td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>

		<a4j:status id="status_reset2"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('validatePanel');" />
	</a4j:region>
	<a4j:region>

		<rich:modalPanel id="resetPanel3" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink6" />
					<rich:componentControl for="resetPanel3" attachTo="hidelink6"
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
							value="#{msg.confirm_resetPassword}" /></td>
					</tr>
				</table>
				<table class="tile" width=100%>
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{userParamBB.resetPass}"
							reRender="poll2,validatePanel,msg" limitToList="true"
							oncomplete="Richfaces.hideModalPanel('resetPanel3');"
							status="status_reset3" style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}"
							onclick="Richfaces.hideModalPanel('resetPanel3');return false;"
							style=" width : 67px;" /></td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>

		<a4j:status id="status_reset3"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('validatePanel');" />
	</a4j:region>
</f:view>

</html>
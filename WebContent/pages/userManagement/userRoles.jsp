<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../../commun/taglibs.jsp"%>
<f:loadBundle var="msg" basename="i18n.messages" />

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
			<tr><td>
			<table class="titrePage" width="100%">
				<tr>
					<td valign="top" class="zoneIdent">
					<table width="100%">

						<tr>
							<td>
							<table width="100%" class="ident">
								<tr>
									<td width="54%" align="left"><h:outputText
										value="#{msg.userRoles_TitleLeft}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.userRoles_TitleRight}" /></td>
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
							<table class="tile" width="100%">
								<thead>
									<tr>
										<td class="title"><h:outputText
											value="#{msg.userRoles_Identification}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%" >
											<tr>
											
												<td class="instance" width="20%"><h:outputLabel
													value="#{msg.userRoles_user}" /></td>
												<td width="30%"><h:selectOneMenu value="#{userRolesBB.userCode}"
													id="selectOneMenu" valueChangeListener="#{userRolesBB.fireUserRoles}"
													immediate="true">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
													<f:selectItems value="#{userRolesBB.userlistSI}"/>
													<a4j:support event="onchange" action="#{userRolesBB.refreshInfos}" reRender="rolesInfos,userInfos"></a4j:support>
												</h:selectOneMenu>
												</td>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="4">
												<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton value="Refresh"
													action="#{userRolesBB.Refresh}"
													image="../../images/button_refresh.png"></h:commandButton></td>
												<td align="left" width="20%"><h:commandButton value="Search"
													action="#{userRolesBB.searchRoles}"
													image="../../images/button_search.png"></h:commandButton></td>
												</tr>
												</table>
											</td></tr>	
										</table>
										</td>
									</tr>

								</tbody>
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
											value="#{msg.Gen_Informations}" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<a4j:outputPanel id="userInfos">
									<table width="100%">
										<tr>
											<td class="instance"><h:outputLabel value="User password status"/></td>
											<td>
												<h:selectOneMenu disabled="true" id="pstatusSelect" value="#{userRolesBB.firstConnection}" >
												<f:selectItem  itemValue="" />
												<f:selectItem itemValue="Y" itemLabel="First"/>
												<f:selectItem itemValue="M" itemLabel="Modified"/>
												<f:selectItem itemValue="N" itemLabel="Not first"/>
												</h:selectOneMenu>
											</td>
											<td class="instance" width="20%"> <h:outputLabel value="Number of sessions allowed" ></h:outputLabel></td>
												<td width="30%"><h:inputText readonly="true" size="2" styleClass="inputTextWording2" id="sessions_nbr" value="#{userRolesBB.nbreSessionAllowed}">
													</h:inputText>
												</td>										
										</tr>
										<tr>
											<td class="instance"><h:outputLabel value="#{msg.Gen_Account_blocked}"/></td>
											<td class="instance"><h:selectOneRadio disabled="true" styleClass="panelRadio"
												value="#{userRolesBB.blockAccess}">
													<f:selectItem itemLabel="Yes" itemValue="Y" />
													<f:selectItem itemLabel="No" itemValue="N" />
												</h:selectOneRadio>
											</td>
											<td class="instance"><h:outputLabel	value="#{msg.userParam_userType}" /></td>
											<td ><h:selectOneMenu disabled="true" value="#{userRolesBB.userType}">
													<f:selectItem  itemValue="" />
													<f:selectItem itemLabel="Supervisor" itemValue="S" />
													<f:selectItem itemLabel="Operator" itemValue="O" />
												</h:selectOneMenu>
											</td>
										</tr>
										<tr>
											<td class="instance" width="20%" ><h:outputLabel value="#{msg.Gen_Start_date}" /></td>
											<td width="30%"><rich:calendar id="expiry_Date" value="#{userRolesBB.dateStartPass}"
															locale="en"
															datePattern="dd/MM/yyyy" disabled="false"
															popup="true"
															direction="auto"
															zindex="1000"
															cellWidth="24px" cellHeight="22px" style="width:200px"/>
												</td>
												<td class="instance" ><h:outputLabel value="#{msg.Gen_Ip_adress}" ></h:outputLabel></td>
												<td ><h:inputText maxlength="15" size="15" readonly="true" styleClass="inputTextWording2" id="user_ip" value="#{userRolesBB.ipAddress}">
												</h:inputText>
												</td>
											</tr>
											<tr>
											<td class="instance" ><h:outputLabel value="#{msg.userParam_userBankCode}" /></td>
											<td ><h:selectOneMenu disabled="true"
												value="#{userRolesBB.userBankCode}" >
												<f:selectItem  itemValue="" />
												<f:selectItems  value="#{applicationLists.bankListSI}" />
												</h:selectOneMenu>
											</td>
											<td class="instance" ><h:outputLabel value="#{msg.userParam_userBranchCode}" /></td>
											<td ><h:selectOneMenu disabled="true" id="branchSelectOneMenu" value="#{userRolesBB.userBranchCode}" >
												<f:selectItem  itemValue="" />
												<f:selectItems  value="#{applicationLists.brachListSI}" />
												</h:selectOneMenu></td>
										</tr>
										</table></a4j:outputPanel></td></tr>
								</tbody>
							</table>
							</td>
					</tr>
				<tr>
					<td>
					<table width="100%">
						<tr>
							<td>
							<table class="tile" width="100%">
								<thead>
									<tr>
										<td class="title"><h:outputLabel
											value="#{msg.userRoles_role}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<table width="100%">
											<tr>
												<td class="instance" width="20%"><h:outputLabel value="#{msg.Gen_Type}" /></td>
												<td width="30%">
													<h:selectOneRadio styleClass="panelRadio" value="#{userRolesBB.roleType}">
													<f:selectItem itemLabel="#{msg.Gen_Group}" itemValue="G"/>
													<f:selectItem itemLabel="#{msg.Gen_Role}" itemValue="R"/>
													<a4j:support action="#{userRolesBB.reload}" event="onchange" ajaxSingle="true" reRender="rolesInfos" ></a4j:support>
													</h:selectOneRadio>
												</td>
												<td></td>
												<td></td>
										
											</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
										<a4j:outputPanel id="rolesInfos">
										<table width="100%">
											<tr>
												<td width="14%"></td>
												<td class="instance" width="10%"><h:outputLabel
													value="#{msg.userRoles_roleList}"/></td>
												<td width="19%"></td>
												<td align="left" width="57%"><STRONG><h:outputLabel
													value="#{msg.userRoles_assignedList}"/></STRONG></td>
											</tr>
											</table>
											<table width="100%">
											<tr>
												<td width="19%"></td>
												<td align="left" width="51%">
												<rich:pickList
													value="#{userRolesBB.listValuesRoles}"
													binding="#{userRolesBB.userRolesPickList}"
													id="pickListRoles" sourceListWidth="220" targetListWidth="220" listsHeight="200px">

													<f:selectItems binding="#{userRolesBB.uiSelectedItems}"
														value="#{userRolesBB.userRolelistSI}" />
													<a4j:support event="onlistchanged" actionListener="#{userRolesBB.updatePickList}" />
													
												</rich:pickList>  
												</td>
												<td width="30%"></td>
											</tr>


										</table></a4j:outputPanel>
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
									<td width="60%">&nbsp;</td>
									<td><h:commandButton value="Back"
										action="#{userRolesBB.back}"
										image="../../images/button_back.png"></h:commandButton></td>
										
									<td><a4j:commandButton immediate="true" value="Validate"
										action="#{userRolesBB.valider}"
										image="../../images/button_validate.png"
										reRender="poll2,validatePanel,msg"
											limitToList="true"
										status="status_validate"
										></a4j:commandButton></td>
										
										<a4j:poll id="poll2" ajaxSingle="true" oncomplete="Richfaces.hideModalPanel('validatePanel')" interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true" reRender="validatePanel" limitToList="true"/>
								</tr>
								<h:outputText value="#{bankEpsBackingBean.alertMsg}" 
									escape="false" rendered="#{bankEpsBackingBean.render}" />
							</table>

							</td>
						</tr>
</table></td></tr></table></td></tr></table></td></tr></table></td></tr></table>
	</h:form>
	</body>
</f:view>

</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../../commun/taglibs.jsp"%>
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
										value="Group Roles" /></td>
									<td width="40%" align="right"><h:outputText
										value="Management" /></td>
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
											value="#{msg.Gen_Select_Group}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%" >
											<tr>
											
												<td class="instance" width="20%"><h:outputLabel
													value="#{msg.Gen_Group}" /></td>
												<td width="30%"><h:selectOneMenu value="#{groupRolesBB.groupName}"
													id="selectOneMenu" valueChangeListener="#{groupRolesBB.fireUserRoles}"
													immediate="true">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
													<f:selectItems value="#{groupRolesBB.grouplistSI}"/>
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
													action="#{groupRolesBB.Refresh}"
													image="../../images/button_refresh.png"></h:commandButton></td>
												<td align="left" width="20%"><h:commandButton value="Search"
													action="#{groupRolesBB.searchRoles}"
													image="../../images/button_search.png"></h:commandButton></td>
												</tr>
												</table>
											</td></tr>	
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
											value="Add Group" /></td>
								</tr>
							</thead>
						</table>
						<table width="100%" class="tile">
							<tr>
								<td class="instance" width="20%" ><h:outputLabel value="Group name" /></td>
								<td width="30%"><h:inputText maxlength="30" size="30" styleClass="inputTextWording2" id="user_ip" value="#{groupRolesBB.groupName}">
										</h:inputText>
								</td>
								<td width="20%"></td>
								<td width="30%"></td>
							</tr>
							<tr>
												<td colspan="4">
												<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><a4j:commandButton value="Add"
																action="#{groupRolesBB.AddRecord}"
																image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
																reRender="poll2,validatePanel,msg"
																status="status_validate"
																rendered="true" >
																</a4j:commandButton>
												</td>
												<td align="left" width="20%"><a4j:commandButton value="Delete"
                    										oncomplete="Richfaces.showModalPanel('deletePanel')"
															image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
															reRender="poll2,validatePanel,msg"
															status="status_validate"
											 				rendered="true">
														</a4j:commandButton>
												</td>
												</tr>
												</table>
											</td></tr>
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
													value="#{groupRolesBB.listValuesRoles}"
													binding="#{groupRolesBB.groupRolesPickList}"
													id="pickListRoles" sourceListWidth="220" targetListWidth="220" listsHeight="200px">

													<f:selectItems binding="#{groupRolesBB.uiSelectedItems}"
														value="#{applicationLists.epsHabilitationParamSI}" />
													<a4j:support event="onlistchanged" actionListener="#{groupRolesBB.updatePickList}" />
													
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
										action="#{groupRolesBB.back}"
										image="../../images/button_back.png"></h:commandButton></td>
										
									<td><a4j:commandButton immediate="true" value="Validate"
										action="#{groupRolesBB.valider}"
										image="../../images/button_validate.png"
										reRender="poll2,validatePanel,msg"
										status="status_validate"
										></a4j:commandButton></td>
										
										<a4j:poll id="poll" ajaxSingle="true"
										action="#{groupRolesBB.searchRoles}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="true"
										reRender="validatePanel" limitToList="true" />
										
										<a4j:poll id="poll2" ajaxSingle="true" oncomplete="Richfaces.hideModalPanel('validatePanel')" interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true" reRender="validatePanel" limitToList="true"/>
								</tr>
								<h:outputText value="#{bankEpsBackingBean.alertMsg}" 
									escape="false" rendered="#{bankEpsBackingBean.render}" />
							</table>

							</td>
						</tr>
</table></td></tr></table>
</td></tr></tbody></table></td></tr></table>
</td></tr></table></td></tr></table>
	</h:form>
	</body>
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
							value="#{msg.Gen_yes}" action="#{groupRolesBB.delete}"
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
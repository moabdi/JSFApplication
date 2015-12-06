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
	<h:form id="myForm">
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
											value="#{msg.GEN_EPS_ADMINISTRATION_MESSAGE}" /></td>
										<td width="46%" align="right"><h:outputText
											value="#{msg.EPS_ADMINISTRATION_MESSAGE_ADD}"
											rendered="#{epsAdministrationMessageBB.addStatus}" /> <h:outputText
											value="#{msg.EPS_ADMINISTRATION_MESSAGE_MODIFY}"
											rendered="#{epsAdministrationMessageBB.modifyStatus}" /></td>
										<td>&nbsp;</td>
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
								<table class="tile" width="100%">
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


													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.User_code}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:selectOneMenu id="userCode"
													disabled="#{epsAdministrationMessageBB.modifyStatus}"
														value="#{epsAdministrationMessageBB.userCode}" required="true"
													requiredMessage="#{msg.User_code} #{msg.Gen_required}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{epsAdministrationMessageBB.userlistSI}" />
														<rich:ajaxValidator event="onblur" />
													</h:selectOneMenu>
													<rich:message for="userCode" styleClass="warnningMessage" />
													</td>


													<td class="instance" width="20%"><h:outputText
														value="#{msg.GEN_SUBJECT}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:inputText id="subject"
														autocomplete="off" required="true"
													requiredMessage="#{msg.GEN_SUBJECT} #{msg.Gen_required}"
														value="#{epsAdministrationMessageBB.subject}"
														disabled="#{epsAdministrationMessageBB.modifyStatus}">
														<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="subject" styleClass="warnningMessage" />
													</td>


												</tr>
												<tr>
													<td>&nbsp;</td>
												</tr>

											</table>
											<table class="tile" width="100%">
												<thead>
													<tr style="height: 13px;">
														<td class="title"><h:outputLabel
															value="#{msg.Gen_Details}" /></td>
													</tr>
												</thead>
											</table>

											<table class="tile" width="100%">

												<tr>
													<td class="instance" width="20%"><h:outputText
														value="#{msg.GEN_MESSAGE_DATE}" /></td>
													<td width="30%"><rich:calendar
														value="#{epsAdministrationMessageBB.messageDate}" id="messageDate">
													</rich:calendar>
													</td>

													<td class="instance" width="20%"><h:outputText
														value="#{msg.Gen_priority}" /></td>
													<td width="30%"><h:selectOneMenu
														id="prioritySelectOneMenu"
														value="#{epsAdministrationMessageBB.priority}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItem itemLabel="High" itemValue="H" />
														<f:selectItem itemLabel="Normal" itemValue="N" />
														<f:selectItem itemLabel="Low" itemValue="L" />
													</h:selectOneMenu>
													</td>


												</tr>
												
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
												
													<td class="instance"><h:outputText
														value="#{msg.GEN_MESSAGE_NUMBER}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:inputText id="messageNumber"
														autocomplete="off"
														value="#{epsAdministrationMessageBB.messageNumber}"
														disabled="#{epsAdministrationMessageBB.modifyStatus}">

													</h:inputText></td>


												</tr>
												
											</table>

											<table class="tile" width="100%">

												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputText
														value="#{msg.userParam_Details}" /></td>
													<td width="80%">
													<h:inputTextarea id="details" value="#{epsAdministrationMessageBB.details}">
													</h:inputTextarea></td>

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
				</table>
				</td>
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
									actionListener="#{epsAdministrationMessageBB.checkChanges}"
									action="#{epsAdministrationMessageBB.back}"									
									reRender="poll,validatePanel,msg" immediate="true"
									oncomplete="#{epsAdministrationMessageBB.backPanel}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"></a4j:commandButton></td>

								<td><h:commandButton value="Refresh" immediate="true"
									action="#{epsAdministrationMessageBB.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{epsAdministrationMessageBB.addStatus}">
								</h:commandButton> <a4j:commandButton value="Delete" 
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{epsAdministrationMessageBB.modifyStatus}">
								</a4j:commandButton></td>
								<td><a4j:commandButton value="Validate" onclick="vModif='allBean,exit';"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{epsAdministrationMessageBB.addStatus}"
									action="#{epsAdministrationMessageBB.valider}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate">

								</a4j:commandButton> <a4j:commandButton value="Modify" onclick="vModif='allBean,exit';"
									action="#{epsAdministrationMessageBB.modify}"
									reRender="poll2,poll,validatePanel,msg" 
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{epsAdministrationMessageBB.modifyStatus}">
								</a4j:commandButton> <a4j:region>

									<a4j:poll id="poll" ajaxSingle="true"
										action="#{epsAdministrationMessageSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="#{epsAdministrationMessageBB.pollEnabled}"
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


						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}"
							action="#{epsAdministrationMessageSearchBB.back}"
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

						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}"
							action="#{epsAdministrationMessageBB.delete}"
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
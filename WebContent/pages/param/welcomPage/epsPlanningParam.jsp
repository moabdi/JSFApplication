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
											value="#{msg.Gen_Eps_Planning}" /></td>
										<td width="46%" align="right"><h:outputText
											value="#{msg.Gen_Eps_Planning_Add}"
											rendered="#{epsPlanningBB.addStatus}" /> <h:outputText
											value="#{msg.Gen_Eps_Planning_Modify}"
											rendered="#{epsPlanningBB.modifyStatus}" /></td>
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
													<td>&nbsp;</td>
												</tr>
												<tr>

													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.User_code}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%">
													<h:selectOneMenu id="userCode" disabled="#{epsPlanningBB.modifyStatus}"
														value="#{epsPlanningBB.userCode}" required="true"
													requiredMessage="#{msg.User_code} #{msg.Gen_required}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{epsPlanningBB.userlistSI}" />
														<rich:ajaxValidator event="onblur" />
													</h:selectOneMenu>
													<rich:message for="userCode" styleClass="warnningMessage" />
													</td>


													<td class="instance" width="20%"><h:outputText
														value="#{msg.GEN_SUBJECT}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:inputText id="subject"
														autocomplete="off" value="#{epsPlanningBB.subject}"
														disabled="#{epsPlanningBB.modifyStatus}" required="true"
													requiredMessage="#{msg.GEN_SUBJECT} #{msg.Gen_required}">
														<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="subject" styleClass="warnningMessage" />
													</td>

												</tr>

												<tr>
													<td class="instance" width="20%"><h:outputText value="#{msg.Gen_startDate}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%">
													<rich:calendar required="true"
													requiredMessage="#{msg.Gen_startDate} #{msg.Gen_required}" value="#{epsPlanningBB.startDate}"id="startDate">
													<rich:ajaxValidator event="onchanged" />
													</rich:calendar>
													<rich:message for="startDate" styleClass="warnningMessage" />
													</td>

													<td class="instance" width="20%">
													<h:outputText value="#{msg.Gen_endDate}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" />
														</td>
													<td width="30%">
													<rich:calendar required="true"
													requiredMessage="#{msg.Gen_endDate} #{msg.Gen_required}" value="#{epsPlanningBB.endDate}" id="endDate">
													<rich:ajaxValidator event="onchanged" />
													</rich:calendar>
													<rich:message for="endDate" styleClass="warnningMessage" />
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
								<td><a4j:commandButton value="Back" immediate="true"
									actionListener="#{epsPlanningBB.checkChanges}"
									action="#{epsPlanningBB.back}"
									oncomplete="#{epsPlanningBB.backPanel}"																											
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"></a4j:commandButton></td>


								<td><h:commandButton value="Refresh" immediate="true"
									action="#{epsPlanningBB.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{epsPlanningBB.addStatus}">
								</h:commandButton> <a4j:commandButton value="Delete"
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{epsPlanningBB.modifyStatus}">
								</a4j:commandButton></td>
								<td><a4j:commandButton value="Validate" onclick="vModif='allBean,exit';"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{epsPlanningBB.addStatus}"
									action="#{epsPlanningBB.valider}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate">

								</a4j:commandButton> <a4j:commandButton value="Modify"
									action="#{epsPlanningBB.modify}" onclick="vModif='allBean,exit';"
									reRender="poll2,poll,validatePanel,msg" 
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{epsPlanningBB.modifyStatus}">
								</a4j:commandButton> <a4j:region>

									<a4j:poll id="poll" ajaxSingle="true"
										action="#{epsPlanningSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="#{epsPlanningBB.pollEnabled}"
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

				<table width=100% class="tile" align="center">
					<tr style="height: 30px;">


						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}"
							action="#{epsPlanningSearchBB.back}"
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
							action="#{epsPlanningBB.delete}"
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
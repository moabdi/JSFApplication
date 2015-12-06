<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<f:view locale="#{userContext.userLocale}">

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
										<td width="54%" align="left"><h:outputLabel
											value="#{msg.Gen_Eps_Planning}" /></td>
										<td width="5%">&nbsp;</td>
										<td width="40%" align="right"><h:outputLabel
											value="#{msg.Gen_Search_Parameters}" /></td>
										<td width="1%">&nbsp;</td>
									</tr>

								</table>
								</td>
							</tr>
						</table>
						</td>

					</tr>
					<tr>
						<td valign="top" class="zoneTravail"><h:messages id="msg"
							showDetail="true" showSummary="false"  infoClass="infoMessage"
							errorClass="errorMessage" /></td>
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
												value="#{msg.Gen_Criteria}" /></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
											<table width="100%">
												<tr>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.User_code}" /></td>
													<td width="30%"><h:selectOneMenu id="userCode"
														value="#{epsPlanningSearchBB.userCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.userNameListSI}" />
													</h:selectOneMenu></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.GEN_SUBJECT}" /></td>
													<td width="30%"><h:inputText id="subject"
														autocomplete="off"
														value="#{epsPlanningSearchBB.subject}"
														></h:inputText></td>
												</tr>

											
											</table>
											<table width="100%">
												<tr>
													<td width="60%"></td>
													<td align="left"><br>
													<h:commandButton value="Refresh"
														action="#{epsPlanningSearchBB.refresh}"
														image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
													<td align="left"><br>
													<h:commandButton value="Search"
														action="#{epsPlanningSearchBB.search}"
														image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
												</tr>
											</table>
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

						<table width="100%" id="details_table">
							<tr>
								<td>
								<table class="tile">
									<thead>
										<tr>
											<td class="title"><h:outputLabel
												value="#{msg.Gen_Search_Results}"></h:outputLabel></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td align="center">
											<table width="100%" align="center">
												<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
													frame="above" cellspacing="3">
													<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
														<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
															value="#{epsPlanningSearchBB.criteria}"
															var="event"
															binding="#{epsPlanningSearchBB.datable}"
															sortMode="single" styleClass="tiletable"
															captionStyle="tiletable" columnClasses="tiletable"
															rowClasses="tiletable" columnsWidth="25%"
															headerClass="tiletable" width="100%" frame="above"
															reRender="ds">
															
															
															<rich:column sortBy="#{event.id.subject}"
																filterBy="#{event.id.subject}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.GEN_SUBJECT}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{epsPlanningSearchBB.selectId}"
																	action="#{epsPlanningSearchBB.forwardModify}">
																	<h:inputText styleClass="inputTextLink"
																		autocomplete="off" value="#{event.id.subject}" />
																</h:commandLink>
															</rich:column>

															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.id.userCode}"
																filterBy="#{event.id.userCode}" filterEvent="onblur"
																width="30">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.User_code}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{epsPlanningSearchBB.selectId}"
																	action="#{epsPlanningSearchBB.forwardModify}">
																	<h:selectOneMenu  disabled="true" styleClass="Fixed" value="#{event.id.userCode}">
																		<f:selectItem itemLabel=""	itemValue="" />
																		<f:selectItems value="#{applicationLists.userNameListSI}" />
																		</h:selectOneMenu>
																</h:commandLink>
															</rich:column>

															<rich:column sortBy="#{event.startDate}"
																filterBy="#{event.startDate}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_startDate}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2"
																	readonly="true" value="#{event.startDate}" />

															</rich:column>

																<rich:column sortBy="#{event.endDate}"
																filterBy="#{event.endDate}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_endDate}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2"
																	readonly="true" value="#{event.endDate}" />

															</rich:column>

														</rich:dataTable>



													</rich:panel>

												</h:panelGrid>
												
											</table>
											</td>
										</tr>

									</tbody>
								</table>
								</td>
							</tr>


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{epsPlanningSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"></h:commandButton></td>

									<td align="left"><h:commandButton value="Add"
										action="#{epsPlanningSearchBB.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText
										value="#{epsPlanningSearchBB.alertMsg}"
										escape="false"
										rendered="#{epsPlanningSearchBB.render}" />
								</tr>

							</table>

						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
	</h:form>
	</body>
</f:view>
</html>

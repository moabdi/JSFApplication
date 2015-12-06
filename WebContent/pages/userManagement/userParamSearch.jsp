<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="../../commun/taglibs.jsp"%>
<f:view locale="#{userContext.userLocale}">
	<html>

	<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link rel="stylesheet" href="../../charte/css/eps.css" type="text/css">
	</head>
	<body class="body">
<h:form>
<%@ include file="/commun/header.jsp"%>
</h:form>
	<a4j:form>
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
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.userParam_searchUser}" /></td>
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
										<td class="title"><h:outputText
											value="#{msg.Gen_Criteria}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%">
											<tr>
												<td class="instance"><h:outputText
													value="#{msg.userParam_userCode}" /></td>
												<td><h:inputText id="user_code"
													value="#{userParamSearchBB.userCode}">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="user_code" styleClass="warnningMessage" />
												</td>
												<td class="instance"><h:outputText
													value="#{msg.userParam_userName}" /></td>
												<td><h:inputText value="#{userParamSearchBB.userName}"></h:inputText></td>
											<tr>
											<tr>
												<td></td>
												<td></td>
												<td align="right"><h:commandButton value="Refresh"
													action="#{userParamSearchBB.Refresh}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="center"><h:commandButton value="Search"
													action="#{userParamSearchBB.search}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
											</tr>
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
										<td class="title"><h:outputText
											value="#{msg.Gen_Details}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td  >
										<table width="100%">
											<tr>
												<td align="center">
													<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
														frame="above" cellspacing="3">
														<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">	
														<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
															value="#{userParamSearchBB.criteria}" var="event"
															binding="#{userParamSearchBB.datable}" sortMode="single"
															styleClass="tiletable" captionStyle="tiletable"
															reRender="ds"
															columnClasses="tiletable" rowClasses="tiletable"
															headerClass="tiletable" width="100%">

															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.userCode}"
																filterBy="#{event.userCode}" filterEvent="onblur"
																styleClass="tile">

																<f:facet name="header">
																	<h:outputText  value="#{msg.userParam_userCode}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{userParamSearchBB.selectId}"
																	action="#{userParamSearchBB.forwardModify}">
																	<h:inputText  readonly="true" styleClass="inputTextLink"  value="#{event.userCode}" />
																</h:commandLink>
															</rich:column>

															<rich:column sortBy="#{event.userName}"
																filterBy="#{event.userName}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.userParam_userName}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{userParamSearchBB.selectId}"
																	action="#{userParamSearchBB.forwardModify}">
																	<h:inputText  readonly="true" styleClass="inputTextWording2"  value="#{event.userName}" />
																</h:commandLink>

															</rich:column>

															<rich:column sortBy="#{event.userType}"
																filterBy="#{event.userType}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.userParam_userType}" />
																</f:facet>

																<h:selectOneMenu value="#{event.userType}"
																	disabled="true">
																	<f:selectItem itemLabel="" itemValue="" />
																	<f:selectItem itemLabel="Supervisor" itemValue="S" />
																	<f:selectItem itemLabel="Operator" itemValue="O" />
																</h:selectOneMenu>



															</rich:column>

															<rich:column sortBy="#{event.userBranchCode}"
																filterBy="#{event.userBranchCode}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.userParam_userBranchCode}" />
																</f:facet>

																<h:selectOneMenu value="#{event.userBranchCode}"
																	 disabled="true">
																	<f:selectItem itemValue="#{event.userBranchCode}" />
																	<f:selectItems value="#{applicationLists.brachListSI}"/>
																</h:selectOneMenu>
															</rich:column>


															<rich:column sortBy="#{event.userBankCode}"
																filterBy="#{event.userBankCode}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.userParam_userBankCode}" />
																</f:facet>

																<h:selectOneMenu value="#{event.userBankCode}"
																	immediate="true" disabled="true">
																	<f:selectItem itemValue="#{event.userBankCode}" />
																	<f:selectItems value="#{applicationLists.bankListSI}"/>
																</h:selectOneMenu>
															</rich:column>



															<rich:column sortBy="#{event.connected}"
																filterBy="#{event.connected}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.userParam_connected}" />
																</f:facet>

																<h:selectOneMenu value="#{event.connected}"
																	disabled="true">
																	<f:selectItem itemLabel="Yes" itemValue="Y" />
																	<f:selectItem itemLabel="No" itemValue="N" />
																</h:selectOneMenu>



															</rich:column>



														</rich:dataTable>
														<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
														</rich:panel>
													</h:panelGrid>
												</td>
											</tr>
									</table>
							</td>
						</tr>
						<tr height="50px">

						</tr>
						<tr>
							<td>


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{userParamSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{userParamSearchBB.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{userParamSearchBB.alertMsg}"
										escape="false" rendered="#{userParamSearchBB.render}" />
								</tr>

							</table>

							</td>
						</tr>

					</table>
					</td>
	</tr></table></td></tr></table></td></tr></table></td></tr></table></a4j:form>
	</body>




	</html>
</f:view>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>
<f:view locale="#{userContext.userLocale}">
	<html>

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

			</tr>
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
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.interfaceOperationParam_interfaceParam}" /></td>
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
												<td class="instance" width="20%"><h:outputText
													value="#{msg.interfa}" /></td>
												<td width="30%"><h:selectOneMenu
													value="#{interfaceOperationSearchBB.interfaceCode}">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
													<f:selectItems value="#{applicationLists.interfaceListSI}" />


													<rich:ajaxValidator event="onblur" />
												</h:selectOneMenu> <rich:message for="interface_code"
													styleClass="warnningMessage" /></td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.oper}" /></td>
												<td width="30%"><h:inputText
													value="#{interfaceOperationSearchBB.wording}"></h:inputText></td>
											<tr>
											<tr>
												<td></td>
												<td></td>
												<td align="right"><h:commandButton value="Refresh"
													action="#{interfaceOperationSearchBB.Refresh}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="Center"><h:commandButton value="Search"
													action="#{interfaceOperationSearchBB.search}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
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
										<td class="title"><h:outputText
											value="#{msg.Gen_Details}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%" align="center">
											<tr>

												<td align="center"><h:panelGrid border="1" columns="1"
													width="#{GlobalVars.EPS_DATATABLE_SIZE}" frame="above" cellspacing="3">
													<rich:panel styleClass="tiletable"
														style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
														<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
															value="#{interfaceOperationSearchBB.criteria}"
															var="event"
															binding="#{interfaceOperationSearchBB.datable}"
															sortMode="single" styleClass="tiletable"
															captionStyle="tiletable" columnClasses="tiletable"
															rowClasses="tiletable" columnsWidth="0*"
															headerClass="tiletable" width="100%" frame="above"
															reRender="ds">

															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.id.interfaceCode}"
																filterBy="#{event.id.interfaceCode}"
																filterEvent="onblur" styleClass="tile">

																<f:facet name="header">
																	<h:outputText
																		value="#{msg.interfa}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{interfaceOperationSearchBB.selectId}"
																	action="#{interfaceOperationSearchBB.forwardModify}">
																	<h:selectOneMenu value="#{event.id.interfaceCode}"
																		disabled="true">
																		<f:selectItem itemLabel="" />
																		<f:selectItems
																			value="#{applicationLists.interfaceListSI}" />
																	</h:selectOneMenu>
																</h:commandLink>
															</rich:column>

															<rich:column sortable="true"
																sortBy="#{event.id.interfaceOperation}"
																filterBy="#{event.id.interfaceOperation}"
																filterEvent="onblur">
																<f:facet name="header">
																	<h:outputText value="#{msg.operCode}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{interfaceOperationSearchBB.selectId}"
																	action="#{interfaceOperationSearchBB.forwardModify}">
																	<h:inputText value="#{event.id.interfaceOperation}"
																		styleClass="inputTextLink" readonly="true" />
																</h:commandLink>
															</rich:column>

															<rich:column sortBy="#{event.wording}"
																filterBy="#{event.wording}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.oper}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{interfaceOperationSearchBB.selectId}"
																	action="#{interfaceOperationSearchBB.forwardModify}">
																	<h:inputText styleClass="inputTextWording2"
																		readonly="true" size="60" value="#{event.wording}" />
																</h:commandLink>

															</rich:column>


														</rich:dataTable>
														<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
													</rich:panel>

												</h:panelGrid></td>
											</tr>
										</table>
									</tr>

								</tbody>

							</table>

							</td>
						</tr>

						<tr>
							<td>


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{interfaceOperationSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{interfaceOperationSearchBB.addRecord}"
										image="../../../images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{interfaceOperationSearchBB.alertMsg}"
										escape="false" rendered="#{interfaceOperationSearchBB.render}" />
								</tr>

							</table>

							</td>
						</tr>

					</table>
					</td>
			</table>
		</table>
	</h:form>



	</body>




	</html>
</f:view>
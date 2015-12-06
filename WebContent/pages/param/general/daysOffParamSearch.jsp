<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../../../charte/css/eps.css"
	type="text/css">
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
											value="#{msg.DaysOffPar}" /></td>
										<td width="5%">&nbsp;</td>
										<td width="40%" align="right"><h:outputLabel
											value="#{msg.Gen_Search}" /></td>
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
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.countryC}" /></td>
													<td width="30%"><h:selectOneMenu
														value="#{daysOffSearchBB.countryCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.countryListSI}" />
													</h:selectOneMenu>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.dayo}" />
													<td width="30%"><rich:inputNumberSpinner value="#{daysOffSearchBB.dayOff}" minValue="1"
													maxValue="31" enableManualInput="true" step="1"></rich:inputNumberSpinner></td>
												</tr>
												<tr>
													<td colspan="4">
													<table width="100%">
														<tr>
															<td width="60%"></td>
															<td align="left"><h:commandButton
																action="#{daysOffSearchBB.Refresh}" value="Refresh"
																image="../../../images/button_refresh.png"></h:commandButton></td>
															<td align="left"><h:commandButton
																action="#{daysOffSearchBB.search}" value="Search"
																image="../../../images/button_search.png">
															</h:commandButton></td>
														</tr>
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
																	value="#{msg.Gen_Details}" /></td>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td align="center">
																<table width="100%" align="center">

																	<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
																		frame="above" cellspacing="3">
																		<rich:panel styleClass="tiletable"
																			style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
																			<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
																				value="#{daysOffSearchBB.criteria}" var="event"
																				binding="#{daysOffSearchBB.datable}"
																				sortMode="single" styleClass="tiletable"
																				captionStyle="tiletable" columnClasses="tiletable"
																				rowClasses="tiletable" columnsWidth="0*"
																				headerClass="tiletable" width="100%" frame="above"
																				reRender="ds">


																		


																				<rich:column headerClass="dataTableHeader"
																					sortable="true" sortBy="#{event.countryCode}"
																					filterBy="#{event.countryCode}"
																					filterEvent="onclick" styleClass="tile">

																					<f:facet name="header">
																						<h:outputText value="#{msg.Gen_CountryCode}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.countryCode}"
																						disabled="true">
																						<f:selectItem itemValue="" />
																						<f:selectItems
																							value="#{applicationLists.countryListSI}" />
																					</h:selectOneMenu>

																				</rich:column>


																				<rich:column sortable="true"
																					sortBy="#{event.dayOff}" filterBy="#{event.dayOff}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputLabel value="#{msg.dayo}" />
																					</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{daysOffSearchBB.selectId}"
																						action="#{daysOffSearchBB.forwardModify}">
																						<h:inputText styleClass="inputTextLink"
																							readonly="true" value="#{event.dayOff}" dir="RTL"/>
																					</h:commandLink>
																				</rich:column>

																				<rich:column sortable="true" sortBy="#{event.month}"
																					filterBy="#{event.month}" filterEvent="onblur">
																					<f:facet name="header">
																					
																						<h:outputText value="#{msg.month}" />
																					</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{daysOffSearchBB.selectId}"
																						action="#{daysOffSearchBB.forwardModify}">
																					<h:inputText   styleClass="inputTextLink" value="#{event.month}" readonly="true" dir="RTL" />
																				</h:commandLink>
																				</rich:column>


																				<rich:column sortable="true" sortBy="#{event.year}"
																					filterBy="#{event.year}" filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputLabel value="#{msg.year}" />
																					</f:facet>

																					<h:inputText
																						readonly="true" value="#{event.year}" styleClass="inputTextWording2" dir="RTL" />


																				</rich:column>



																			</rich:dataTable>
																			<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
																		</rich:panel>
																	</h:panelGrid>

																</table>
																</td>
															</tr>
														</tbody>
													</table>
													</td>
												<tr>
													<td>


													<table width="100%" class="buttonPanel">

														<tr>
															<td width="60%"></td>
															<td align="left"><h:commandButton
																action="#{daysOffSearchBB.backToWelcomPage}"
																value="Back" image="../../../images/button_back.png"
																immediate="true" /></td>
															<td align="left"><h:commandButton
																action="#{daysOffSearchBB.addRecord}" value="Add"
																image="../../../images/button_add.png" /></td>
															<h:outputText value="#{daysOffSearchBB.alertMsg}"
																escape="false" rendered="#{daysOffSearchBB.render}" />
														</tr>
													</table>
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



	</h:form>
	</body>
</f:view>
</html>
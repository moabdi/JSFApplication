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


	<a4j:form>

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
										value="#{msg.cityParam_cityParam}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.cityParam_searchCity}" /></td>
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
													value="#{msg.cityParam_CityCode}" /></td>
												<td width="30%"><h:inputText id="city_code"
													value="#{citySearchBB.cityCode}" size="5" maxlength="5">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="city_code" styleClass="warnningMessage" />
												</td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_Wording}" /></td>
												<td width="30%"><h:inputText value="#{citySearchBB.wording}"
												size="30" maxlength="30"></h:inputText></td>
											<tr>
											<tr>
												<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_Country}" /></td>
													<td width="30%"><h:selectOneMenu id="country"
														value="#{citySearchBB.countryCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.countryListSI}" />
														</h:selectOneMenu>
													</td>
											</tr>
											<tr>
												<td></td>
												<td></td>
													<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton value="Refresh"
													action="#{citySearchBB.Refresh}"
													image="../../../images/button_refresh.png"></h:commandButton></td>
												<td align="left"><h:commandButton value="Search"
													action="#{citySearchBB.search}"
													image="../../../images/button_search.png"></h:commandButton></td>
											</tr>
										</table>
								
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
												<td align="center"><h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
													frame="above" cellspacing="3">

													<rich:panel styleClass="tiletable"
														style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">

														<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
															value="#{citySearchBB.criteria}" var="event"
															binding="#{citySearchBB.datable}" sortMode="single"
															styleClass="tiletable" captionStyle="tiletable"
															columnClasses="tiletable" rowClasses="tiletable"
															headerClass="tiletable" width="100%" columnsWidth="0*">



															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.cityCode}"
																filterBy="#{event.cityCode}" filterEvent="onblur"
																styleClass="tile">

																<f:facet name="header">
																	<h:outputText value="#{msg.cityParam_CityCode}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{citySearchBB.selectId}"
																	action="#{citySearchBB.forwardModify}">
																	<h:inputText value="#{event.cityCode}"
																		styleClass="inputTextLink" dir="RTL" />
																</h:commandLink>
															</rich:column>

															<rich:column sortBy="#{event.wording}"
																filterBy="#{event.wording}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.Gen_Wording}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{citySearchBB.selectId}"
																	action="#{citySearchBB.forwardModify}">
																	<h:inputText value="#{event.wording}"
																		styleClass="inputTextWording2"  size="30"/>
																</h:commandLink>

															</rich:column>

															<rich:column sortable="true"
																sortBy="#{event.countryCode}"
																filterBy="#{event.countryCode}" filterEvent="onblur">
																<f:facet name="header">
																	<h:outputText value="#{msg.Gen_CountryCode}" />
																</f:facet>
																<h:selectOneMenu value="#{event.countryCode}"
																	disabled="true">
																	<f:selectItems
																		value="#{applicationLists.currencyListSI}" />
																</h:selectOneMenu>

															</rich:column>

														</rich:dataTable>
														<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
													</rich:panel>
													
												</h:panelGrid></td>


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
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{citySearchBB.backToWelcomPage}"
										image="../../../images/button_back.png" immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{citySearchBB.addRecord}"
										image="../../../images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{citySearchBB.alertMsg}" escape="false"
										rendered="#{citySearchBB.render}" />
								</tr>

							</table>

							</td>
						</tr>

					</table>
					</td>
	</tr></tbody></table></td></tr></table></td></tr></table></table></a4j:form></body>
	</html>
</f:view>
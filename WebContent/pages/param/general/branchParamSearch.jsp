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
										value="#{msg.branchParam_branchParam}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.branchParam_searchBranch}" /></td>
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
													value="#{msg.branchParam_BranchCode}" /></td>
												<td width="30%"><h:inputText id="branch_code"
													value="#{branchSearchBB.branchCode}" size="5" maxlength="5">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="branch_code"
													styleClass="warnningMessage" /></td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.branchParam_Wording}" /></td>
												<td width="30%"><h:inputText
													value="#{branchSearchBB.wording}" size="30" maxlength="30"></h:inputText></td>
											<tr>
											<tr>
												<td></td>
												<td></td>
												<table width="100%">
													<tr>
														<td width="60%"></td>
														<td align="left"><h:commandButton value="Refresh"
															action="#{branchSearchBB.Refresh}"
															image="../../../images/button_refresh.png"></h:commandButton></td>
														<td align="left"><h:commandButton value="Search"
															action="#{branchSearchBB.search}"
															image="../../../images/button_search.png"></h:commandButton></td>
													</tr>
												</table>
									</tr></table>
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
												<td>

												<table width="100%" align="center">

													<td align="center"><h:panelGrid border="1" columns="1"
														width="#{GlobalVars.EPS_DATATABLE_SIZE}" frame="above" cellspacing="3">
														<rich:panel styleClass="tiletable"
															style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
															<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
																value="#{branchSearchBB.criteria}" var="event"
																binding="#{branchSearchBB.datable}" sortMode="single"
																styleClass="tiletable" captionStyle="tiletable"
																columnClasses="tiletable" rowClasses="tiletable"
																columnsWidth="0*" headerClass="tiletable" width="100%"
																frame="above" reRender="ds">




																<rich:column headerClass="dataTableHeader"
																	sortable="true" sortBy="#{event.id.branchCode}"
																	filterBy="#{event.id.branchCode}" filterEvent="onblur"
																	styleClass="tile">


																	<f:facet name="header">
																		<h:outputText value="#{msg.branchParam_BranchCode}" />
																	</f:facet>
																	<h:commandLink styleClass="tableCommandLink"
																		actionListener="#{branchSearchBB.selectId}"
																		action="#{branchSearchBB.forwardModify}">
																<h:inputText value="#{event.id.branchCode}"
																styleClass="inputTextLink" readonly="true" dir="RTL"/>

																</h:commandLink>
																</rich:column>

																<rich:column sortable="true"
																	sortBy="#{event.id.bankCode}"
																	filterBy="#{event.id.bankCode}" filterEvent="onclick">
																	<f:facet name="header">
																		<h:outputText value="#{msg.Gen_bankCode}" />
																	</f:facet>
																	<h:selectOneMenu value="#{event.id.bankCode}"disabled="true">
																	<f:selectItem itemLabel=""	itemValue="" />
																	<f:selectItems value="#{applicationLists.bankListSI}" />
																	</h:selectOneMenu>

																</rich:column>


																<rich:column sortable="true" sortBy="#{event.cityCode}"
																	filterBy="#{event.cityCode}" filterEvent="onblur">
																	<f:facet name="header">
																		<h:outputText value="#{msg.cityParam_CityCode}" />
																	</f:facet>
																	<h:selectOneMenu disabled="true" value="#{event.cityCode}">
																	<f:selectItem itemLabel=""	itemValue="" />
																	<f:selectItems value="#{applicationLists.cityListSI}"/>
																	</h:selectOneMenu>
																	
																</rich:column>

																<rich:column sortable="true"
																	sortBy="#{event.countryCode}"
																	filterBy="#{event.countryCode}" filterEvent="onblur">
																	<f:facet name="header">
																		<h:outputText value="#{msg.countryC}" />
																	</f:facet>
																	<h:selectOneMenu value="#{event.countryCode}" disabled="true">
																		<f:selectItem itemLabel=""	itemValue="" />
																		<f:selectItems value="#{applicationLists.countryListSI}" />
																	</h:selectOneMenu>
																</rich:column>








																<rich:column sortBy="#{event.wording}"
																	filterBy="#{event.wording}" filterEvent="onblur"
																	sortable="true">
																	<f:facet name="header">
																		<h:outputText value="#{msg.branchParam_Wording}" />
																	</f:facet>
																	<h:commandLink styleClass="tableCommandLink"
																		actionListener="#{branchSearchBB.selectId}"
																		action="#{branchSearchBB.forwardModify}">
																		<h:inputText value="#{event.wording}"
																			styleClass="inputTextLink" readonly="true" />
																	</h:commandLink>

																</rich:column>

																<rich:column sortable="true"
																	sortBy="#{event.daysBeforeRenew}"
																	filterBy="#{event.daysBeforeRenew}"
																	filterEvent="onblur">
																	<f:facet name="header">
																		<h:outputText value="Days Before" />
																	</f:facet>
																	<h:inputText value="#{event.daysBeforeRenew}" styleClass="inputTextWording2"  readonly="true"  dir="RTL"/>
																</rich:column>


																<rich:column sortable="true"
																	sortBy="#{event.bankLocation}"
																	filterBy="#{event.bankLocation}" filterEvent="onblur">
																	<f:facet name="header">
																		<h:outputText value="#{msg.Gen_bankLocation}" />
																	</f:facet>
																	<h:inputText value="#{event.bankLocation}" styleClass="inputTextWording2"  readonly="true"  />

																</rich:column>




																<rich:column sortable="true" sortBy="#{event.address}"
																	filterBy="#{event.address}" filterEvent="onblur">
																	<f:facet name="header">
																		<h:outputText value="Address" />
																	</f:facet>
																	<h:inputText value="#{event.address}"  styleClass="inputTextWording2"  readonly="true" size="100" />
																</rich:column>


																<rich:column sortable="true" sortBy="#{event.zipCode}"
																	filterBy="#{event.zipCode}" filterEvent="onblur">
																	<f:facet name="header">
																		<h:outputText value="Zip Code" />
																	</f:facet>
																	<h:inputText value="#{event.zipCode}"  styleClass="inputTextWording2"  dir="RTL" readonly="true" />
																</rich:column>



															</rich:dataTable>
															<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
														</rich:panel>
													</h:panelGrid></td>

												</table>
												</td>
											</tr>


										</table>
										</td>
									</tr>

									<tr>
										<td>


										<table width="100%" class="buttonPanel">

											<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton value="Back"
													action="#{branchSearchBB.backToWelcomPage}"
													image="../../../images/button_back.png" immediate="true"></h:commandButton></td>
												<td align="left"><h:commandButton value="Add"
													action="#{branchSearchBB.addRecord}"
													image="../../../images/button_add.png"></h:commandButton></td>
												<h:outputText value="#{branchSearchBB.alertMsg}"
													escape="false" rendered="#{branchSearchBB.render}" />
											</tr>

										</table>

										</td>
									</tr>
							</table>
							</td>
		</tr></table></td></tr></table></td></tr></table></table></a4j:form></body>
	</html>
</f:view>
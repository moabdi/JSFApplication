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
										value="#{msg.terminalBrand_table}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.terminalBrand_search}" /></td>
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
										<td class="title">Cretiria</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%">
											<tr>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.terminalBrand_branCode}" /></td>
												<td width="30%"><h:inputText id="processing_code"
													value="#{terminalBrandSearchBB.brandCode}" size="2" maxlength="2">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="processing_code"
													styleClass="warnningMessage" /></td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.terminalBrand_brandName}" /></td>
												<td width="30%"><h:inputText value="#{terminalBrandSearchBB.brandName}"
												size="32" maxlength="32"></h:inputText></td>
											</tr>
											<tr>
												
												<table width="100%">
													<tr>
														<td width="60%"></td>
														<td align="left"><h:commandButton value="Refresh"
															action="#{terminalBrandSearchBB.Refresh}"
															image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
														<td align="left"><h:commandButton value="Search"
															action="#{terminalBrandSearchBB.search}"
															image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>

													</tr>
												</table>
												
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
										<td class="title"><h:outputText	value="#{msg.Gen_Details}" /></td>
									</tr>
								</thead>

								<tr>
									<td align="center">
									<table width="100%" align="center">
										<tr>
											<td align="center"><h:panelGrid border="1" columns="1"
												width="#{GlobalVars.EPS_DATATABLE_SIZE}" frame="above" cellspacing="3">

												<rich:panel styleClass="tiletable"
													style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">


													<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
														value="#{terminalBrandSearchBB.criteria}" var="event"
														binding="#{terminalBrandSearchBB.datable}"
														sortMode="single" styleClass="tiletable"
														captionStyle="tiletable" columnClasses="tiletable"
														rowClasses="tiletable" columnsWidth="0*"
														headerClass="tiletable" width="100%" frame="above"
														reRender="ds">

														<rich:column headerClass="dataTableHeader" sortable="true"
															sortBy="#{event.id.brandCode}" filterBy="#{event.id.brandCode}"
															filterEvent="onblur" styleClass="tile">

															<f:facet name="header">
																<h:outputText value="#{msg.terminalBrand_branCode}" />
															</f:facet>
															<h:commandLink styleClass="tableCommandLink"
																actionListener="#{terminalBrandSearchBB.selectId}"
																action="#{terminalBrandSearchBB.forwardModify}">
																<h:inputText value="#{event.id.brandCode}"
																	styleClass="inputTextLink" readonly="true" />
															</h:commandLink>
															</rich:column>

														<rich:column sortBy="#{event.brandName}"
															filterBy="#{event.brandName}" filterEvent="onblur"
															sortable="true">
															<f:facet name="header">
																<h:outputText value="#{msg.terminalBrand_brandName}" />
															</f:facet>
															<h:commandLink styleClass="tableCommandLink"
																actionListener="#{terminalBrandSearchBB.selectId}"
																action="#{terminalBrandSearchBB.forwardModify}">
																<h:inputText value="#{event.brandName}" styleClass="inputTextLink" readonly="true" />
															</h:commandLink>
														</rich:column>
														
														<rich:column sortable="true" sortBy="#{event.id.entity}"
															filterBy="#{event.id.entity}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.terminalBrand_entity}" />
															</f:facet>
															<h:inputText value="#{event.id.entity}" styleClass="inputTextWording2" readonly="true" />
														</rich:column>

														<rich:column sortable="true"
															sortBy="#{event.companyName}"
															filterBy="#{event.companyName}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText
																	value="#{msg.Gen_Company_Name}" />
															</f:facet>
															<h:inputText value="#{event.companyName}" styleClass="inputTextWording2" readonly="true" />
														</rich:column>
														
														<rich:column sortable="true" sortBy="#{event.contactName}"
															filterBy="#{event.contactName}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.Gen_Contact_name}" />
															</f:facet>
															<h:inputText value="#{event.contactName}" readonly="true" styleClass="inputTextWording2"
															 />
														</rich:column>

														<rich:column sortable="true"
															sortBy="#{event.location}"
															filterBy="#{event.location}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.Gen_location}" />
															</f:facet>
															<h:inputText value="#{event.location}"
																styleClass="inputTextWording2" readonly="true" />
														</rich:column>

														<rich:column sortable="true" sortBy="#{event.maintenancePhone}"
															filterBy="#{event.maintenancePhone}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.terminalBrand_maintePhone}" />
															</f:facet>
															<h:inputText value="#{event.maintenancePhone}"
																styleClass="inputTextWording2" readonly="true" />
														</rich:column>

														<rich:column sortable="true" sortBy="#{event.countryCode}"
															filterBy="#{event.countryCode}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.Gen_CountryCode}" />
															</f:facet>
															<h:selectOneMenu value="#{event.countryCode}" disabled="true">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems	value="#{applicationLists.currencyListSI}" />

															</h:selectOneMenu>
														</rich:column>


														<rich:column sortable="true" sortBy="#{event.maintenanceFax}"
															filterBy="#{event.maintenanceFax}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.terminalBrand_fax}" />
															</f:facet>
															<h:inputText value="#{event.maintenanceFax}"
																styleClass="inputTextWording2" readonly="true"  />
														</rich:column>

														<rich:column sortable="true" sortBy="#{event.cityCode}"
															filterBy="#{event.cityCode}" filterEvent="onblur">
															<f:facet name="header">
																<h:outputText value="#{msg.Gen_CityCode}" />
															</f:facet>
															<h:selectOneMenu value="#{event.cityCode}" disabled="true">
																<f:selectItem itemLabel=""	itemValue="" />
																<f:selectItems value="#{applicationLists.cityListSI}" />
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


							</table>
							</td>
						</tr>


						<tr>
							<td>


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{terminalBrandSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png" immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{terminalBrandSearchBB.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{terminalBrandSearchBB.alertMsg}"
										escape="false" rendered="#{terminalBrandSearchBB.render}" />
								</tr>

							</table>

							</td>
						</tr>

					</table>
					</td>
			</table>
		</table>
	</a4j:form>



	</body>




	</html>
</f:view>
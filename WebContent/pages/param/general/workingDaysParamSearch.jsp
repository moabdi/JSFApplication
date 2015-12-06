<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>
<html>
<f:view locale="#{userContext.userLocale}">
	<link rel="stylesheet" href="../../../charte/css/eps.css"
		type="text/css">

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
										value="#{msg.workingDaysParam_workingDaysParam}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
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
													value="#{msg.Gen_CountryCode}" /></td>
												<td width="30%"><h:selectOneMenu value="#{workingDaysSearchBB.countryCode}">
													<f:selectItem itemLabel="#{msg.Gen_Select}"	itemValue="%" />
													<f:selectItems value="#{applicationLists.countryListSI}" />


													<rich:ajaxValidator event="onblur" />
												</h:selectOneMenu> <rich:message for="workingDays_code"
													styleClass="warnningMessage" /></td>
												<td class="instance"></td>
												<td></td>
											<tr>
											<tr>
												<td></td>
												<td></td></tr>
												<tr>
												<td colspan="4">
												<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton value="Refresh"
													action="#{workingDaysSearchBB.Refresh}"
													image="../../../images/button_refresh.png"></h:commandButton>
												</td>

												<td align="left"><h:commandButton value="Search"
													action="#{workingDaysSearchBB.search}"
													image="../../../images/button_search.png"></h:commandButton></td>
											</tr>
										</table>
										</td>
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
										<td>
										<table width="100%" align="center">
<td align="center">
											<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
												frame="above" cellspacing="3">
												<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}" value="#{workingDaysSearchBB.criteria}" var="event"
													binding="#{workingDaysSearchBB.datable}"
													sortMode="single"
													styleClass="tiletable"
													captionStyle="tiletable" columnClasses="tiletable"
													rowClasses="tiletable"
													columnsWidth="0*"
													headerClass="tiletable" width="100%"
													frame="above" reRender="ds">



													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.countryCode}"
														filterBy="#{event.countryCode}" filterEvent="onclick"
														styleClass="tile">

														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Country}" />
														</f:facet>
														<h:commandLink styleClass="tableCommandLink"
															actionListener="#{workingDaysSearchBB.selectId}"
															action="#{workingDaysSearchBB.forwardModify}">
															<h:inputText value="#{event.countryCode}" styleClass="inputTextLink" readonly="true" dir="RTL" />
													
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.countryListSI}" 
															/>
										
														</h:commandLink>
													</rich:column>


													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.countryCode}"
														filterBy="#{event.countryCode}" filterEvent="onclick"
														styleClass="tile">

														<f:facet name="header">
															<h:outputText value="#{msg.Gen_CountryCode}" />
														</f:facet>
														<h:selectOneMenu value="#{event.countryCode}" disabled="true">
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.countryListSI}" 
															/>
															</h:selectOneMenu>
										
													</rich:column>

													<rich:column sortBy="#{event.monday}"
														filterBy="#{event.monday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Monday}" />
														</f:facet>
														<h:selectOneMenu value="#{event.monday}" disabled="true">
															
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>

													<rich:column sortBy="#{event.tuesday}"
														filterBy="#{event.tuesday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Tuesday}" />
														</f:facet>
														<h:selectOneMenu value="#{event.tuesday}" disabled="true">
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>

													<rich:column sortBy="#{event.wednesday}"
														filterBy="#{event.wednesday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Wednesday}" />
														</f:facet>
														<h:selectOneMenu value="#{event.wednesday}" disabled="true">
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>

													<rich:column sortBy="#{event.thursday}"
														filterBy="#{event.thursday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Thursday}" />
														</f:facet>
													<h:selectOneMenu value="#{event.thursday}" disabled="true">
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>

													<rich:column sortBy="#{event.friday}"
														filterBy="#{event.friday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Friday}" />
														</f:facet>
														<h:selectOneMenu value="#{event.friday}" disabled="true">
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>


													<rich:column sortBy="#{event.saturday}"
														filterBy="#{event.saturday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Saturday}" />
														</f:facet>
														<h:selectOneMenu value="#{event.saturday}" disabled="true">
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>

													<rich:column sortBy="#{event.sunday}"
														filterBy="#{event.sunday}" filterEvent="onclick"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Sunday}" />
														</f:facet>
														<h:selectOneMenu value="#{event.sunday}" disabled="true">
															<f:selectItem itemValue="Y" itemLabel="#{msg.Gen_yes}" />
															<f:selectItem itemValue="N" itemLabel="#{msg.Gen_no}" />
														</h:selectOneMenu>

													</rich:column>
												</rich:dataTable>
												<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
											</rich:panel>
											</h:panelGrid>
											</td>
											
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
										action="#{workingDaysSearchBB.backToWelcomPage}"
										image="../../../images/button_back.png" immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{workingDaysSearchBB.addRecord}"
										image="../../../images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{workingDaysSearchBB.alertMsg}"
										escape="false" rendered="#{workingDaysSearchBB.render}" />
								</tr>

							</table>
</td></tr></table></td></tr></table>
</td></tr></table></table>
</h:form>

	</body>



</f:view>
</html>
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
											value="#{msg.Gen_Cross_Rate}" /></td>
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
														value="#{msg.BankCode}" /></td>
													<td width="30%"><h:selectOneMenu
														value="#{CrossRateSearchBB.bankCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.bankListSI}" />
													</h:selectOneMenu></td>
													<td class="instance" width="20%"><h:outputText
														value="#{msg.networcode}" /></td>
													<td width="30%"><h:selectOneMenu
														value="#{CrossRateSearchBB.networkCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.networkListSI}" />
													</h:selectOneMenu></td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td></td>
												</tr>
												<tr>
													<td colspan="4">
													<table width="100%">
														<tr>
															<td width="60%"></td>
															<td align="left"><h:commandButton action="#{CrossRateSearchBB.Refresh}" value="Refresh"
												image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="left"><h:commandButton action="#{CrossRateSearchBB.search}" value="Search"
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
																				value="#{CrossRateSearchBB.criteria}" var="event"
																				binding="#{CrossRateSearchBB.datable}"
																				sortMode="single" styleClass="tiletable"
																				captionStyle="tiletable" columnClasses="tiletable"
																				rowClasses="tiletable" columnsWidth="0*"
																				headerClass="tiletable" width="100%" frame="above"
																				reRender="ds">
																				
																				<rich:column sortable="true"
																					sortBy="#{event.id.bankCode}"
																					filterBy="#{event.id.bankCode}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.BankCode}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.id.bankCode}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue=""/>
																						<f:selectItems value="#{applicationLists.bankListSI}" />
																					</h:selectOneMenu>
																				</rich:column>

																				<rich:column sortable="true"
																					sortBy="#{event.id.networkCode}"
																					filterBy="#{event.id.networkCode}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.Gen_Network}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.id.networkCode}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue=""/>
																						<f:selectItems value="#{applicationLists.networkListSI}" />
																					</h:selectOneMenu>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.id.originCurrency}"
																					filterBy="#{event.id.originCurrency}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.orgcurrency}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.id.originCurrency}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue=""/>
																						<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
																					</h:selectOneMenu>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.id.destinationCurrency}"
																					filterBy="#{event.id.destinationCurrency}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.destcu}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.id.destinationCurrency}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue=""/>
																						<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
																					</h:selectOneMenu>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.bayingRate}"
																					filterBy="#{event.bayingRate}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.Byrt}" />
																					</f:facet>
																				
																					<h:inputText value="#{event.bayingRate}" dir="RTL"
																						readonly="true"  styleClass="inputTextWording2" />
																					
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.cellingRate}"
																					filterBy="#{event.cellingRate}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.cellrt}" />
																					</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{CrossRateSearchBB.selectId}"
																						action="#{CrossRateSearchBB.forwardModify}">
																						<h:inputText value="#{event.cellingRate}"
																							 styleClass="inputTextWording2" readonly="true" dir="RTL" />
																					</h:commandLink>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.id.flowConversion}"
																					filterBy="#{event.id.flowConversion}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.flowcnv}" />
																					</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{CrossRateSearchBB.selectId}"
																						action="#{CrossRateSearchBB.forwardModify}">
																					<h:inputText value="#{event.libelle}"
																							readonly="true"  styleClass="inputTextLink" />
																					</h:commandLink>
																				</rich:column>
																				
																				<rich:column sortable="true"
																					sortBy="#{event.id.rateDate}"
																					filterBy="#{event.id.rateDate}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.RtDate}" />
																					</f:facet>
																					<h:inputText styleClass="inputTextWording2" readonly="true" 
																					value="#{event.id.rateDate}" >
																					<f:convertDateTime pattern="dd/MM/yyyy"/></h:inputText>
																				</rich:column>
																				
																				</rich:dataTable>																			
																				<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
															</rich:panel></h:panelGrid></table>
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
															<td align="left"><h:commandButton
																action="#{CrossRateSearchBB.backToWelcomPage}"
																value="Back" image="../../../images/button_back.png"
																immediate="true"></h:commandButton></td>

															<td align="left"><h:commandButton
																action="#{CrossRateSearchBB.addRecord}" value="Add"
																image="../../../images/button_add.png"></h:commandButton></td>
															<h:outputText value="#{CrossRateSearchBB.alertMsg}"
																escape="false" rendered="#{CrossRateSearchBB.render}" />
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

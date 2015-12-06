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
											value="#{msg.Gen_Daily_Rate}" /></td>
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
														value="#{DailyRateSearchBB.bankCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.bankListSI}" />
													</h:selectOneMenu></td>

													<td class="instance" width="20%"><h:outputText
														value="#{msg.networcode}" /></td>
													<td width="30%"><h:selectOneMenu
														value="#{DailyRateSearchBB.networkCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.networkListSI}" />
													</h:selectOneMenu></td>
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel value="#{msg.Gen_Currency}"  /></td>
													<td width="30%">
														<h:selectOneMenu id="currency" value="#{DailyRateSearchBB.currencyCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
														</h:selectOneMenu>
													</td>
												</tr>
												<tr>
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
															<td align="left"><h:commandButton
																action="#{DailyRateSearchBB.Refresh}" value="Refresh"
												image="../../../images/button_refresh.png"></h:commandButton></td>

															<td align="left"><h:commandButton
																action="#{DailyRateSearchBB.search}" value="Search"
												image="../../../images/button_search.png"></h:commandButton></td>
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
																				value="#{DailyRateSearchBB.criteria}" var="event"
																				binding="#{DailyRateSearchBB.datable}"
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
																						<f:selectItem itemLabel="" itemValue="" />
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
																						<f:selectItem itemLabel="" itemValue="" />
																						<f:selectItems value="#{applicationLists.networkListSI}" />
																					</h:selectOneMenu>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.id.currencyCode}"
																					filterBy="#{event.id.currencyCode}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.currencyC}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.id.currencyCode}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue="" />
																						<f:selectItems value="#{applicationLists.currencyListSI}" />
																					</h:selectOneMenu>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.bayingRate}"
																					filterBy="#{event.bayingRate}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.Byrt}" />
																					</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{DailyRateSearchBB.selectId}"
																						action="#{DailyRateSearchBB.forwardModify}">
																						<h:inputText value="#{event.bayingRate}"
																							readonly="true"  styleClass="inputTextLink" dir="RTL"  />
																					</h:commandLink>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.id.transactionType}"
																					filterBy="#{event.id.transactionType}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText
																							value="#{msg.transactParam_transactType}" />
																					</f:facet>
																					<h:selectOneMenu
																						value="#{event.id.transactionType}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue="" />
																						<f:selectItems value="#{applicationLists.transactTypeListSI}" />
																					</h:selectOneMenu>
																				</rich:column>
																				<rich:column sortable="true"
																					sortBy="#{event.id.rateDate}"
																					filterBy="#{event.id.rateDate}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.RtDate}" />
																					</f:facet>
																					<h:inputText styleClass="inputTextWording2" readonly="true" 
																					value="#{event.id.rateDate}" ><f:convertDateTime pattern="dd/MM/yyyy"/>
																					</h:inputText>
																					
																				</rich:column>

																				<rich:column sortable="true"
																					sortBy="#{event.id.flowConversion}"
																					filterBy="#{event.id.flowConversion}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.flowcnv}" />
																					</f:facet>
																					<h:selectOneMenu value="#{event.id.flowConversion}"
																						disabled="true">
																						<f:selectItem itemLabel="" itemValue="" />
																						<f:selectItem itemLabel="CL" itemValue="CL" />
																						<f:selectItem itemLabel="LC" itemValue="LC" />
																					</h:selectOneMenu>
																				</rich:column>


																				


																				<rich:column sortable="true"
																					sortBy="#{event.cellingRate}"
																					filterBy="#{event.cellingRate}"
																					filterEvent="onblur">
																					<f:facet name="header">
																						<h:outputText value="#{msg.cellrt}" />
																					</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{DailyRateSearchBB.selectId}"
																						action="#{DailyRateSearchBB.forwardModify}">
																						<h:inputText value="#{event.cellingRate}"
																							 styleClass="inputTextWording2" readonly="true" dir="RTL"/>
																					</h:commandLink>
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
												</tr>
												<tr height="50px">

												</tr>
												<tr>
													<td>


													<table width="100%" class="buttonPanel">

														<tr>
															<td width="60%"></td>
															<td align="left"><h:commandButton
																action="#{DailyRateSearchBB.backToWelcomPage}"
																value="Back" image="../../../images/button_back.png"
																immediate="true"></h:commandButton></td>

															<td align="left"><h:commandButton
																action="#{DailyRateSearchBB.addRecord}" value="Add"
																image="../../../images/button_add.png"></h:commandButton></td>
															<h:outputText value="#{DailyRateSearchBB.alertMsg}"
																escape="false" rendered="#{DailyRateSearchBB.render}" />
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

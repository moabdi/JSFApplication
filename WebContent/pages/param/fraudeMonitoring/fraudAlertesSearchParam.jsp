<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<f:loadBundle var="msg" basename="i18n.messages" />

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
											value="#{msg.Fraud_Alertes}" /></td>
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
												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_alerCode}" /></td>
													<td width="30%"><h:inputText
														value="#{FraudAlertesSearchBBean.altertCode}"
														size="3" maxlength="3">
													</h:inputText></td>

													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_Entity}" /></td>
													<td width="30%"><h:selectOneRadio
														styleClass="panelRadio"
														value="#{FraudAlertesSearchBBean.entity}">
														<f:selectItem itemValue="MER" itemLabel="Merchant" />
														<f:selectItem itemValue="CAR" itemLabel="Card" />
													</h:selectOneRadio></td>
												<tr>
													<td class="instance"><h:outputLabel
														value="#{msg.Gen_bankCode}" /></td>
													<td><h:selectOneMenu disabled="false"
														value="#{FraudAlertesSearchBBean.bankCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.bankListSI}" />
													</h:selectOneMenu></td>

													<td class="instance"><h:outputLabel
														value="#{msg.Gen_wording}" /></td>
													<td><h:inputText
														value="#{FraudAlertesSearchBBean.wording}" autocomplete="off"
														 size="30" maxlength="30">
													</h:inputText></td>

												</tr>
											</table>
										
										<table width="100%" class="tile">
											<tr>

												<td width="60%"></td>

												<td><h:commandButton value="Refresh"
													action="#{FraudAlertesSearchBBean.Refresh}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>

												<td><h:commandButton value="Search"
													image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"
													action="#{FraudAlertesSearchBBean.search}">
												</h:commandButton></td>
											</tr>
										</table>


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
													<rich:panel styleClass="tiletable"
														style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
														<rich:dataTable id="sampleData"     rows="5"
															value="#{FraudAlertesSearchBBean.criteria}" var="event"
															binding="#{FraudAlertesSearchBBean.datable}"
															sortMode="single" styleClass="tiletable"
															captionStyle="tiletable" columnClasses="tiletable"
															rowClasses="tiletable" columnsWidth="0*"
															headerClass="tiletable" width="100%" frame="above"
															reRender="ds">

															<rich:column width="200" headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.id.altertCode}"
																filterBy="#{event.id.altertCode}" filterEvent="onblur"
																styleClass="tile">

																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_alerCode}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{FraudAlertesSearchBBean.selectId}"
																	action="#{FraudAlertesSearchBBean.forwardModify}">
																	<h:inputText readonly="true" styleClass="inputTextLink" autocomplete="off"
																		value="#{event.id.altertCode}" />
																</h:commandLink>
															</rich:column>

															<rich:column width="200" headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.id.bankCode}"
																filterBy="#{event.id.bankCode}" filterEvent="onclick"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputText value="#{msg['Gen_bank']}" />
																</f:facet>
															
																	<h:selectOneMenu disabled="true" value="#{event.id.bankCode}">
																		<f:selectItem itemValue="" itemLabel=""/>
																		<f:selectItems value="#{applicationLists.bankListSI}" />
																	</h:selectOneMenu>
																
															</rich:column>



															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.id.entity}"
																filterBy="#{event.id.entity}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_Entity}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{FraudAlertesSearchBBean.selectId}"
																	action="#{FraudAlertesSearchBBean.forwardModify}">
																	<h:selectOneMenu disabled="true" value="#{event.id.entity}">
																		<f:selectItem itemValue="" itemLabel=""/>
																		<f:selectItem itemValue="MER" itemLabel="#{msg.Gen_Merchant}" />
																		<f:selectItem itemValue="CAR" itemLabel="#{msg.Gen_Card}" />
																	</h:selectOneMenu>
																</h:commandLink>
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.mccCode}"
																filterBy="#{event.mccCode}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_mcc}" />
																</f:facet>
																<h:selectOneMenu disabled="true"  value="#{event.mccCode}">
																		
																		<f:selectItem itemValue="" itemLabel="" />
																		<f:selectItems value="#{applicationLists.mccListSI}" />
																	</h:selectOneMenu>
															
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.wording}"
																filterBy="#{event.wording}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_Wording}" />
																</f:facet>
																	<h:inputText styleClass="inputTextWording2" autocomplete="off"
																		value="#{event.wording}" />
															
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.limitNumber}"
																filterBy="#{event.limitNumber}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Card_Limit_number}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" autocomplete="off"
																	value="#{event.limitNumber}" />
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.limitAmount}"
																filterBy="#{event.limitAmount}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Card_Limit_amount}" />
																</f:facet>
																<h:inputText dir="RTL"  styleClass="inputTextWording2" autocomplete="off"
																	value="#{event.limitAmount}" />
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.currencyCode}"
																filterBy="#{event.currencyCode}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_Currency}" />
																</f:facet>
																<h:selectOneMenu disabled="true" value="#{event.currencyCode}">
																	<f:selectItem itemValue=""  itemLabel=""/>
																	<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
																</h:selectOneMenu>
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.average}"
																filterBy="#{event.average}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_Average}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" autocomplete="off" dir="RTL"
																	value="#{event.average}" />
															</rich:column>



															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.usageFlag}"
																filterBy="#{event.usageFlag}" filterEvent="onblur"
																styleClass="tile">

																<f:facet name="header">
																	<h:outputLabel value="#{msg.Gen_usage_flag}" />
																</f:facet>
																<h:selectOneMenu disabled="true"  value="#{event.usageFlag}">
																	<f:selectItem itemValue="" itemLabel=""/>
																	<f:selectItem itemValue="A" itemLabel="Active" />
																	<f:selectItem itemValue="N" itemLabel="No Active" />
																</h:selectOneMenu>
																
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.merchantNumber}"
																filterBy="#{event.merchantNumber}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Merchant_Number}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" autocomplete="off"
																	value="#{event.merchantNumber}" />
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true"
																sortBy="#{event.periodCalculationAverage}"
																filterBy="#{event.periodCalculationAverage}"
																filterEvent="onblur" styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel
																		value="#{msg.Period_calculation_average}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" autocomplete="off"
																	value="#{event.periodCalculationAverage}" />
															</rich:column>



															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.periodWork}"
																filterBy="#{event.periodWork}" filterEvent="onblur"
																styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Period_work}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" autocomplete="off"
																	value="#{event.periodWork}" />
															</rich:column>



															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.numberRetrievalRequest}"
																filterBy="#{event.numberRetrievalRequest}"
																filterEvent="onblur" styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Number_retrieval_request}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" autocomplete="off"
																	value="#{event.numberRetrievalRequest}" />
															</rich:column>


															<rich:column headerClass="dataTableHeader"
																sortable="true" sortBy="#{event.amountRetrievalRequest}"
																filterBy="#{event.amountRetrievalRequest}"
																filterEvent="onblur" styleClass="tile">
																<f:facet name="header">
																	<h:outputLabel value="#{msg.Amount_retrieval_request}" />
																</f:facet>
																<h:inputText styleClass="inputTextWording2" dir="RTL" autocomplete="off"
																	value="#{event.amountRetrievalRequest}" />
															</rich:column>



														</rich:dataTable>

														<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>

													</rich:panel>

												</h:panelGrid>
												<tr>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<td>&nbsp;</td>
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
											action="#{FraudAlertesSearchBBean.backToWelcomPage}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_back.png" immediate="true"></h:commandButton></td>
										<td align="left"><h:commandButton value="Add"
											action="#{FraudAlertesSearchBBean.addRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
										<h:outputText value="#{FraudAlertesSearchBBean.alertMsg}"
											escape="false" rendered="#{FraudAlertesSearchBBean.render}" />
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

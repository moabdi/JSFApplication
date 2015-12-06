<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>
<f:view locale="#{userContext.userLocale}">
	<html>
	<head>
		<script type="text/javascript">
			var entity= 'Bank';
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body class="body">
		<h:form>
			<%@ include file="/commun/header.jsp"%>
		</h:form>
			<a4j:form>
				<table id="mainTable" class="layout" cellpadding="1" cellspacing="0" width="100%">
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
														<td width="54%" align="left">Customer setting</td>
														<td width="5%">&nbsp;</td>
														<td width="40%" align="right">Customer search</td>
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
									errorClass="errorMessage" />
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
															<td class="title">Cretiria</td>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<table width="100%">
																	<tr>
																		<td class="instance" width="10%"><h:outputLabel> Customer code </h:outputLabel></td>
																		<td width="30%"><h:inputText
																			value="#{merchantParamSearch.msisdn}" size="5" maxlength="5"></h:inputText></td>
																		<td class="instance" width="10%"><h:outputLabel> Email </h:outputLabel></td>
																		<td width="30%"><h:inputText
																			value="#{merchantParamSearch.email}" size="30" maxlength="30"></h:inputText></td>
																	</tr>
																	<tr>
																		<table width="100%">
																			<tr>
																				<td width="60%"></td>
																				<td align="left"><h:commandButton value="Refresh"
																					action="#{merchantParamSearch.Refresh}"
																					image="/images/button_refresh.png"></h:commandButton></td>
																				<td align="left"><h:commandButton value="Search"
																					action="#{merchantParamSearch.search}"
																					image="/images/button_search.png"></h:commandButton></td>
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
															<td class="title">Details</td>
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
																					value="#{merchantParamSearch.criteria}" var="event"
																					binding="#{merchantParamSearch.datable}"
																					sortMode="single" styleClass="tiletable"
																					captionStyle="tiletable" columnClasses="tiletable"
																					rowClasses="tiletable" columnsWidth="0*"
																					headerClass="tiletable" width="100%" frame="above"
																					reRender="ds">

																			<rich:column headerClass="dataTableHeader" sortable="true"
																						sortBy="#{event.msisdn}" filterBy="#{event.msisdn}"
																						filterEvent="onblur" styleClass="tile">

																				<f:facet name="header">
																					<h:outputText value="#{msg.msisdn}" />
																				</f:facet>
																					<h:commandLink styleClass="tableCommandLink"
																						actionListener="#{merchantParamSearch.selectId}"
																						action="#{merchantParamSearch.forwardModify}">
																						
																						<h:inputText value="#{event.msisdn}"
																							styleClass="inputTextLink" readonly="true" dir="RTL" />
																					</h:commandLink>
																			</rich:column>
																			
																			<rich:column sortBy="#{event.email}"
																						filterBy="#{event.email}" filterEvent="onblur"
																						sortable="true">
																				<f:facet name="header">
																					<h:outputText value="#{msg.Email}" />
																				</f:facet>
																						<h:inputText value="#{event.email}"
																							styleClass="inputTextWording2" readonly="true" size="30"/>
																				
																			</rich:column>
																			
																			<rich:column sortable="true" sortBy="#{event.postalCode}"
																							filterBy="#{event.postalCode}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.Address_Postal_Code}" />
																				</f:facet>
																					<h:inputText value="#{event.postalCode}"
																								styleClass="inputTextWording2" readonly="true"  dir="RTL"/>
																			</rich:column>											
																			
																			<rich:column sortable="true" sortBy="#{event.firstName}"
																						filterBy="#{event.firstName}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.First_Name}" />
																				</f:facet>
																					<h:inputText value="#{event.firstName}"
																								styleClass="inputTextWording2" readonly="true"  dir="RTL"/>
																			</rich:column>						
																			
																			<rich:column sortable="true" sortBy="#{event.lastName}"
																						filterBy="#{event.lastName}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.Last_Name}" />
																				</f:facet>
																					<h:inputText value="#{event.lastName}"
																									styleClass="inputTextWording2" readonly="true"  dir="RTL"/>
																			</rich:column>														
																			
																			<rich:column sortable="true" sortBy="#{event.address}"
																						filterBy="#{event.address}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.Address}" />
																				</f:facet>
																					<h:inputText value="#{event.address}"
																								styleClass="inputTextWording2" readonly="true"  dir="RTL"/>
																			</rich:column>
																		
																			<rich:column sortable="true" sortBy="#{event.dob}"
																							filterBy="#{event.dob}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.dob}" />
																				</f:facet>
																					<h:inputText value="#{event.dob}"
																								styleClass="inputTextWording2" readonly="true"  dir="RTL"/>
																			</rich:column>
																			
																		</rich:dataTable>
																			<table width="100%">
																				<tr>
																					<td align="center">
																						<t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;">
																							<f:facet name="first" ><t:graphicImage url="/images/arrow-first.gif" border="1" /></f:facet>
																							<f:facet name="last"><t:graphicImage url="/images/arrow-last-dis.gif" border="1" /></f:facet>
																							<f:facet name="previous"><t:graphicImage url="/images/arrow-previous.gif" border="1" /></f:facet>
																							<f:facet name="next"><t:graphicImage url="/images/arrow-next-dis.gif" border="1" /></f:facet>
																							<f:facet name="fastforward"><t:graphicImage url="/images/arrow-ff-dis.gif" border="1" /></f:facet>
																							<f:facet name="fastrewind"><t:graphicImage url="/images/arrow-fr.gif" border="1" /></f:facet>
																						</t:dataScroller>
																					</td>
																				</tr>
																			</table>
																	</rich:panel>
																</h:panelGrid>
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
										<table width="100%" class="buttonPanel">
											<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton value="Back"
													action="#{merchantParamSearch.backToWelcomPage}"
													image="/images/button_back.png" immediate="true"></h:commandButton></td>
												<td align="left"><h:commandButton value="Add"
													action="#{merchantParamSearch.addRecord}"
													image="/images/button_add.png"></h:commandButton></td>
														<h:outputText value="#{merchantParamSearch.alertMsg}"
															escape="false" rendered="#{merchantParamSearch.render}" />
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
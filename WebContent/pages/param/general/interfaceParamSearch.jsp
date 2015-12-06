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
									value="#{msg.Gen_Interface_Def}" /></td>
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
				<td valign="top" class="zoneTravail"><h:messages id="msg1"
					showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage" /></td>
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
												<td class="instance"><h:outputText
													value="#{msg.interfaceParam_InterfaceCode}" /></td>
												<td><h:inputText id="interface_code"
													value="#{interfaceSearchBB.interfaceCode}">

												</h:inputText></td>
												<td class="instance"><h:outputText
													value="#{msg.Gen_Wording}" /></td>
												<td><h:inputText size="30" value="#{interfaceSearchBB.wording}"></h:inputText></td>
											</tr>
											<tr>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_bank}" /></td>
												<td width="30%"><h:selectOneMenu
													value="#{interfaceSearchBB.bankCode}" id="Bank_cod">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
													<f:selectItems value="#{applicationLists.bankListSI}" />
													</h:selectOneMenu></td>
											</tr>
											<tr>
												<td></td>
												<td></td>
											</tr>
											<tr>
												<td colspan="4">
												<table width="100%">
													<tr>
														<td width="60%"></td>
														<td align="left"><h:commandButton value="Refresh"
															action="#{interfaceSearchBB.Refresh}"
															image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
														<td align="left"><h:commandButton value="Search"
															action="#{interfaceSearchBB.search}"
															image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
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
				<td align="center">
				<table width="100%">
					<tr>
						<td>
						<table class="tile">
							<thead>
								<tr>
									<td class="title" colspan="4"><h:outputText
										value="#{msg.Gen_Details}" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td align="center">
									<td align="center">
										<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}" frame="above"
											cellspacing="3">
											<rich:panel styleClass="tiletable"
												style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
													value="#{interfaceSearchBB.criteria}" var="event"
													binding="#{interfaceSearchBB.datable}" sortMode="single"
													styleClass="tiletable" captionStyle="tiletable"
													columnClasses="tiletable" rowClasses="tiletable"
													headerClass="tiletable" width="100%">




													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.id.interfaceCode}"
														filterBy="#{event.id.interfaceCode}" filterEvent="onblur"
														styleClass="tile">

														<f:facet name="header">
															<h:outputText value="#{msg.interfaceParam_InterfaceCode}" />
														</f:facet>
														<h:commandLink styleClass="tableCommandLink"
															actionListener="#{interfaceSearchBB.selectId}"
															action="#{interfaceSearchBB.forwardModify}">
															<h:inputText styleClass="inputTextLink" readonly="true"
																value="#{event.id.interfaceCode}" />
														</h:commandLink>
													</rich:column>

													<rich:column sortBy="#{event.wording}"
														filterBy="#{event.wording}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Wording}" />
														</f:facet>
														<h:commandLink styleClass="tableCommandLink"
															actionListener="#{interfaceSearchBB.selectId}"
															action="#{interfaceSearchBB.forwardModify}">
															<h:inputText styleClass="inputTextLink" readonly="true"
																value="#{event.wording}" />
														</h:commandLink>

													</rich:column>



													<rich:column sortable="true" sortBy="#{event.bankCode}"
														filterBy="#{event.bankCode}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_BankCode}" />
														</f:facet>
														<h:selectOneMenu value="#{event.bankCode}" disabled="true">
															<f:selectItems value="#{applicationLists.bankListSI}" />
														</h:selectOneMenu>
													</rich:column>



													<rich:column sortable="true"
														sortBy="#{event.interfaceType}"
														filterBy="#{event.interfaceType}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputLabel value="#{msg['interfaceType']}" />
														</f:facet>

														<h:selectOneMenu value="#{event.interfaceType}"
															disabled="true">

															<f:selectItem itemLabel="#{msg.Gen_Atm_Server}" itemValue="A" />
															<f:selectItem itemLabel="#{msg.Gen_Pos_Server}" itemValue="P" />
															<f:selectItem itemLabel="#{msg.Gen_Bank_Interf}" itemValue="B" />
															<f:selectItem itemLabel="#{msg.Gen_Nat_Interf}" itemValue="N" />
															<f:selectItem itemLabel="#{msg.Gen_Foreign_Interf}" itemValue="F" />
															<f:selectItem itemLabel="#{msg.Gen_Other_Interf}" itemValue="O" />
															<f:selectItem itemLabel="#{msg.Gen_EPS_Switch}" itemValue="E" />
															<f:selectItem itemLabel="#{msg.Gen_EPS_Virtual_Interf}" itemValue="T" />
															<f:selectItem itemLabel="#{msg.Gen_HSM_Prod}" itemValue="H" />
															<f:selectItem itemLabel="#{msg.Gen_HSM_Verif}" itemValue="V" />
														</h:selectOneMenu>
													</rich:column>

													<rich:column sortBy="#{event.ipAddressLocal}"
														filterBy="#{event.ipAddressLocal}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.IP_Adress_Local}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.ipAddressLocal}" />
													</rich:column>

													<rich:column sortable="true"
														sortBy="#{event.ipAddressRemote}"
														filterBy="#{event.ipAddressRemote}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.ipAddressRemote}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.ipAddressRemote}" />

													</rich:column>

													<rich:column sortable="true" sortBy="#{event.commsPort}"
														filterBy="#{event.commsPort}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.commsPort}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.commsPort}" />
													</rich:column>

													<rich:column sortBy="#{event.traceFileName}"
														filterBy="#{event.traceFileName}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.traceFileName}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.traceFileName}" />
													</rich:column>


													<rich:column sortBy="#{event.traceLevel}"
														filterBy="#{event.traceLevel}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.traceLevel}" />
														</f:facet>
														<h:selectOneMenu disabled="true"
															value="#{event.traceLevel}" id="traceLevel">

															<f:selectItem itemLabel="#{msg.normal}" itemValue="0" />
															<f:selectItem itemLabel="#{msg.warning}" itemValue="1" />
															<f:selectItem itemLabel="#{msg.fatal}" itemValue="2" />
														</h:selectOneMenu>
													</rich:column>

													<rich:column sortBy="#{event.keyIndex}"
														filterBy="#{event.keyIndex}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.keyIndex}" />
														</f:facet>
														<h:selectOneMenu disabled="true"
															value="#{interfaceBackingBean.keyIndex}" id="KeyIndex">

															<f:selectItems
																value="#{applicationLists.indexProdKeyListSI}" />
														</h:selectOneMenu>
													</rich:column>
													<rich:column sortBy="#{event.stationId}"
														filterBy="#{event.stationId}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.stationId}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.stationId}" />
													</rich:column>

													<rich:column sortBy="#{event.acquirerId}"
														filterBy="#{event.acquirerId}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.acquirerId}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.acquirerId}" />
													</rich:column>

													<rich:column sortBy="#{event.ica}" filterBy="#{event.ica}"
														filterEvent="onblur" sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.ica}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.ica}" />
													</rich:column>



													<rich:column sortBy="#{event.processorId}"
														filterBy="#{event.processorId}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.processorId}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.processorId}" />
													</rich:column>


													<rich:column sortBy="#{event.status}"
														filterBy="#{event.status}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.status}" />
														</f:facet>
														<h:selectOneMenu disabled="true"
															value="#{interfaceBackingBean.status}" id="Status">

															<f:selectItem itemLabel="#{msg.ONL}" itemValue="ONL" />
															<f:selectItem itemLabel="#{msg.OFL}" itemValue="OFL" />
															<f:selectItem itemLabel="#{msg.SON}" itemValue="SON" />
															<f:selectItem itemLabel="#{msg.SOF}" itemValue="SOF" />
														</h:selectOneMenu>
													</rich:column>

													<rich:column sortBy="#{event.pciManagement}"
														filterBy="#{event.pciManagement}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.pciManagement}" />
														</f:facet>
														<h:selectOneMenu disabled="true"
															value="#{event.pciManagement}">
															<f:selectItem itemValue="Y" itemLabel="Yes" />
															<f:selectItem itemValue="N" itemLabel="No" />
														</h:selectOneMenu>
													</rich:column>

													<rich:column sortBy="#{event.pidId}"
														filterBy="#{event.pidId}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.pidId}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.pidId}" />
													</rich:column>

													<rich:column sortBy="#{event.threadId}"
														filterBy="#{event.threadId}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.threadId}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.threadId}" />
													</rich:column>

													<rich:column sortBy="#{event.commNbrthread}"
														filterBy="#{event.commNbrthread}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.commNbrthread}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.commNbrthread}" />
													</rich:column>

													<rich:column sortBy="#{event.authoNbrthread}"
														filterBy="#{event.authoNbrthread}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.authoNbrthread}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.authoNbrthread}" />
													</rich:column>

													<rich:column sortBy="#{event.connectMode}"
														filterBy="#{event.connectMode}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.connectMode}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.connectMode}" />
													</rich:column>

													<rich:column sortBy="#{event.objetSupervise}"
														filterBy="#{event.objetSupervise}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.objetSupervise}" />
														</f:facet>
														<h:selectOneMenu disabled="true"
															value="#{event.objetSupervise}">
															<f:selectItem itemValue="Y" itemLabel="Yes" />
															<f:selectItem itemValue="N" itemLabel="No" />
														</h:selectOneMenu>
													</rich:column>

													<rich:column sortBy="#{event.adminPort}"
														filterBy="#{event.adminPort}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.adminPort}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.adminPort}" />
													</rich:column>

													<rich:column sortable="true" sortBy="#{event.switchPort}"
														filterBy="#{event.switchPort}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.switchPort}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.switchPort}" />
													</rich:column>

													<rich:column sortable="true"
														sortBy="#{event.switchLinkComAddr}"
														filterBy="#{event.switchLinkComAddr}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.switchLinkComAddr}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.switchLinkComAddr}" />
													</rich:column>


													<rich:column sortable="true"
														sortBy="#{event.interfaceTimeout}"
														filterBy="#{event.interfaceTimeout}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.interfaceTimeout}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.interfaceTimeout}" />
													</rich:column>

													<rich:column sortable="true" sortBy="#{event.echoTimer}"
														filterBy="#{event.echoTimer}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.echoTimer}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.echoTimer}" />
													</rich:column>

													<rich:column sortable="true"
														sortBy="#{event.genReversalTimeout}"
														filterBy="#{event.genReversalTimeout}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.genReversalTimeout}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.genReversalTimeout}" />
													</rich:column>


													<rich:column sortable="true"
														sortBy="#{event.safSendCounterMax}"
														filterBy="#{event.safSendCounterMax}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.safSendCounterMax}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.safSendCounterMax}" />
													</rich:column>



													<rich:column sortable="true"
														sortBy="#{event.adviceInterval}"
														filterBy="#{event.adviceInterval}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.adviceInterval}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.adviceInterval}" />
													</rich:column>

													<rich:column sortable="true" sortBy="#{event.startShl}"
														filterBy="#{event.startShl}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.startShl}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.startShl}" />
													</rich:column>

													<rich:column sortable="true" sortBy="#{event.stopShl}"
														filterBy="#{event.stopShl}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.stopShl}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2"
															readonly="true" value="#{event.stopShl}" />
													</rich:column>

												</rich:dataTable>
												<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
											</rich:panel>
										</h:panelGrid>
									</td>
								</tr>

							</tbody>

							<tr height="50px">

							</tr>

						</table>
						
							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{interfaceSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{interfaceSearchBB.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{interfaceSearchBB.alertMsg}"
										escape="false" rendered="#{interfaceSearchBB.render}" />
								</tr>

							</table>
						</td>
					</tr>
			</table></td></tr></table></td></tr></table></table></h:form>
	</body>
	</html>
</f:view>
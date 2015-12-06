<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>
<html>
<f:view locale="#{userContext.userLocale}">
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
										value="#{msg.statusReasonParam_StatusReasonParam}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.statusReasonParam_searchStatusReason}" /></td>
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
						showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage"/></td>
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
													value="#{msg.statusReasonParam_StatusReasonCode}" /></td>
												<td width="30%"><h:inputText id="statusReason_code"
													value="#{statusReasonSearchBB.reasonCode}"
													size="2" maxlength="2">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> 
												<rich:message for="statusReason_code"  styleClass="warnningMessage" />
												</td>
												<td class="instance" width="20%" >
												<h:outputText
													value="#{msg.Gen_Wording}" /></td>
												<td width="30%"><h:inputText value="#{statusReasonSearchBB.wording}"
												size="30" maxlength="30"></h:inputText></td>
											<tr>
											<tr>
												<td></td>
												<td></td>
												<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton value="Refresh"
													action="#{statusReasonSearchBB.Refresh}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="left"><h:commandButton value="Search"
													action="#{statusReasonSearchBB.search}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
											</tr></table></tr></table></td></tr>

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
										<td class="title"><h:outputText
													value="#{msg.Gen_Details}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%" align="center">

											<td align="center">
										<table width="100%" align="center">

											<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
												frame="above" cellspacing="3">
												<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}" value="#{statusReasonSearchBB.criteria}" var="event"
													binding="#{statusReasonSearchBB.datable}"
													sortMode="single"
													styleClass="tiletable"
													captionStyle="tiletable" columnClasses="tiletable"
													rowClasses="tiletable"
													columnsWidth="0*"
													headerClass="tiletable" width="100%"
													frame="above" reRender="ds">


													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.id.reasonCode}" filterBy="#{event.id.reasonCode}"
														filterEvent="onblur" styleClass="tile">

														<f:facet name="header">
															<h:outputText value="#{msg.statusReasonParam_StatusReasonCode}" />
														</f:facet>
														<h:commandLink styleClass="tableCommandLink"
															actionListener="#{statusReasonSearchBB.selectId}"
															action="#{statusReasonSearchBB.forwardModify}">
															<h:inputText value="#{event.id.reasonCode}"
															styleClass="inputTextLink" readonly="true" dir="RTL" />
														</h:commandLink>
													</rich:column>

													<rich:column sortBy="#{event.wording}"
														filterBy="#{event.wording}" filterEvent="onblur"
														sortable="true">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_Wording}" />
														</f:facet>
														<h:commandLink styleClass="tableCommandLink" 
															actionListener="#{statusReasonSearchBB.selectId}" 
															action="#{statusReasonSearchBB.forwardModify}">
															<h:inputText styleClass="inputTextLink" readonly="true" value="#{event.wording}" />
														</h:commandLink>
														
													</rich:column>
													
													<rich:column sortable="true" sortBy="#{event.status}"
														filterBy="#{event.status}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_StatusReasonType}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{event.libelle}" />
														

													</rich:column>
													<rich:column sortable="true" sortBy="#{event.id.bankCode}"
														filterBy="#{event.id.bankCode}" filterEvent="onblur">
														<f:facet name="header">
															<h:outputText value="#{msg.Gen_bankCode}" />
														</f:facet>
														<h:selectOneMenu value="#{event.id.bankCode}" disabled="true">
															<f:selectItems value="#{applicationLists.bankListSI}"/>
														</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true" sortBy="#{event.id.entity}"
													filterBy="#{event.id.entity}" filterEvent="onblur">
													<f:facet name="header">
													<h:outputText value="#{msg.entity}" />
													</f:facet>
												<h:selectOneMenu value="#{event.id.entity}" disabled="true">
												<f:selectItem itemLabel="" itemValue="" />												
												<f:selectItem itemLabel="#{msg.Gen_Card}" itemValue="C" />
												<f:selectItem itemLabel="#{msg.Gen_Merchant}" itemValue="M" />
												<f:selectItem itemLabel="#{msg.Gen_Host}" itemValue="H" />
												<f:selectItem itemLabel="#{msg.Gen_Loyalty}" itemValue="L" />
												<f:selectItem itemLabel="#{msg.Gen_Account}" itemValue="A" />
												<f:selectItem itemLabel="#{msg.Gen_atm}" itemValue="G" />
												<f:selectItem itemLabel="#{msg.Gen_pos}" itemValue="P" />
												</h:selectOneMenu>
												</rich:column>
												
												
												<rich:column sortable="true" sortBy="#{event.onlineResponseCode}"
												filterBy="#{event.onlineResponseCode}" filterEvent="onblur">
												<f:facet name="header">
												<h:outputText value="#{msg.Gen_Online_response_code}" />
												</f:facet>
												<h:selectOneMenu value="#{event.onlineResponseCode}" disabled="true">
												<f:selectItem itemLabel=""/>
												<f:selectItems value="#{applicationLists.actionDefinitionListSI}"/>
												</h:selectOneMenu>
												
												</rich:column>
												
												<rich:column sortable="true" sortBy="#{event.replaceOperation}"
												filterBy="#{event.replaceOperation}" filterEvent="onblur">
												<f:facet name="header">
												<h:outputText value="#{msg.gen_replaceOperation}" /> </f:facet>
												<h:selectOneMenu value="#{event.replaceOperation}" disabled="true">
												<f:selectItem itemLabel="" itemValue="" />
												<f:selectItem itemLabel="Same" itemValue="S" />
												<f:selectItem itemLabel="New" itemValue="N" />
												<f:selectItem itemLabel="Not Applicable" itemValue="A" />
												</h:selectOneMenu>
												</rich:column>
												
												</rich:dataTable>
												<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
												</rich:panel>
											</h:panelGrid>
										</table>
								</td></table></td>
						</tr>
						
						<tr>
							<td>


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{statusReasonSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{statusReasonSearchBB.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{statusReasonSearchBB.alertMsg}"
										 escape="false"
										rendered="#{statusReasonSearchBB.render}" />
								</tr>

							</table>

							</td>
						</tr>

					</table>
		</td></tr></table></td></tr></table></table>
		</h:form>
	</body>



</f:view>
</html>
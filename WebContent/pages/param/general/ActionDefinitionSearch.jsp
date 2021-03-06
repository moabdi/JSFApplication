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
										value="#{msg.ActionDefini_table}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.ActionDefini_search}" /></td>
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
													value="#{msg.ActionDefini_code}" /></td>
												<td width="30%"><h:inputText id="langue_code"
													value="#{actionDefinitionSearchBB.codeAction}" size="3" maxlength="3">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="langue_code"
													styleClass="warnningMessage" /></td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_Wording}" /></td>
												<td width="30%"><h:inputText
													value="#{actionDefinitionSearchBB.wording}" size="30" maxlength="30"></h:inputText></td>
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
													action="#{actionDefinitionSearchBB.Refresh}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton>
												</td>

												<td align="left"><h:commandButton value="Search"
													action="#{actionDefinitionSearchBB.search}"
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
												<rich:panel styleClass="tiletable"
													style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
													<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
														value="#{actionDefinitionSearchBB.criteria}" var="event"
														binding="#{actionDefinitionSearchBB.datable}"   sortMode="single"
														styleClass="tiletable" captionStyle="tiletable"
														columnClasses="tiletable" rowClasses="tiletable"
														headerClass="tiletable" width="100%" reRender="ds"  >


														<rich:column headerClass="dataTableHeader" sortable="true"
															sortBy="#{event.codeAction}"
															filterBy="#{event.codeAction}" filterEvent="onblur"
															styleClass="tile">

															<f:facet name="header">
																<h:outputText value="#{msg.ActionDefini_code}" />
															</f:facet>
															<h:commandLink styleClass="tableCommandLink"
																actionListener="#{actionDefinitionSearchBB.selectId}"
																action="#{actionDefinitionSearchBB.forwardModify}">
																<h:inputText value="#{event.codeAction}"
																styleClass="inputTextLink" readonly="true" />
															</h:commandLink>
														</rich:column>

														<rich:column sortBy="#{event.wording}"
															filterBy="#{event.wording}" filterEvent="onblur"
															sortable="true">
															<f:facet name="header">
																<h:outputText value="#{msg.Gen_Wording}" />
															</f:facet>
															<h:commandLink styleClass="tableCommandLink"
																actionListener="#{actionDefinitionSearchBB.selectId}"
																action="#{actionDefinitionSearchBB.forwardModify}">
																<h:inputText value="#{event.wording}"
																styleClass="inputTextWording2" readonly="true" size="30" />
															</h:commandLink>

														</rich:column>
														<rich:column sortBy="#{event.actionFlag}"
															filterBy="#{event.actionFlag}" filterEvent="onblur"
															sortable="true">
															<f:facet name="header">
																<h:outputText value="#{msg.ActionDefini_flag}" />
															</f:facet>
															<h:inputText value="#{event.libelle}"
																styleClass="inputTextWording2" readonly="true" />

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
						
						<tr>
							<td>


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{actionDefinitionSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png" immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{actionDefinitionSearchBB.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{actionDefinitionSearchBB.alertMsg}" escape="false"
										rendered="#{actionDefinitionSearchBB.render}" />
								</tr>

							</table>

					</td></tr></table></td>
		</tr></table></td>
		</tr></table></table></h:form>



	</body>



</f:view>
</html>
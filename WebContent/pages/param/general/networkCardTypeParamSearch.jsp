<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>
<f:view locale="#{userContext.userLocale}">
	<link rel="stylesheet" href="../../../charte/css/eps.css"
		type="text/css">
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
										value="#{msg.NetworkCenter}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.SearchNe}" /></td>
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
											<td  class="instance" width="20%"><h:outputText value="#{msg.networcode}" />
											<td width="30%"><h:inputText value="#{NetworkCardTypeSearchBB.networkCode}" id="netC" size="2" maxlength="2">
											<rich:ajaxValidator event="onblur" /><rich:message for="netC"
													styleClass="warnningMessage" /></h:inputText></td>
													
													
											<td class="instance" width="20%"><h:outputText value="#{msg.Gen_wording}" />
											<td width="30%"><h:inputText value="#{NetworkCardTypeSearchBB.wording}"size="30" maxlength="30" />
											
											<tr>
											<tr>
												<td></td>
												<td></td>
												<tr>
												<td colspan="4">
												<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><h:commandButton action="#{NetworkCardTypeSearchBB.Refresh}" value="Refresh"
												image="../../../images/button_refresh.png"></h:commandButton></td> 
												<td align="left"><h:commandButton value="Search" action="#{NetworkCardTypeSearchBB.search}"
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
										<td align="center">
										<table width="100%" align="center">
											<tr>
												<td align="center"><h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
													frame="above" cellspacing="3">
													<rich:panel styleClass="tiletable"
														style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">

												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
															value="#{NetworkCardTypeSearchBB.criteria}" var="event"
															binding="#{NetworkCardTypeSearchBB.datable}"
															sortMode="single" styleClass="tiletable"
															captionStyle="tiletable" columnClasses="tiletable"
															rowClasses="tiletable" headerClass="tiletable"
															width="100%" columnsWidth="0*" reRender="ds">
															
															<rich:column sortable="true" sortBy="#{event.id.networkCode}"
															filterBy="#{event.id.networkCode}" filterEvent="onblur">
															<f:facet name="header">
															<h:outputText value="#{msg.Gen_Network}" />
															</f:facet>
																	<h:selectOneMenu value="#{event.id.networkCode}" disabled="true" >
															<f:selectItem itemLabel=""/>
															<f:selectItems value="#{applicationLists.networkListSI}"/>
															</h:selectOneMenu>
															
															</rich:column>
															
															<rich:column sortable="true" sortBy="#{event.id.networkType}"
															filterBy="#{event.id.networkType}" filterEvent="onblur">
															<f:facet name="header">
															
															<h:outputLabel value="#{msg.cardProduct_NetworkCardType}"  />
															</f:facet>
															<h:selectOneMenu disabled="true"
																value="#{event.id.networkType}" >
															<f:selectItem itemLabel="" itemValue="" />
															<f:selectItem itemLabel="#{msg.Gen_Cirrus}" itemValue="CR" />
															<f:selectItem itemLabel="#{msg.Gen_Standard}" itemValue="ST" />
															<f:selectItem itemLabel="#{msg.Gen_Gold}" itemValue="GO" />
															<f:selectItem itemLabel="#{msg.Gen_Platinum}" itemValue="PL" />
															<f:selectItem itemLabel="#{msg.Gen_Electron}" itemValue="EL" />
															<f:selectItem itemLabel="#{msg.Gen_Maestro}" itemValue="MA" />	
															<f:selectItem itemLabel="#{msg.Gen_Classic}" itemValue="CL" />
															<f:selectItem itemLabel="#{msg.Gen_Private_Deb}" itemValue="PD" />
															<f:selectItem itemLabel="#{msg.Gen_Private_Cred}" itemValue="PC" />
															</h:selectOneMenu>
															
														</rich:column>
															
															
														<rich:column sortBy="#{event.wording}"
																filterBy="#{event.wording}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.Gen_Wording}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{NetworkCardTypeSearchBB.selectId}"
																	action="#{NetworkCardTypeSearchBB.forwardModify}">
																	<h:inputText value="#{event.wording}"
																		styleClass="inputTextLink" readonly="true" size="30" />
																</h:commandLink>

															</rich:column>

															
															</rich:dataTable>
															<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
															</rich:panel>
															</h:panelGrid></td>
																
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
										action="#{NetworkCardTypeSearchBB.backToWelcomPage}"
										image="../../../images/button_back.png"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{NetworkCardTypeSearchBB.addRecord}"
										image="../../../images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{NetworkCardTypeSearchBB.alertMsg}"
										escape="false" rendered="#{NetworkCardTypeSearchBB.render}" />
								</tr>

							</table>

							</td>
						</tr>

					</table>
					</td>
			</table>
		</table>
	</table></h:form>
	</body>




	</html>
</f:view>
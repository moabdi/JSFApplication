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
											value="#{msg.Black_list_mcc}" /></td>
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
														value="#{msg.Gen_mcc}" /></td>
													<td width="30%"><h:selectOneMenu 
														value="#{blackListMccSearchBBean.mccCode}" >
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.mccListSI}"/>
													</h:selectOneMenu></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_Wording}" /></td>
													<td width="30%"><h:inputText value="#{blackListMccSearchBBean.wording}" size="30" maxlength="30">
													</h:inputText></td>
												</tr>

											</table>
											<table width="100%">
												<tr>
												<td width="60%"></td>
												<td align="left"><br><h:commandButton value="Refresh"
													action="#{blackListMccSearchBBean.Refresh}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="left" ><br><h:commandButton value="Search"
													action="#{blackListMccSearchBBean.search}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
												</tr>
												</table>
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
														<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
															value="#{blackListMccSearchBBean.criteria}" var="event"
															binding="#{blackListMccSearchBBean.datable}"
															sortMode="single" styleClass="tiletable"
															captionStyle="tiletable" columnClasses="tiletable"
															rowClasses="tiletable" columnsWidth="0*"
															headerClass="tiletable" width="100%" frame="above"
															reRender="ds">

														<rich:column headerClass="dataTableHeader" sortable="true"
															sortBy="#{event.mccCode}" filterBy="#{event.mccCode}"
															filterEvent="onblur" width="30">
															<f:facet name="header">
																<h:outputLabel
																	value="#{msg.Gen_mcc}" />
															</f:facet>
																
																	<h:selectOneMenu disabled="true"  value="#{event.mccCode}">
																		
																		<f:selectItem itemValue="" itemLabel="" />
																		<f:selectItems value="#{applicationLists.mccListSI}" />
																	</h:selectOneMenu>
																
														</rich:column>

														<rich:column sortBy="#{event.wording}"
															filterBy="#{event.wording}" filterEvent="onblur"
															sortable="true">
															<f:facet name="header">
																<h:outputLabel value="#{msg.Gen_Wording}" />
															</f:facet>
															<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{blackListMccSearchBBean.selectId}"
																	action="#{blackListMccSearchBBean.forwardModify}">
															<h:inputText styleClass="inputTextLink" size="50"
																		value="#{event.wording}" />
																</h:commandLink>
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


							<table width="100%" class="buttonPanel">

								<tr>
									<td width="60%"></td>
									<td align="left"><h:commandButton value="Back"
										action="#{blackListMccSearchBBean.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{blackListMccSearchBBean.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{blackListMccSearchBBean.alertMsg}"
										 escape="false"
										rendered="#{blackListMccSearchBBean.render}" />
								</tr>

							</table>



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

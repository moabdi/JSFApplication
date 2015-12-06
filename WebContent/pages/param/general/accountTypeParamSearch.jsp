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
	<a4j:form>

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
										value="#{msg.accountTypeParam_accountTypeParam}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.accountTypeParam_searchAccountType}" /></td>
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
													value="#{msg.accountTypeParam_AccountType}" /></td>
												<td width="30%"><h:inputText id="accountType_code"
													value="#{accountTypeSearchBB.accountTypeCode}" size="2"
													maxlength="2">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="accountType_code"
													styleClass="warnningMessage" /></td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_Wording}" /></td>
												<td width="30%"><h:inputText
													value="#{accountTypeSearchBB.wording}" size="32"
													maxlength="32"></h:inputText></td>
											<tr>
											<tr>
												<td></td>
												<td></td>
												<td align="right"><h:commandButton value="Refresh"
													action="#{accountTypeSearchBB.Refresh}"
													image="../../../images/button_refresh.png"></h:commandButton></td>
												<td align="center"><h:commandButton value="Search"
													action="#{accountTypeSearchBB.search}"
													image="../../../images/button_search.png"></h:commandButton></td>
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
												<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}" value="#{accountTypeSearchBB.criteria}" var="event"
													binding="#{accountTypeSearchBB.datable}"
													sortMode="single"
													styleClass="tiletable"
													captionStyle="tiletable" columnClasses="tiletable"
													rowClasses="tiletable"
													columnsWidth="0*"
													headerClass="tiletable" width="100%"
													frame="above" reRender="ds">

															<rich:column headerClass="dataTableHeader" width="55%"
																sortable="true" sortBy="#{event.accountType}"
																filterBy="#{event.accountType}" filterEvent="onblur"
																styleClass="tile">

																<f:facet name="header">
																	<h:outputText
																		value="#{msg.accountTypeParam_AccountType}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{accountTypeSearchBB.selectId}"
																	action="#{accountTypeSearchBB.forwardModify}">
																	<h:inputText value="#{event.accountType}"
																		styleClass="inputTextLink" readonly="true" dir="RTL" />
																</h:commandLink>
															</rich:column>

															<rich:column sortBy="#{event.wording}" width="45%"
																filterBy="#{event.wording}" filterEvent="onblur"
																sortable="true">
																<f:facet name="header">
																	<h:outputText value="#{msg.Gen_Wording}" />
																</f:facet>
																<h:commandLink styleClass="tableCommandLink"
																	actionListener="#{accountTypeSearchBB.selectId}"
																	action="#{accountTypeSearchBB.forwardModify}">
																	<h:inputText value="#{event.wording}"
																		styleClass="inputTextWording2" readonly="true" size="40" />
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
										action="#{accountTypeSearchBB.backToWelcomPage}"
										image="../../../images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left"><h:commandButton value="Add"
										action="#{accountTypeSearchBB.addRecord}"
										image="../../../images/button_add.png"></h:commandButton></td>
									<h:outputText value="#{accountTypeSearchBB.alertMsg}"
										 escape="false"
										rendered="#{accountTypeSearchBB.render}" />
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
<a4j:region>
		<rich:modalPanel id="backPanel" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink2" />
					<rich:componentControl for="backPanel" attachTo="hidelink2"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<h:form>
				<table width="100%" class="tile">
					<tbody>

						<tr>
							<td width="20%"><h:graphicImage
								value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif"
								width="32" height="31" /></td>
							<td width="10%"></td>
							<td width="70%"><h:outputLabel styleClass="instance"
								value="#{msg.confirm_back_to_search}" /></td>

						</tr>
				</table>

				<table width=100% class="tile" align="center">
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}" action="#{accountTypeSearchBB.back}"
							onclick="Richfaces.hideModalPanel('backPanel')"
							style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}" style=" width : 67px;"
							onclick="Richfaces.hideModalPanel('backPanel');return false;" />
						</td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>
	</a4j:region>

	<a4j:region>

		<rich:modalPanel id="deletePanel" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink3" />
					<rich:componentControl for="backPanel" attachTo="hidelink3"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<h:form>
				<table width="100%" class="tile">

					<tr>
						<td width="20%"><h:graphicImage
							value="#{facesContext.externalContext.requestContextPath}/images/errorIco.ICO"
							width="32" height="31" /></td>
						<td width="10%"></td>
						<td width="70%"><h:outputLabel styleClass="instance"
							value="#{msg.confirm_delete}" /></td>
					</tr>
				</table>
				<table class="tile" width=100%>
					<tr style="height: 30px;">
					<tr>
						<br>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{accountTypeBackingBean.delete}"
							reRender="poll,validatePanel,msg" limitToList="true"
							oncomplete="Richfaces.hideModalPanel('deletePanel');"
							status="status_delete" style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}"
							onclick="Richfaces.hideModalPanel('deletePanel');return false;"
							style=" width : 67px;" /></td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>

		<a4j:status id="status_delete"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('validatePanel');" />
	</a4j:region>



	</html>
</f:view>
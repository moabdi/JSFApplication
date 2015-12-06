<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="../../../charte/css/eps.css"
	type="text/css">
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
											value="#{msg.History_User_Operation}" /></td>
										<td width="5%">&nbsp;</td>
										<td width="40%" align="right"><h:outputLabel
											value="#{msg.Gen_Search_Parameters}" /></td>
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
							showDetail="true" showSummary="false" infoClass="infoMessage"
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
												value="#{msg.Gen_Identification}" /></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
											<table width="100%">


												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.userRoles_user}" /></td>
													<td width="30%"><h:selectOneMenu id="userCode"
														value="#{historyUserOpeartionSearchBB.userCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.userNameListSI}" />
													</h:selectOneMenu></td>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Table_Name}"></h:outputLabel></td>
													<td width="30%"><h:selectOneMenu id="table_name"
														value="#{historyUserOpeartionSearchBB.tableName}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="%" />
														<f:selectItems value="#{applicationLists.tableEPSListSI}" />

													</h:selectOneMenu></td>


												</tr>
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_operationDateFrom}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><rich:calendar required="true"
														requiredMessage="#{msg.Gen_operationDateFrom} #{msg.Gen_required}"
														datePattern="dd/MM/yyyy"
														value="#{historyUserOpeartionSearchBB.oprFrom}"
														direction="auto">
														<rich:ajaxValidator event="onblur" />
													</rich:calendar></td>

													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.Gen_To}" /><h:outputLabel style="color:red"
														value="#{msg.Gen_RequireField}" /></td>

													<td width="30%"><rich:calendar required="true"
														requiredMessage="#{msg.Gen_To} #{msg.Gen_required}"
														datePattern="dd/MM/yyyy"
														value="#{historyUserOpeartionSearchBB.oprTo}"
														direction="auto">
														<rich:ajaxValidator event="onblur" />
													</rich:calendar></td>

												</tr>
											</table>

											<table width="100%">
												<tr>
													<td width="60%"></td>



													<td><h:commandButton
														image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"
														action="#{historyUserOpeartionSearchBB.initTree}">
													</h:commandButton></td>
												</tr>

											</table>
									</tbody>
								</table>


								<table width="100%" id="details_table" class="tile">
									<tr>
										<td>
										<table class="tile">
											<thead>
												<tr>
													<td class="title" colspan="2"><h:outputLabel
														value="#{msg.Gen_Details}"></h:outputLabel></td>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><rich:panel styleClass="treePanel"
														id="treePanelAudit"
														style="overflow-x: auto; width:285px; overflow-y: auto; height:370px;">

														<rich:tree styleClass="richTree"
															value="#{historyUserOpeartionSearchBB.data}"
															reRender="sampleData,scroller,ds" ajaxSingle="true"
															ajaxSubmitSelection="true" switchType="client"
															binding="#{historyUserOpeartionSearchBB.auditTree}"
															nodeSelectListener="#{historyUserOpeartionSearchBB.processSelection}"
															icon="#{facesContext.externalContext.requestContextPath}/images/impression.png"
															iconLeaf="#{facesContext.externalContext.requestContextPath}/images/papier.png"
															id="tree" var="data">
														</rich:tree>
													</rich:panel></td>
													<td width="100%" align="center" valign="top">
													<table width="100%" align="center">
														<h:panelGrid border="0" columns="1" width="100%"
															frame="above" cellspacing="3">
															<rich:panel styleClass="tile"
																style="overflow-x: auto; width:100%;">

																<rich:dataTable id="sampleData" rows="10"
																	binding="#{historyUserOpeartionSearchBB.datable}"
																	value="#{historyUserOpeartionSearchBB.criteria}"
																	var="event" sortMode="single" styleClass="tiletable2"
																	captionStyle="tiletable" columnClasses="tiletable2"
																	rowClasses="tiletable2" headerClass="tiletable"
																	width="100%" reRender="ds">

																	<rich:column sortBy="#{event.id.tableName}"
																		width="240px" style="width : 240px;" sortable="true"
																		styleClass="tile">
																		<f:facet name="header">
																			<h:outputLabel value="#{msg.Table_Name}" />
																		</f:facet>
																		<a4j:commandLink styleClass="tableCommandLink"
																			actionListener="#{historyUserOpeartionSearchBB.selectId}"
																			oncomplete="Richfaces.showModalPanel('Details_panel')"
																			reRender="Details_panel">
																			<h:inputText styleClass="inputTextLink"
																				value="#{event.id.tableName}" readonly="true"
																				autocomplete="off" style=" width : 240px;">
																			</h:inputText>
																		</a4j:commandLink>
																	</rich:column>

																	<rich:column sortBy="#{event.id.userCode}"
																		sortable="true">
																		<f:facet name="header">
																			<h:outputText value="#{msg.userRoles_user}" />
																		</f:facet>
																		<h:selectOneMenu disabled="true" styleClass="Fixed"
																			value="#{event.id.userCode}">
																			<f:selectItem itemValue="" />
																			<f:selectItems
																				value="#{applicationLists.userNameListSI}" />
																		</h:selectOneMenu>

																	</rich:column>

																	<rich:column sortBy="#{event.tableKey}" width="240px"
																		sortable="true">
																		<f:facet name="header">
																			<h:outputLabel value="#{msg.Table_Key}" />
																		</f:facet>
																		<h:inputText value="#{event.tableKey}"
																			styleClass="inputTextWording2"
																			style=" width : 240px;"></h:inputText>
																	</rich:column>


																	<rich:column sortable="true"
																		sortBy="#{event.id.dateHourOp}">
																		<f:facet name="header">
																			<h:outputLabel value="#{msg.Date_and_hour_operation}" />
																		</f:facet>
																		<h:inputText styleClass="inputTextWording2"
																			value="#{event.id.dateHourOp}"
																			style=" width : 140px;">
																			<f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
																		</h:inputText>
																	</rich:column>

																</rich:dataTable>

																<table width="100%">
																	<tr>
																		<td align="center"><a4j:outputPanel id="scroller">
																			<t:dataScroller id="ds" for="sampleData"
																				fastStep="10"
																				binding="#{historyUserOpeartionSearchBB.scroller}"
																				pageCountVar="pageCount" pageIndexVar="pageIndex"
																				styleClass="scroller" paginator="true"
																				paginatorMaxPages="9"
																				paginatorTableClass="paginator"
																				paginatorActiveColumnStyle="font-weight:bold;">
																				<f:facet name="first">
																					<t:graphicImage
																						url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif"
																						border="1" />
																				</f:facet>
																				<f:facet name="last">
																					<t:graphicImage
																						url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif"
																						border="1" />
																				</f:facet>
																				<f:facet name="previous">
																					<t:graphicImage
																						url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif"
																						border="1" />
																				</f:facet>
																				<f:facet name="next">
																					<t:graphicImage
																						url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif"
																						border="1" />
																				</f:facet>
																				<f:facet name="fastforward">
																					<t:graphicImage
																						url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif"
																						border="1" style=" width : 22px;" />
																				</f:facet>
																				<f:facet name="fastrewind">
																					<t:graphicImage
																						url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif"
																						border="1" />
																				</f:facet>
																			</t:dataScroller>
																		</a4j:outputPanel></td>
																	</tr>
																</table>

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
													action="#{historyUserOpeartionSearchBB.backToWelcomPage}"
													image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
													immediate="true"></h:commandButton></td>

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
	<a4j:region>
		<rich:modalPanel id="Details_panel" autosized="true"
			style="background-color:#BAD9EF;" width="950" height="400"
			keepVisualState="false">
			<f:facet name="header">
				<h:outputLabel value="#{msg.E_P_S}" />
			</f:facet>
			<f:facet name="controls">
				<h:graphicImage
					value="#{facesContext.externalContext.requestContextPath}/images/close.png"
					style="cursor:pointer"
					onclick="Richfaces.hideModalPanel('Details_panel')" />
			</f:facet>
			<h:form id="test">
				<table width="100%" class="tile">
					<tr>
						<td></td>
					</tr>
					<tr style="height: 2px"></tr>
				</table>
				<table width="100%" class="tile">
					<thead>
						<tr>
							<td colspan="4" class="title"><h:outputLabel
								value="#{msg.Gen_Identification}" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="instance" width="20%"><h:outputLabel
								value="#{msg.userRoles_user}" /></td>
							<td width="30%"><h:selectOneMenu disabled="true"
								value="#{historyUserOpeartionSearchBB.historyUserOpeartionAPasser.id.userCode}">
								<f:selectItem itemValue="" />
								<f:selectItems value="#{applicationLists.userNameListSI}" />
							</h:selectOneMenu></td>


							<td class="instance" width="20%"><h:outputLabel
								value="#{msg.Table_Name}" /></td>
							<td width="30%"><h:selectOneMenu disabled="true"
								value="#{historyUserOpeartionSearchBB.historyUserOpeartionAPasser.id.tableName}">
								<f:selectItem itemValue="" />
								<f:selectItems value="#{applicationLists.tableEPSListSI}" />

							</h:selectOneMenu></td>
						</tr>



						<tr>
							<td class="instance" width="20%"><h:outputText
								value="#{msg.Table_Key}" /></td>
							<td width="30%"><h:inputText autocomplete="off"
								disabled="true" styleClass="inputTextWording2"
								value="#{historyUserOpeartionSearchBB.historyUserOpeartionAPasser.tableKey}"
								style=" width : 250px;">
							</h:inputText></td>


							<td class="instance" width="20%"><h:outputText
								value="#{msg.Operation}" /></td>
							<td width="30%"><h:selectOneMenu
								value="#{historyUserOpeartionSearchBB.historyUserOpeartionAPasser.operation}"
								disabled="true">
								<f:selectItem itemValue="" />
								<f:selectItem itemLabel="#{msg.Gen_LACI}" itemValue="I" />
								<f:selectItem itemLabel="#{msg.Gen_update}" itemValue="U" />
								<f:selectItem itemLabel="#{msg.Gen_delete}" itemValue="D" />
							</h:selectOneMenu></td>
						</tr>



						<tr>
							<td class="instance" width="20%"><h:outputText
								value="#{msg.Ip_address}" /></td>
							<td width="30%"><h:inputText autocomplete="off"
								disabled="true" styleClass="inputTextWording2"
								value="#{historyUserOpeartionSearchBB.historyUserOpeartionAPasser.ipAddress}">
								<f:validateLength minimum="0" maximum="24"></f:validateLength>
							</h:inputText></td>


							<td class="instance" width="20%"><h:outputText
								value="#{msg.Date_and_hour_operation}" /></td>
							<td width="30%"><h:inputText styleClass="inputTextWording2"
								value="#{historyUserOpeartionSearchBB.historyUserOpeartionAPasser.id.dateHourOp}"
								style=" width : 140px;">
								<f:convertDateTime pattern="dd/MM/yyyy HH:mm:ss" />
							</h:inputText></td>
						</tr>
						<tr style="height: 20px"></tr>
					</tbody>
				</table>
				<table width="100%" class="tile">
					<thead>
						<tr>
							<td colspan="2" class="title"><h:outputLabel
								value="#{msg.Gen_Informations}" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="instance" width="20%" valign="top" >
							<br><br><h:outputText 
								value="#{msg.Record_data_before}" rendered="#{historyUserOpeartionSearchBB.modification}"/><h:outputText
								value="#{msg.Gen_RecordDeleted}" rendered="#{historyUserOpeartionSearchBB.supression}" />
								<br><br>
								<h:outputText
								value="#{msg.Gen_RecordAdded}" rendered="#{historyUserOpeartionSearchBB.insertion}" />
								<br><br><h:outputText 
								value="#{msg.Record_data_after}" rendered="#{historyUserOpeartionSearchBB.modification}" />&nbsp;&nbsp;</td>
							<td width="80%"><h:panelGrid border="0" columns="1"
								width="100%" frame="above" cellspacing="3">
								<rich:panel styleClass="tile"
									style="overflow-x: auto; width:750px;">
										<rich:dataTable id="sampleDataBefore" rows="10"
										binding="#{historyUserOpeartionSearchBB.datableBefore}"
										value="#{historyUserOpeartionSearchBB.criteriaBefore}"
										var="data" sortMode="single" styleClass="tiletable2"
										captionStyle="tiletable" columnClasses="tiletable2"
										rowClasses="tiletable2" headerClass="tiletable" width="100%">

										<rich:columns value="#{historyUserOpeartionSearchBB.listcolumnsBefore}"
											var="columns"  style="background-color: #{columns.nodeComments}" >

											<f:facet name="header">
												<h:outputText value="#{columns.nodeTitle}" />
											</f:facet>

											<h:inputText styleClass="inputTextWording2" readonly="true"
												value="#{columns.nodeImg}" style="background-color: #{columns.nodeComments}">
											</h:inputText>

										</rich:columns>


										

									</rich:dataTable>
												
<br>


									<rich:dataTable id="sampleDataAfter" rows="10"
										binding="#{historyUserOpeartionSearchBB.datableAfter}"
										value="#{historyUserOpeartionSearchBB.criteriaAfter}"
										var="data" sortMode="single" styleClass="tiletable2"
										captionStyle="tiletable" columnClasses="tiletable2"
										rowClasses="tiletable2" headerClass="tiletable" width="100%">

										<rich:columns value="#{historyUserOpeartionSearchBB.listcolumnsAfter}"
											var="columns" style="background-color: #{columns.nodeComments}" >

											<f:facet name="header">
												<h:outputText value="#{columns.nodeTitle}" />
											</f:facet>

											<h:inputText styleClass="inputTextWording2" readonly="true"
												value="#{columns.nodeImg}" style="background-color: #{columns.nodeComments}">
											</h:inputText>

										</rich:columns>


										

									</rich:dataTable>

									

								</rich:panel>

							</h:panelGrid></td>

						</tr>
					</tbody>
				</table>
			</h:form>
		</rich:modalPanel>
	</a4j:region>



</f:view>
</html>

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
														<td width="54%" align="left">Transactions setting</td>
														<td width="5%">&nbsp;</td>
														<td width="40%" align="right">Transaction search</td>
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
																			value="#{errorSearchBB.customerCode}" size="10" maxlength="10"></h:inputText></td>
																		<td class="instance" width="10%"><h:outputLabel> Transaction Code </h:outputLabel></td>
																		<td width="30%"><h:inputText
																			value="#{errorSearchBB.errorId}" size="10" maxlength="30"></h:inputText></td>
																	</tr>
																	<tr>
																		<table width="100%">
																			<tr>
																				<td width="60%"></td>
																				<td align="left"><h:commandButton value="Refresh"
																					action="#{errorSearchBB.Refresh}"
																					image="/images/button_refresh.png"></h:commandButton></td>
																				<td align="left"><h:commandButton value="Search"
																					action="#{errorSearchBB.search}"
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
																					value="#{errorSearchBB.criteria}" var="event"
																					binding="#{errorSearchBB.datable}"
																					sortMode="single" styleClass="tiletable"
																					captionStyle="tiletable" columnClasses="tiletable"
																					rowClasses="tiletable" columnsWidth="0*"
																					headerClass="tiletable" width="100%" frame="above"
																					reRender="ds">

																			<rich:column headerClass="dataTableHeader" sortable="true"
																						sortBy="#{event.errorId}" filterBy="#{event.errorId}"
																						filterEvent="onblur" styleClass="tile">

																				<f:facet name="header">
																					<h:outputText value="Error Id" />
																				</f:facet>
																						
																									<h:inputText value="#{event.errorId}"
																						styleClass="inputTextLink" readonly="true" dir="RTL" />
																			
																			</rich:column>
																			
																			<rich:column sortable="true" sortBy="#{event.errorCode}"
																						filterBy="#{event.errorCode}" filterEvent="onblur">
																				 <f:facet name="header">
																					<h:outputText value="#{msg.error_title}" />
																				 </f:facet>
																					<h:selectOneMenu value="#{event.errorCode}"
																										immediate="true" disabled="true">
																							<f:selectItem itemValue="#{event.errorCode}" />
																							<f:selectItems value="#{applicationLists.errorsListSI}"/>
																						</h:selectOneMenu>
																			</rich:column>	
																			<rich:column sortable="true" sortBy="#{event.transactionCode}"
																						filterBy="#{event.transactionCode}" filterEvent="onblur" >
																				<f:facet name="header">
																					<h:outputText value="#{msg.transaction_title}" />
																				</f:facet>
																					<h:selectOneMenu value="#{event.transactionCode}"
																										immediate="true" disabled="true">
																							<f:selectItem itemValue="#{event.transactionCode}" />
																							<f:selectItems value="#{applicationLists.transactionListSI}"/>
																						</h:selectOneMenu>
																			</rich:column>		
																			<rich:column sortBy="#{event.customerMsisdn}"
																						filterBy="#{event.customerMsisdn}" filterEvent="onblur"
																						sortable="true">
																				<f:facet name="header">
																					<h:outputText value="#{msg.from}" />
																				</f:facet>
																						<h:selectOneMenu value="#{event.customerMsisdn}"
																										immediate="true" disabled="true">
																							<f:selectItem itemValue="#{event.customerMsisdn}" />
																							<f:selectItems value="#{applicationLists.customerListSI}"/>
																						</h:selectOneMenu>
																			</rich:column>
																			<rich:column sortable="true" sortBy="#{event.customerMsisdn}"
																						filterBy="#{event.customerMsisdn}" filterEvent="onblur" >
																				<f:facet name="header">
																					<h:outputText value="#{msg.number_phone}"  />
																				</f:facet>
																				<a4j:commandLink styleClass="tableCommandLink" reRender="panel12"
																								oncomplete="javascript:Richfaces.showModalPanel('panel12');"
																								actionListener="#{errorSearchBB.selectId}"
																								status="status_afficherCustomer" style=" width : 67px;"
																								ajaxSingle="true" >
																						<h:inputText value="#{event.customerMsisdn}"
																								styleClass="inputTextLink" readonly="true" dir="RTL"  size="10"/>
																				</a4j:commandLink>
																			</rich:column>	
																			<rich:column sortable="true" sortBy="#{event.merchantMsisdn}"
																							filterBy="#{event.merchantMsisdn}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.to}" />
																				</f:facet>
																						<h:selectOneMenu value="#{event.merchantMsisdn}"
																										immediate="true" disabled="true">
																							<f:selectItem itemValue="#{event.merchantMsisdn}" />
																							<f:selectItems value="#{applicationLists.merchantListSI}"/>
																						</h:selectOneMenu>
																			</rich:column>											
																			
																			<rich:column sortable="true" sortBy="#{event.merchantMsisdn}"
																						filterBy="#{event.merchantMsisdn}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.number_phone}" />
																				</f:facet>
																					<a4j:commandLink styleClass="tableCommandLink" reRender="panel32"
																								oncomplete="javascript:Richfaces.showModalPanel('panel32');"
																								actionListener="#{errorSearchBB.selectIdt}"
																								status="status_afficherMerchant" style=" width : 67px;" 
																								ajaxSingle="true" >
																					<h:inputText value="#{event.merchantMsisdn}"
																								styleClass="inputTextLink" readonly="true" dir="RTL" />
																				</a4j:commandLink>
																			</rich:column>	
																
																			
																			<rich:column sortable="true" sortBy="#{event.errorDate}"
																						filterBy="#{event.errorDate}" filterEvent="onblur">
																				<f:facet name="header">
																					<h:outputText value="#{msg.errorDate}" />
																				</f:facet>
																					<h:inputText value="#{event.errorDate}"
																									styleClass="inputTextWording2" readonly="true" />
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
													action="#{errorSearchBB.backToWelcomPage}"
													image="/images/button_back.png" immediate="true"></h:commandButton></td>
												<td align="left"><h:commandButton value="Add"
													action="#{errorSearchBB.addRecord}"
													image="/images/button_add.png"></h:commandButton></td>
														<h:outputText value="#{errorSearchBB.alertMsg}"
															escape="false" rendered="#{errorSearchBB.render}" />
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</table>
				</table>
				</h:form>
						</body>
						
		
						
	<a4j:status id="status_afficherMerchant"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('panel32');" />
	
				<a4j:region>
				
										
										
		<rich:modalPanel id="panel32" resizeable="false"
			style="background-color:#BAD9EF;" width="750" height="350"
			keepVisualState="false">
			<f:facet name="header">
				<h:outputLabel value="#{msg.E_P_S}" />
			</f:facet>
			<f:facet name="controls">
				<h:graphicImage
					value="/images/close.png"
					style="cursor:pointer"
					onclick="Richfaces.hideModalPanel('panel32')" />
			</f:facet>
			<h:form>
				<table width="100%" class="tile">
					<tr>
						<td>
							
						</td>
					</tr>
					<tr style="height:2px"></tr>
				</table>
				<table width="100%" class="tile">
					<thead>
						<tr>
							<td colspan="6" class="title"><h:outputLabel value="#{msg.Gen_Identification}" /></td>
						</tr>
					</thead>
					<tbody>
											<tr>
												<td class="instance" width="25%" align="left" ><h:outputText
													value="Merchant Code" />
												<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.msisdn}"  size="10" readonly="true"/></td>
												<td>
												</td>
											</tr>

						<tr style="height:20px"></tr>
					</tbody>
					</table>
					<table width="100%" class="tile">
						<thead>
						<tr>
							<td class="title"><h:outputLabel value="Details" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="instance">
							<rich:tabPanel id="tabPanel1"
								switchType="client" contentClass="tile">
								<rich:tab id="panel11" styleClass="tabPanel" label="Informations">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Last_Name} "/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.lastName}" disabled="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.First_Name}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.firstName}" disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.CIN} "/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.idNumber}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.dob}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.dob}" disabled="true" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Email}"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.email}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Job_Title}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.jobTitle}" disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
													
													</table>
									</rich:tab>
									 
									<rich:tab id="panel22" styleClass="tabPanel" label="Account">
											 	<table width="100%" border="0" class="tile">
														<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_number}"/>
														</td><td width="40%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.accountNumber}" size="22" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.creationDate}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.creationDate}" readonly="true">
														</h:inputText>
														</td>
													</tr>
														
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_atf_Payment}"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.mallowedPayment}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="1"/>
														<f:selectItem  itemLabel="No" itemValue="0"/>
														</h:selectOneRadio>
														</td>
														
															<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_atf_Balance}"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.mallowedBalance}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="1"/>
														<f:selectItem  itemLabel="No" itemValue="0"/>
														</h:selectOneRadio>
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_atf_Transafer}"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.mallowedTransfer}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="1"/>
														<f:selectItem  itemLabel="No" itemValue="0"/>
														</h:selectOneRadio>
														</td>
														
															<td class="instance" width="20%" >
															<h:outputText  value="#{msg.status}"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.merchantAPASSER.status}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="Y"/>
														<f:selectItem  itemLabel="No" itemValue="N"/>
														</h:selectOneRadio>
														</td>
													</tr>
													
													</table>
														
									</rich:tab>
								   	<rich:tab id="panel44" styleClass="tabPanel" label="Address">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Address_City}"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.city}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Address_Postal_Code}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.postalCode}" disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Address_State}"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.state}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Address_Country}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.country}" disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
													<tr>
													<td class="instance" width="20%"><h:outputText value="#{msg.Address}"/></td>
														<td width="30%">
														<h:inputTextarea styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.address}" cols="40" rows="3" disabled="true" readonly="true">
														</h:inputTextarea>
														</td>
													</tr>	
													
													</table>
									</rich:tab>
									
									<rich:tab id="panel55" styleClass="tabPanel" label="Description">
									<table width="100%" border="0" class="tile">
													<tr>
														<td width="100%" align="left">
															<h:outputText  value="#{msg.Description} "/> :
														</td>
														</tr>
														<tr><td width="30%">
														<h:inputTextarea styleClass="inputTextWording2" value="#{errorSearchBB.merchantAPASSER.description}" rows="5" cols="50" disabled="true" readonly="true">
														</h:inputTextarea>
														</td>
													</tr>
													
													</table>
									</rich:tab>
									
						
									
							</rich:tabPanel>
							</td>
						</tr></tbody>
					</table>
				</h:form>
			</rich:modalPanel>
			</a4j:region>
			<a4j:region>
		<a4j:status id="status_afficherCustomer"
			onstart="Richfaces.showModalPanel('wait')"
			onstop="Richfaces.hideModalPanel('wait');
										Richfaces.showModalPanel('panel12');" />	
			
		<rich:modalPanel id="panel12" resizeable="false"
			style="background-color:#BAD9EF;" width="750" height="350"
			keepVisualState="false">
			<f:facet name="header">
				<h:outputLabel value="#{msg.E_P_S}" />
			</f:facet>
			<f:facet name="controls">
				<h:graphicImage
					value="/images/close.png"
					style="cursor:pointer"
					onclick="Richfaces.hideModalPanel('panel12')" />
			</f:facet>
			<h:form>
				<table width="100%" class="tile">
					<tr>
						<td>
							
						</td>
					</tr>
					<tr style="height:2px"></tr>
				</table>
				<table width="100%" class="tile">
					<thead>
						<tr>
							<td colspan="6" class="title"><h:outputLabel value="#{msg.msisdn}" /></td>
						</tr>
					</thead>
					<tbody>
											<tr><br>
											<td class="instance" width="25%" align="left">
												<h:outputText value="Customer Code" />
												<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.msisdn}"  size="10" readonly="true"/>
											</td>
											<td>
											</td>
											</tr>

						<tr style="height:20px"></tr>
					</tbody>
					</table>
					<table width="100%" class="tile">
						<thead>
						<tr>
							<td class="title"><h:outputLabel value="Details" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="instance">
							<rich:tabPanel id="tabPanel"
								switchType="client" contentClass="tile">
								<rich:tab id="panel1" styleClass="tabPanel" label="Informations">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Last_Name }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.lastName}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.First_Name}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.firstName}" disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
																										<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.CIN }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.idNumber}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.dob}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.dob}" disabled="true" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Email }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.email}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Job_Title}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.jobTitle}" disabled="true" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
													</tr>
													
											</table>
									</rich:tab>
									 
									<rich:tab id="panel2" styleClass="tabPanel" label="Account">
											 	<table width="100%" border="0" class="tile">
														<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_number }"/>
														</td><td width="40%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.accountNumber}"    size="22" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.creationDate}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.creationDate}" readonly="true">
														</h:inputText>
														</td>
													</tr>
														
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_atf_Payment }"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.callowedPayment}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="1"/>
														<f:selectItem  itemLabel="No" itemValue="0"/>
														</h:selectOneRadio>
														</td>
														
															<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_atf_Balance }"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.callowedBalance}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="1"/>
														<f:selectItem  itemLabel="No" itemValue="0"/>
														</h:selectOneRadio>
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.a_atf_Transafer }"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.callowedTransfer}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="1"/>
														<f:selectItem  itemLabel="No" itemValue="0"/>
														</h:selectOneRadio>
														</td>
														
															<td class="instance" width="20%" >
															<h:outputText  value="#{msg.status }"/>
														</td><td width="30%">
														<h:selectOneRadio disabled="true" value="#{errorSearchBB.customerAPASSER.status}" styleClass="panelRadio">
														<f:selectItem  itemLabel="Yes" itemValue="Y"/>
														<f:selectItem  itemLabel="No" itemValue="N"/>
														</h:selectOneRadio>
														</td>
													</tr>
													
													</table>
														
									</rich:tab>
								
									<rich:tab id="panel3" styleClass="tabPanel" label="Employer">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.emp_name }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.employerName}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.emp_number}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.employerNumber}"  disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
													<tr>
													
																											
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.emp_phone }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.employerPhone}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="30%"><h:outputText value="#{msg.emp_address}"/></td>
														<td width="30%">
														<h:inputTextarea styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.employerAddress}"  cols="40" rows="3" disabled="true" readonly="true">
														</h:inputTextarea>
														</td>
														
													</tr>
														
													
													</table>
									</rich:tab>
									
									<rich:tab id="panel4" styleClass="tabPanel" label="Address">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Address_City }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.city}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Address_Postal_Code}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.postalCode}" disabled="true" readonly="true">
														</h:inputText>
														</td>
													</tr>
																										<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Address_State }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.state}" disabled="true" readonly="true">
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Address_Country}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.country}" disabled="true" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
													</tr>
													<tr>
													<td class="instance" width="20%"><h:outputText value="#{msg.Address}"/></td>
														<td width="30%">
														<h:inputTextarea styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.address}" cols="40" rows="3" disabled="true" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputTextarea>
														</td>
													</tr>	
													
													</table>
									</rich:tab>
									
									<rich:tab id="panel5" styleClass="tabPanel" label="Description">
									<table width="100%" border="0" class="tile">
													<tr>
														<td width="100%" align="left">
															<h:outputText  value="#{msg.Description }"/> :
														</td>
														</tr>
														<tr><td width="30%">
														<h:inputTextarea styleClass="inputTextWording2" value="#{errorSearchBB.customerAPASSER.description}" rows="5" cols="50" disabled="true" readonly="true">
														</h:inputTextarea>
														</td>
													</tr>
													
													</table>
									</rich:tab>
									
						
									
							</rich:tabPanel>
							</td>
						</tr></tbody>
					</table>
				</h:form>
			</rich:modalPanel>
			</a4j:region>
			
		
	</html>
</f:view>
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
										value="#{msg.incomVisaT_table}" /></td>
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
										<table width="100%" border="0">
											<tr><td>&nbsp;</td></tr>
											<tr>
												
												<td class="instance" width="20%" ><h:outputText
													value="#{msg.Gen_Reference_Number}" /></td>
												<td width="30%" ><h:inputText value="#{incomingVisaTransactionSearchBB.acquirerReferenceNumber}"  maxlength="23" size="24"/></td>
												
												<td class="instance" width="20%" ><h:outputText
													value="#{msg.Gen_seqNum}" /></td>
												<td width="30%" >
												<h:inputText value="#{incomingVisaTransactionSearchBB.sequenceNumber}" size="3" maxlength="3">
											
												</h:inputText>
												</td>	
											</tr>
											
											<tr>
											<td class="instance" width="20%"  >
											<h:outputText value="#{msg.Gen_businessDate}" />
											</td>
											<td width="30%" ><rich:calendar datePattern="dd/MM/yyyy" zindex="1000" value="#{incomingVisaTransactionSearchBB.businessDate}"/></td>
											<td class="instance" width="20%"  >
											<h:outputText value="#{msg.Gen_To}" />
											</td>
											<td width="30%" ><rich:calendar datePattern="dd/MM/yyyy" zindex="1000" value="#{incomingVisaTransactionSearchBB.businessDateTO}"/></td>
											</tr>
											<tr>
											<td class="instance" width="20%" >
											<h:outputText value="#{msg.Gen_TransactDate}" />
											</td>
											<td width="30%" ><rich:calendar datePattern="dd/MM/yyyy" zindex="1000" value="#{incomingVisaTransactionSearchBB.transactionDate}"/></td>
											<td class="instance" width="20%"  >
											<h:outputText value="#{msg.Gen_To}" />
											</td>
											<td width="30%" ><rich:calendar datePattern="dd/MM/yyyy" zindex="1000"  value="#{incomingVisaTransactionSearchBB.transactionDateTO}"/></td>
											</tr>
											<tr>
											<td class="instance" width="20%"   ><h:outputText
													value="#{msg.Gen_cardNumber}" /></td>
											<td width="30%" ><h:inputText value="#{incomingVisaTransactionSearchBB.cardNumber}" maxlength="22" size="24" /></td>
											</tr>
											
											</table>
											<table width="100%">
											<tr>
												<td width="60%"></td>
												<td align="left" ><h:commandButton value="Refresh" action="#{incomingVisaTransactionSearchBB.Refresh}" image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="left" ><h:commandButton value="Search" action="#{incomingVisaTransactionSearchBB.search}" image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
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
										<td >
										<table width="100%" align="center">
										<tr>
										<td align="center">
												<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
												frame="above" cellspacing="3">

												<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">

												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"									
													sortMode="single" 
													columnsWidth="0*"
													styleClass="tiletable" 
													captionStyle="tiletable" columnClasses="tiletable"
													rowClasses="tiletable"
													headerClass="tiletable"  width="100%"
													bgcolor="#FFDD57" var="event"
													binding="#{incomingVisaTransactionSearchBB.datable}"
													value="#{incomingVisaTransactionSearchBB.criteria}">
												
												<rich:column  sortable="true"
														sortBy="#{event.id.acquirerReferenceNumber}" filterBy="#{event.id.acquirerReferenceNumber}"
														filterEvent="onblur" >
														<f:facet name="header"  >
																<h:outputText styleClass="instance" value="#{msg.Gen_Reference_Number}"  />
														</f:facet>
														<a4j:commandLink styleClass="tableCommandLink" reRender="panel"
															oncomplete="javascript:Richfaces.showModalPanel('panel');"
															actionListener="#{incomingVisaTransactionSearchBB.selectId}" >
														<h:inputText value="#{event.id.acquirerReferenceNumber}" readonly="true" styleClass="inputTextLink"  />
														</a4j:commandLink>
														
													</rich:column>

													<rich:column  sortable="true"
														sortBy="#{event.id.sequenceNumber}" filterBy="#{event.id.sequenceNumber}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_seqNum}" />
														</f:facet>
														
														<h:inputText styleClass="inputTextWording2" value="#{event.id.sequenceNumber}" readonly="true" />
														
													</rich:column>
													
													
													<rich:column sortable="true"
														sortBy="#{event.businessDate}" filterBy="#{event.businessDate}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_businessDate}"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.businessDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														
													</rich:column>
													
													
													<rich:column sortable="true"
														sortBy="#{event.valueDate}" filterBy="#{event.valueDate}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_valueDate}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.valueDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														
													</rich:column>
													
												
													<rich:column  sortable="true"
														sortBy="#{event.reversalFlag}" filterBy="#{event.reversalFlag}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_reversalFlag}" />
														</f:facet>
													
														<h:selectOneMenu value="#{event.reversalFlag}" disabled="true">
														<f:selectItem itemLabel=""	itemValue="" />
														<f:selectItem  itemLabel="#{msg.Gen_RFN}" itemValue="N"/>
														<f:selectItem  itemLabel="#{msg.Gen_RFR}" itemValue="R"/>
													</h:selectOneMenu>
													</rich:column>
													
													
													<rich:column sortable="true"
														sortBy="#{event.cardNumber}" filterBy="#{event.cardNumber}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_cardNumber}"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.cardNumber}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.expiryDate}" filterBy="#{event.expiryDate}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_expireDate}"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.expiryDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.cardProduct}" filterBy="#{event.cardProduct}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_cardproduct}"/>
														</f:facet>
														
														<h:selectOneMenu value="#{event.cardProduct}" disabled="true">
														
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.cardProductListSI}"/>
															
														</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.transactionAmount}" filterBy="#{event.transactionAmount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactAmount}"/>
														</f:facet>
														<h:inputText dir="RTL" styleClass="inputTextWording2" value="#{event.transactionAmount}" readonly="true"/>
													</rich:column>

													<rich:column  sortable="true"
														sortBy="#{event.transactionCurrency}" filterBy="#{event.transactionCurrency}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactCurrency }"/>
														</f:facet>
														<h:selectOneMenu disabled="true" value="#{event.transactionCurrency}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
															
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.transactionCurrencyExp}" filterBy="#{event.transactionCurrencyExp}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactCurrExpo }"/>
														</f:facet>
														<h:inputText  styleClass="inputTextWording2" value="#{event.transactionCurrencyExp}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.localAmount}" filterBy="#{event.localAmount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_localAmount }"/>
														</f:facet>
														<h:inputText dir="RTL" styleClass="inputTextWording2" value="#{event.localAmount}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.localCurrency}" filterBy="#{event.localCurrency}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_localCurrency }"/>
														</f:facet>
															<h:selectOneMenu disabled="true" value="#{event.localCurrency}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
															
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.localCurrencyExp}" filterBy="#{event.localCurrencyExp}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_localCurrExpo }"/>
														</f:facet>
														<h:inputText  styleClass="inputTextWording2" value="#{event.localCurrencyExp}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.billingAmount}" filterBy="#{event.billingAmount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_billingAmount }"/>
														</f:facet>
														<h:inputText dir="RTL" styleClass="inputTextWording2" value="#{event.billingAmount}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.billingCurrency}" filterBy="#{event.billingCurrency}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_billingCurrency }"/>
														</f:facet>
														<h:selectOneMenu disabled="true" value="#{event.billingCurrency}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
															
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column  sortable="true"
														sortBy="#{event.billingCurrencyExp}" filterBy="#{event.billingCurrencyExp}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_billingCurrExpo }"/>
														</f:facet>
														<h:inputText  styleClass="inputTextWording2" value="#{event.billingCurrencyExp}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.settlementAmount}" filterBy="#{event.settlementAmount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_settlementAmount }"/>
														</f:facet>
														<h:inputText dir="RTL" styleClass="inputTextWording2" value="#{event.settlementAmount}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.settlementCurrency}" filterBy="#{event.settlementCurrency}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_settlementCurrency }"/>
														</f:facet>
														<h:selectOneMenu disabled="true" value="#{event.settlementCurrency}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
															
														</h:selectOneMenu>
													</rich:column>
													
													<rich:column  sortable="true"
														sortBy="#{event.settlementCurrencyExp}" filterBy="#{event.settlementCurrencyExp}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_settlementCurrExpo }"/>
														</f:facet>
														<h:inputText  styleClass="inputTextWording2" value="#{event.settlementCurrencyExp}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.mcc}" filterBy="#{event.mcc}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_mcc }"/>
														</f:facet>
														
														<h:selectOneMenu disabled="true" value="#{event.mcc}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.mccListSI}"/>
															
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.merchantLocation}" filterBy="#{event.merchantLocation}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_merchantLocation }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.merchantLocation}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.posData}" filterBy="#{event.posData}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_posData }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.posData}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.transactionDate}" filterBy="#{event.transactionDate}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactDate }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.transactionDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.cardBillingAccount}" filterBy="#{event.cardBillingAccount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_cardBillingAccount }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.cardBillingAccount}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.transactionCode}" filterBy="#{event.transactionCode}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactCode }"/>
														</f:facet>
															<h:selectOneMenu disabled="true" value="#{event.transactionCode}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.transactTypeListSI}"/>
															</h:selectOneMenu>
														
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.interchangeFeeId}" filterBy="#{event.interchangeFeeId}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_interchangeFeeIndicator }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.interchangeFeeId}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.interchangeFeeAmount}" filterBy="#{event.interchangeFeeAmount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_interchangeFeeAmount }"/>
														</f:facet>
														<h:inputText dir="RTL" styleClass="inputTextWording2" value="#{event.interchangeFeeAmount}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.interchangeFeeCurrency}" filterBy="#{event.interchangeFeeCurrency}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_interchangeFeeCurrency }"/>
														</f:facet>
														<h:selectOneMenu disabled="true" value="#{event.interchangeFeeCurrency}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
															
														</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.interchangeCurrencyExp}" filterBy="#{event.interchangeCurrencyExp}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_interchangeFeeCurrExpo }"/>
														</f:facet>
														<h:inputText  styleClass="inputTextWording2" value="#{event.interchangeCurrencyExp}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.issuerFeeAmount}" filterBy="#{event.issuerFeeAmount}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_issuerFeeAmount }"/>
														</f:facet>
														<h:inputText dir="RTL" styleClass="inputTextWording2" value="#{event.issuerFeeAmount}" readonly="true"/>
													</rich:column>
													
													<rich:column  sortable="true"
														sortBy="#{event.issuerFeeCurrency}" filterBy="#{event.issuerFeeCurrency}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_issuerFeeCurrency }"/>
														</f:facet>
														<h:selectOneMenu disabled="true" value="#{event.issuerFeeCurrency}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
															
														</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.issuerFeeCurrencyExp}" filterBy="#{event.issuerFeeCurrencyExp}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_issuerFeeCurrExpo }"/>
														</f:facet>
														<h:inputText  styleClass="inputTextWording2" value="#{event.issuerFeeCurrencyExp}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.authorizationCode}" filterBy="#{event.authorizationCode}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_authorizationCode }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.authorizationCode}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.matchingFlag}" filterBy="#{event.matchingFlag}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactMactchingFlag }"/>
														</f:facet>
													
														<h:selectOneMenu value="#{event.matchingFlag}" disabled="true">
													<f:selectItem itemLabel=""	itemValue="" />
													<f:selectItem  itemLabel="#{msg.Gen_MFM}" itemValue="M"/>
													<f:selectItem  itemLabel="#{msg.Gen_MFU}" itemValue="U"/>
												</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.authorizationArn}" filterBy="#{event.authorizationArn}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_AuthorizAcqReferenceNumber }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.authorizationArn}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.intAuthorizationArn}" filterBy="#{event.intAuthorizationArn}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_internalAuthorizAcqReferenceNumber }"/>
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.intAuthorizationArn}" readonly="true"/>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.transactionOrigin}" filterBy="#{event.transactionOrigin}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_transactOrigin }"/>
														</f:facet>
														
														<h:selectOneMenu value="#{event.transactionOrigin}" disabled="true">
													<f:selectItem itemLabel=""	itemValue="" />
													<f:selectItem  itemLabel="#{msg.Gen_local}" itemValue="L"/>
													<f:selectItem  itemLabel="#{msg.Gen_TON}" itemValue="N"/>
													<f:selectItem  itemLabel="#{msg.Gen_TOF}" itemValue="F"/>
												</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.remittanceType}" filterBy="#{event.remittanceType}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_RemittanceType}" />
														</f:facet>
														<h:selectOneMenu value="#{event.remittanceType}" disabled="true">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItem  itemLabel="#{msg.Gen_Manual}" itemValue="M"/>
															<f:selectItem  itemLabel="#{msg.Gen_Pos}" itemValue="P"/>
															<f:selectItem  itemLabel="#{msg.Gen_Atm}" itemValue="A"/>
															<f:selectItem  itemLabel="#{msg.Gen_Internet}" itemValue="I"/>
													</h:selectOneMenu>
													</rich:column>
													
													<rich:column sortable="true"
														sortBy="#{event.productType}" filterBy="#{event.productType}"
														filterEvent="onblur">
														<f:facet name="header">
															<h:outputText styleClass="instance" value="#{msg.Gen_ProductType}" />
														</f:facet>
														<h:selectOneMenu value="#{event.productType}" disabled="true">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItem  itemLabel="#{msg.Gen_PTD}" itemValue="D"/>
															<f:selectItem  itemLabel="#{msg.Gen_PTC}" itemValue="C"/>
													</h:selectOneMenu>
													</rich:column>
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.networkType}" filterBy="#{event.networkType}"
														filterEvent="onblur" styleClass="tile" label="#{msg.Gen_Network}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.Gen_Network}"  />
														</f:facet>
																													
															<h:selectOneMenu disabled="true" value="#{event.networkType}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.networkListSI}"/>
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.acquirerBank}" filterBy="#{event.acquirerBank}"
														filterEvent="onblur" styleClass="tile" label="#{msg.accountingParam_acqBankCode}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.accountingParam_acqBankCode}"  />
														</f:facet>
																													
															<h:selectOneMenu disabled="true" value="#{event.acquirerBank}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.bankListSI}"/>
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.issuerBank}" filterBy="#{event.issuerBank}"
														filterEvent="onblur" styleClass="tile" label="#{msg.accountingParam_issuerBankCode}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.accountingParam_issuerBankCode}"  />
														</f:facet>
																													
															<h:selectOneMenu disabled="true" value="#{event.issuerBank}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.bankListSI}"/>
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.issuerBranchCode}" filterBy="#{event.issuerBranchCode}"
														filterEvent="onblur" styleClass="tile" label="#{msg.Gen_issuerBranch}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.Gen_issuerBranch}"  />
														</f:facet>
																													
															<h:selectOneMenu disabled="true" value="#{event.issuerBranchCode}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.brachListSI}"/>
															</h:selectOneMenu>
													</rich:column>
													
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.acquirerCountry}" filterBy="#{event.acquirerCountry}"
														filterEvent="onblur" styleClass="tile" label="#{msg.Gen_AcqCountryCode}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.Gen_AcqCountryCode}"  />
														</f:facet>
																													
															<h:selectOneMenu disabled="true" value="#{event.acquirerCountry}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyCountryListSI}"/>
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.issuerCountry}" filterBy="#{event.issuerCountry}"
														filterEvent="onblur" styleClass="tile" label="#{msg.gen_issuerCountry}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.gen_issuerCountry}"  />
														</f:facet>
																													
															<h:selectOneMenu disabled="true" value="#{event.issuerCountry}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyCountryListSI}"/>
															</h:selectOneMenu>
													</rich:column>
													
													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.authoFlag}" filterBy="#{event.authoFlag}"
														filterEvent="onblur" styleClass="tile" label="#{msg.Gen_AuthoFlag}"  >
														<f:facet name="header" >
															<h:outputText value="#{msg.Gen_AuthoFlag}"  />
														</f:facet>
																													
															<h:selectOneMenu value="#{event.authoFlag}" disabled="true">
															<f:selectItem  itemLabel="" itemValue=""/>
															<f:selectItem  itemLabel="#{msg.Gen_MFM}" itemValue="M"/>
															<f:selectItem  itemLabel="#{msg.Gen_MFU}" itemValue="U"/>
														</h:selectOneMenu>
													</rich:column>
													

												</rich:dataTable>
												<table width="100%"><tr><td align="center"><t:dataScroller id="ds" for="sampleData" fastStep="10" pageCountVar="pageCount" pageIndexVar="pageIndex" styleClass="scroller" paginator="true" paginatorMaxPages="9" paginatorTableClass="paginator" paginatorActiveColumnStyle="font-weight:bold;"><f:facet name="first" ><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-first.gif" border="1" /></f:facet><f:facet name="last"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-last-dis.gif" border="1" /></f:facet><f:facet name="previous"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-previous.gif" border="1" /></f:facet><f:facet name="next"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-next-dis.gif" border="1" /></f:facet><f:facet name="fastforward"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-ff-dis.gif" border="1" /></f:facet><f:facet name="fastrewind"><t:graphicImage url="#{facesContext.externalContext.requestContextPath}/images/arrow-fr.gif" border="1" /></f:facet></t:dataScroller></td></tr></table>
											</rich:panel>
											</h:panelGrid>
											</td>
											</tr>
										</table>
										</td>
									</tr>

								</tbody>
							</table>
							</td>
						</tr>
						<tr height="8px">

						</tr>
						<tr>
							<td>

										<table width="100%" class="buttonPanel">
											<tr>
												<td width="60%"></td>
												<td align="left" ><h:commandButton value="Back"
										action="#{incomingVisaTransactionSearchBB.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
												
											</tr>
										</table>
							

							</td>
						</tr>

					</table>
					</td>
			</table>
		</table>
	</a4j:form>
	<a4j:region>
		<rich:modalPanel id="panel" resizeable="false"
			style="background-color:#BAD9EF;" width="1100" height="410"
			keepVisualState="false">
			<f:facet name="header">
				<h:outputLabel value="#{msg.E_P_S}" />
			</f:facet>
			<f:facet name="controls">
				<h:graphicImage
					value="#{facesContext.externalContext.requestContextPath}/images/close.png"
					style="cursor:pointer"
					onclick="Richfaces.hideModalPanel('panel')" />
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
												<td class="instance" width="20%" ><h:outputText
													value="#{msg.Gen_Reference_Number}" /></td>
												<td width="30%" ><h:inputText styleClass="inputTextWording2" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.id.acquirerReferenceNumber}"  size="25" readonly="true"/></td>
												
												<td class="instance" width="20%"><h:outputText
													value="#{msg.Gen_seqNum}" /></td>
												<td width="30%">
												<h:inputText styleClass="inputTextWording2" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.id.sequenceNumber}"  size="3" readonly="true"/>
												</td>
											
											</tr>

						<tr style="height:20px"></tr>
					</tbody>
					</table>
					<table width="100%" class="tile">
						<thead>
						<tr>
							<td class="title"><h:outputLabel value="#{msg.Gen_Informations}" /></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="instance">
							<rich:tabPanel id="tabPanel"
								switchType="client" contentClass="tile">
								<rich:tab id="panel1" styleClass="tabPanel" label="#{msg.Gen_transact_data}">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%" >
															<h:outputText  value="#{msg.Gen_transactDate }"/>
														</td><td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.transactionDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Gen_valueDate}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.valueDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
													
													</tr>
													<tr>
														<td class="instance" width="20%" ><h:outputText value="#{msg.Gen_businessDate}" /></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.businessDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>
											
														<td class="instance" width="20%"><h:outputText value="#{msg.Gen_reversalFlag}" /></td>
														<td width="30%">
														<h:selectOneRadio disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.reversalFlag}" styleClass="panelRadio">
														<f:selectItem  itemLabel="#{msg.Gen_RFN}" itemValue="N"/>
														<f:selectItem  itemLabel="#{msg.Gen_RFR}" itemValue="R"/>
														</h:selectOneRadio>
														</td>
												
													</tr>

												
													<tr>
														<td class="instance" width="20%" ><h:outputText  value="#{msg.Gen_transactCode }"/></td>
														<td width="30%">
														<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.transactionCode}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.transactTypeListSI}"/>
															</h:selectOneMenu>
													
														</td>
													
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_transactOrigin }"/></td>
														<td width="30%">
														<h:selectOneMenu  value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.transactionOrigin}" disabled="true">
														<f:selectItem itemLabel=""	itemValue="" />
														<f:selectItem  itemLabel="#{msg.Gen_TON}" itemValue="N"/>
														<f:selectItem  itemLabel="#{msg.Gen_TOF}" itemValue="F"/>
														</h:selectOneMenu>
													
													</tr>
													<tr>
													
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_posData }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.posData}" />
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_RemittanceType }"/></td>
														<td width="30%">
														<h:selectOneMenu value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.remittanceType}" disabled="true">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItem  itemLabel="#{msg.Gen_Manual}" itemValue="M"/>
															<f:selectItem  itemLabel="#{msg.Gen_Pos}" itemValue="P"/>
															<f:selectItem  itemLabel="#{msg.Gen_Atm}" itemValue="A"/>
															<f:selectItem  itemLabel="#{msg.Gen_Internet}" itemValue="I"/>
													</h:selectOneMenu>
													</td>
													</tr>
													<tr>
													<td class="instance" width="20%" ><h:outputText  value="#{msg.Gen_Network }"/></td>
													<td width="30%">						
															<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.networkType}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.networkListSI}"/>
															</h:selectOneMenu>
													</td>
													
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_interchangeFeeIndicator }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.interchangeFeeId}" />
														</td>
													</tr>
											</table>
									</rich:tab>
								
									<rich:tab id="panel4" styleClass="tabPanel" label="#{msg.Gen_Authorization_data}">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_authorizationCode }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.authorizationCode}" />
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_transactMactchingFlag }"/></td>
														<td width="30%">
														<h:selectOneMenu value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.matchingFlag}" disabled="true">
														<f:selectItem itemLabel=""	itemValue="" />
														<f:selectItem  itemLabel="#{msg.Gen_MFM}" itemValue="M"/>
														<f:selectItem  itemLabel="#{msg.Gen_MFU}" itemValue="U"/>
														</h:selectOneMenu>
														
														</td>
														
														</tr>
														<tr>
														
														<td class="instance"  width="20%"><h:outputText  value="#{msg.Gen_internalAuthorizAcqReferenceNumber }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.intAuthorizationArn}" />
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_AuthorizAcqReferenceNumber }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.authorizationArn}" />
														</td>
														
													</tr>
													<tr>
													
													
													<td class="instance" width="20%" ><h:outputText  value="#{msg.Gen_AuthoFlag }"/></td>
													<td width="30%">
															<h:selectOneMenu value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.authoFlag}" disabled="true">
															<f:selectItem  itemLabel="" itemValue=""/>
															<f:selectItem  itemLabel="#{msg.Gen_MFM}" itemValue="M"/>
															<f:selectItem  itemLabel="#{msg.Gen_MFU}" itemValue="U"/>
														</h:selectOneMenu>
												</td>
													</tr>
											</table>
									</rich:tab>
									
									<rich:tab  styleClass="tabPanel" label="#{msg.Gen_acquir_data}">
									<table width="100%" border="0" class="tile">
													
													<tr>
																										
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_Country }"/></td>
													<td width="30%">
													<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.acquirerCountry}">
														<f:selectItem itemValue="" itemLabel=""/>
														<f:selectItems value="#{applicationLists.currencyCountryListSI}"/>
														</h:selectOneMenu>
													</td>
													
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_bank }"/></td>
													<td width="30%">										
															<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.acquirerBank}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.bankListSI}"/>
															</h:selectOneMenu>
														</td>
														
													
													</tr>
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_merchantLocation }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.merchantLocation}" />
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_mcc }"/></td>
														<td width="30%">
														<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.mcc}">
														<f:selectItem itemValue=""/>
														<f:selectItems value="#{applicationLists.mccListSI}"/>
														</h:selectOneMenu>
														</td>
														
													</tr>
													
													
											</table>
									</rich:tab>
									<rich:tab  styleClass="tabPanel" label="#{msg.Gen_issuer_data}">
									<table width="100%" border="0" class="tile">
													<tr>
													<td class="instance" width="20%" ><h:outputText  value="#{msg.Gen_Country }"/></td>
													<td width="30%">
															<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.issuerCountry}">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItems value="#{applicationLists.currencyCountryListSI}"/>
															</h:selectOneMenu>
													</td>
													
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_bank }"/></td>
													<td width="30%">			
														<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.issuerBank}">
														<f:selectItem itemLabel=""	itemValue="" />
														<f:selectItems value="#{applicationLists.bankListSI}"/>
														</h:selectOneMenu>
													</td>
													
													</tr>
													<tr>
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_branch }"/></td>
													<td width="30%">
														<h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.issuerBranchCode}">
														<f:selectItem itemLabel=""	itemValue="" />
														<f:selectItems value="#{applicationLists.brachListSI}"/>
														</h:selectOneMenu>
													</td>
													
													<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_ProductType }"/></td>
													<td width="30%">
														<h:selectOneMenu value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.productType}" disabled="true">
															<f:selectItem itemLabel=""	itemValue="" />
															<f:selectItem  itemLabel="#{msg.Gen_PTD}" itemValue="D"/>
															<f:selectItem  itemLabel="#{msg.Gen_PTC}" itemValue="C"/>
													</h:selectOneMenu>
													</td>
												
													</tr>
													<tr>
														<td class="instance" width="20%" ><h:outputText value="#{msg.Gen_cardNumber}" /></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.cardNumber}" maxlength="22" size="24" />
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Gen_expireDate}"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.expiryDate}" readonly="true">
														<f:convertDateTime pattern="dd/MM/yyyy"/>
														</h:inputText>
														</td>						
											
													</tr>
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_cardBillingAccount }"/></td>
														<td width="30%">
														<h:inputText styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.cardBillingAccount}" />
														</td>
														
														<td class="instance" width="20%"><h:outputText value="#{msg.Gen_CardProductCode}" /></td>
														<td width="30%"><h:selectOneMenu disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.cardProduct}">
															<f:selectItem itemLabel=""/>
															<f:selectItems value="#{applicationLists.cardProductListSI}"/>
														</h:selectOneMenu></td>
														
													</tr>
													
											</table>
									</rich:tab>
									
									<rich:tab id="panel5" styleClass="tabPanel" label="#{msg.Gen_Amount}">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%"><h:outputText   value="#{msg.Gen_transactAmount}"/></td>
														<td width="30%">
														<h:inputText dir="RTL" id="trx_amount" styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.transactionAmount}" >
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="trx_amount" />
															</h:inputText>
														</td >
														
														<td class="instance"  width="20%"><h:outputText  value="#{msg.Gen_transactCurrency}"/></td>
														<td width="30%">
														<h:selectOneMenu  disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.transactionCurrency}" >
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
														</h:selectOneMenu>
														</td >
														
														
														</tr>
														<tr>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_billingAmount }"/></td>
														<td width="30%">
														<h:inputText dir="RTL" id="bill_amount" styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.billingAmount}" >
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="bill_amount" />
															</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_billingCurrency}"/></td>
														<td width="30%">
														<h:selectOneMenu  disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.billingCurrency}" >
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
														</h:selectOneMenu>
													</td>
													
														
														
													</tr>
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_localAmount }"/></td>
														<td width="30%">
														<h:inputText dir="RTL" id="lcl_amount" styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.localAmount}" >
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="lcl_amount" />
															</h:inputText>
														</td>
														
														<td class="instance" width="20%" ><h:outputText  value="#{msg.Gen_localCurrency}"/></td>
														<td width="30%">
														<h:selectOneMenu  disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.localCurrency}" >
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
														</h:selectOneMenu>
													</td>
													
													
													</tr>
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_settlementAmount }"/></td>
														<td width="30%">
														<h:inputText dir="RTL" id="settle_amount" styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.settlementAmount}" >
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="settle_amount" />
															</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_settlementCurrency}"/></td>
														<td width="30%">
														<h:selectOneMenu  disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.settlementCurrency}" >
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
														</h:selectOneMenu>
													</td>
													
														
													</tr>
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_issuerFeeAmount }"/></td>
														<td width="30%">
														<h:inputText dir="RTL" id="issuer_amount" styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.issuerFeeAmount}" >
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="issuer_amount" />
															</h:inputText>
														</td>
														
														<td class="instance" width="20%" ><h:outputText  value="#{msg.Gen_issuerFeeCurrency }"/></td>
														<td width="30%">
														<h:selectOneMenu  disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.issuerFeeCurrency}" >
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
														</h:selectOneMenu>
														
														</td>
														
														
													</tr>
													<tr>
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_interchangeFeeAmount }"/></td>
														<td width="30%">
														<h:inputText dir="RTL" id="inter_amount" styleClass="inputTextWording2" readonly="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.interchangeFeeAmount}" >
														<f:converter converterId="FeesConverter" />
														<a4j:support event="onblur" ajaxSingle="true"
															reRender="inter_amount" />
															</h:inputText>
														</td>
														
														<td class="instance" width="20%"><h:outputText  value="#{msg.Gen_interchangeFeeCurrency }"/></td>
														<td width="30%">
														<h:selectOneMenu  disabled="true" value="#{incomingVisaTransactionSearchBB.incomingVisaTransactionAPASSER.interchangeFeeCurrency}" >
															<f:selectItem itemValue=""/>
															<f:selectItems value="#{applicationLists.currencyFeesListSI}"/>
														</h:selectOneMenu>
														
														</td>
													
														
													</tr>
													
											</table>
									</rich:tab>
									
									<rich:tab id="panel6" styleClass="tabPanel" label="#{msg.Gen_msg}">
									<table width="100%" border="0" class="tile">
													<tr>
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_ChipData}" />
														</td>
														
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr0}" />
														</td>
														
													</tr>
														<tr>
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr1}" />
														</td>
														
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr2}" />
														</td>
														
														
														
													</tr>
													<tr>
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr3}" />
														</td>
														
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr4}" />
														</td>
													</tr>
													
													<tr>
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr5}" />
														</td>
														
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr6}" />
														</td>
													</tr>
													<tr>
														<td class="instance" width="20%"></td>
														<td>
														<h:commandButton  value="#{msg.Gen_MsgTcr7}" />
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
	</body>




</html>
</f:view>
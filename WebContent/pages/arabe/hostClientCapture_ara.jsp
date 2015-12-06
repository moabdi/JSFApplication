<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>
	<style>
	table#Arabe TD {
		text-align: right;
		width: 20%;
	}
	</style>
	<meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<link rel="stylesheet" href="../../charte/css/eps.css" type="text/css">
	</head>
	<body class="body">
	<h:form>
		<%@ include file="/commun/header.jsp"%>
	</h:form>
	<h:form id="myForm">

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
											value="#{msg.hostClient}" /></td>
										<td width="40%" align="right"><h:outputText
											value="#{msg.hostClient_capture}"
											rendered="#{hostClientBackingBean.addStatus}" /> <h:outputText
											value="#{msg.hostClient_modify}"
											rendered="#{hostClientBackingBean.modifyStatus}" /></td>
										<td width="1%">&nbsp;</td>
									</tr>
								</table>
								</td>
							</tr>
						</table>
						</td>

					</tr>
					<tr>
						<td valign="top" class="zoneTravail"><a4j:region>
							<rich:messages id="msg" showDetail="true" showSummary="false"  infoClass="infoMessage"
								errorClass="errorMessage" layout="list">
							</rich:messages>
						</a4j:region></td>
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
												<td width="30%" class="instance"><h:selectOneMenu required="true" requiredMessage="Branche is required"
														id="branchCodeSelectOneMenu"
														disabled="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.branchCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.brachListSI}" />
														<a4j:support event="onchange" reRender="lbl_branchCode"></a4j:support>
														</h:selectOneMenu>
													</td>
													<td width="20%"><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /><h:outputLabel
														value="#{msg.Gen_branchCode}" /><h:outputLabel styleClass="codelbl" id="lbl_branchCode"
														value="#{hostClientBackingBean.branchCode}"></h:outputLabel></td>
														
													<td width="30%" class="instance"><h:selectOneMenu required="true" requiredMessage="Bank is required"
														id="bankCodeSelectOneMenu"
														disabled="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.bankCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.bankListSI}" />
														<a4j:support event="onchange"
															actionListener="#{hostClientBackingBean.refreshBranch}"
															ajaxSingle="true"
															reRender="branchCodeSelectOneMenu,lbl_bankCode,lbl_branchCode"
															limitToList="true" />
													</h:selectOneMenu></td>
													<td width="20%"><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" />
													<h:outputLabel styleClass="codelbl" id="lbl_bankCode"
														value="#{hostClientBackingBean.bankCode}" /><h:outputLabel
														value="#{msg.Gen_bankCode}" /></td>
												
												</tr>

												<tr>
													<td class="instance">
														<h:inputText maxlength="24" id="client_number"
														disabled="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.clientNumber}"
														autocomplete="off" style=" width : 208px;">
														<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
														<f:validator validatorId="mustBeNumber"/>
													</h:inputText>
													<rich:message
															for="client_number" styleClass="warnningMessage" />
													</td>
													<td ><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
														value="#{msg.Gen_Client_Number}" /></td>
													
													<td class="instance"><h:selectOneMenu id="statusReasonId"
														disabled="#{hostClientBackingBean.modifyStatus}"
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.statusReason}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems
															value="#{applicationLists.statusReasonListSI}" />

													</h:selectOneMenu></td>
													<td ><h:outputText
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{msg.Gen_StatusReason}" /></td>
												</tr>

												<tr>
													<td class="instance"><rich:calendar disabled="#{hostClientBackingBean.modifyStatus}"													
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.statusDate}">
													</rich:calendar></td>
													<td ><h:outputText
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{msg.Gen_Status_date}" /></td>
													
													<td class="instance"><h:selectOneMenu id="statusClientSelectOneMenu"
														rendered="#{hostClientBackingBean.modifyStatus}"
														disabled="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.statusClient}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItem itemLabel="Normal" itemValue="N" />
														<f:selectItem itemLabel="Dormant" itemValue="D" />
														<f:selectItem itemLabel="Cancelled" itemValue="C" />
														<f:selectItem itemLabel="Prospect" itemValue="P" />
														<f:selectItem itemLabel="Monitoring" itemValue="M" />
														<f:selectItem itemLabel="Suspended" itemValue="S" />
														<f:selectItem itemLabel="Others" itemValue="O" />
														<a4j:support event="onchange"
															actionListener="#{hostClientBackingBean.refreshStatus}"
															ajaxSingle="true" reRender="branchSelectOneMenu" />
													</h:selectOneMenu></td>
													<td ><h:outputText
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{msg.Gen_Client_Status}" /></td>
												</tr>

												<tr>
													<td id="France"><rich:calendar
														disabled="#{hostClientBackingBean.modifyStatus}"
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{hostClientBackingBean.joiningDate}">
													</rich:calendar></td>
													<td class="instance"><h:outputText
														rendered="#{hostClientBackingBean.modifyStatus}"
														value="#{msg.Gen_Joining_date}" /></td>
												</tr>

											</table>
											<table class="tile">
												<thead>
													<tr style="height: 13px;">
														<td class="title" width="173"><h:outputLabel
															value="#{msg.Gen_Details}" /></td>
													</tr>
												</thead>
											</table>

											<table class="tile">
												<tr>
													<td class="instance"><rich:tabPanel
														switchType="client" contentClass="tile" height="200px">
														<rich:tab styleClass="tabPanel"
															label="#{msg.Gen_Customer_information}" disabled="false">


															<table width="100%">



																<tr>

																	<td width="30%" class="instance" ><h:selectOneMenu
																		id="titleSelectOneMenu"
																		value="#{hostClientBackingBean.titleCardholder}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Mister" itemValue="Mr." />
																		<f:selectItem itemLabel="Misers" itemValue="Mrs." />
																		<f:selectItem itemLabel="Miss" itemValue="Miss." />
																		<f:selectItem itemLabel="Doctor" itemValue="Dh." />
																		<f:selectItem itemLabel="Director" itemValue="Dr." />
																		<f:selectItem itemLabel="Minister"
																			itemValue="Minister." />
																		<f:selectItem itemLabel="Professor" itemValue="Pr." />
																		<f:selectItem itemLabel="Emir" itemValue="Emir." />
																		</h:selectOneMenu></td>
																	<td width="20%"><h:outputText
																		value="#{msg.Gen_Title}" /></td>

																	<td width="30%" class="instance" ><h:selectOneMenu required="true" requiredMessage="Address 1 is required"
																		id="genderSelectOneMenu"
																		value="#{hostClientBackingBean.gender}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Male" itemValue="M" />
																		<f:selectItem itemLabel="Female" itemValue="F" />
																		<f:selectItem itemLabel="Not defined" itemValue="N" />

																	</h:selectOneMenu></td>
																	<td width="20%"><h:outputText
																		value="#{msg.Gen_Gender}" /></td>
																</tr>


																<tr>

																	<td  class="instance"><h:inputText
																		value="#{hostClientBackingBean.firstName}"
																		autocomplete="off" id="firstNameId"
																		style=" width : 240px;">
																	</h:inputText></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_firstName}" /></td>
																	
																	<td class="instance"><h:inputText
																		value="#{hostClientBackingBean.familyName}"
																		autocomplete="off" id="familyNameId"
																		style=" width : 240px;">

																	</h:inputText></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_familyName}" /></td>
																</tr>
																<tr>
																	<td class="instance"><h:inputText
																		value="#{hostClientBackingBean.maidenName}"
																		autocomplete="off" id="maidenNameId"
																		style=" width : 240px;">


																	</h:inputText></td>
																	<td ><h:outputText
																		value="#{msg.Gen_maidenName}" /></td>
																	

																	<td class="instance"><rich:calendar
																		value="#{hostClientBackingBean.birthDate}"
																		id="birthDateId">

																	</rich:calendar></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_birthDate}" /></td>
																</tr>

																<tr>

																	<td class="instance"><h:selectOneMenu
																		value="#{hostClientBackingBean.birtyCity}"
																		id="CityListId1">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />

																		<f:selectItems
																			value="#{hostClientBackingBean.birthCityListSI}" />

																	</h:selectOneMenu> <h:panelGroup id="CityMessage">

																	</h:panelGroup></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Birth_City}" /></td>
																		
																	<td class="instance"><h:selectOneMenu id="CountrySelectID"
																		value="#{hostClientBackingBean.birthCountry}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{applicationLists.countryListSI}" />

																		<a4j:support event="onchange" ajaxSingle="true"
																			actionListener="#{hostClientBackingBean.refreshCity}"
																			reRender="CityListId1" limitToList="true">
																		</a4j:support>

																	</h:selectOneMenu></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Birth_Country}" /></td>
							

																</tr>

																<tr>
																	
																	<td class="instance"><h:selectOneMenu
																		id="documentCodeSelectOneMenu"
																		value="#{hostClientBackingBean.documentCode}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Passport" itemValue="PA" />
																		<f:selectItem itemLabel="Civil Id" itemValue="CI" />
																		<f:selectItem itemLabel="Certificat" itemValue="CR" />
																		<f:selectItem itemLabel="Drive license" itemValue="DL" />
																		<f:selectItem itemLabel="Other" itemValue="OT" />

																	</h:selectOneMenu></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_Document_Code}" /></td>

																	
																	<td class="instance"><h:inputText
																		value="#{hostClientBackingBean.documentId}"
																		autocomplete="off" id="documentId">
																	</h:inputText></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Document_Id}" /></td>

																</tr>
																<tr>

																	
																	<td class="instance"><h:selectOneMenu
																		id="motherTongueSelectOneMenu"
																		value="#{hostClientBackingBean.motherTongue}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="%" />
																		<f:selectItems value="#{applicationLists.langListSI}" />

																	</h:selectOneMenu></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_Mother_Tongue}" /></td>

																	
																	<td class="instance"><h:selectOneMenu id="clientTypeSelectOneMenu"
																		value="#{hostClientBackingBean.clientType}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Company" itemValue="C" />
																		<f:selectItem itemLabel="Individual" itemValue="I" />
																		<f:selectItem itemLabel="Bank Staff" itemValue="S" />

																	</h:selectOneMenu></td>
																	<td ><h:outputText
																		value="#{msg.Gen_Client_Type}" /></td>
																</tr>

																<tr>

																	<td class="instance"><h:selectOneMenu id="nationalitySelectID"
																		value="#{hostClientBackingBean.nationality}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{applicationLists.countryListSI}" />

																	</h:selectOneMenu></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_Nationality}" /></td>

																	
																	<td class="instance"><h:selectOneMenu
																		id="familialSituationSelectOneMenu"
																		value="#{hostClientBackingBean.familialSituation}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Single" itemValue="S" />
																		<f:selectItem itemLabel="Married" itemValue="M" />
																		<f:selectItem itemLabel="Divorced" itemValue="D" />
																		<f:selectItem itemLabel="Widow" itemValue="W" />
																		<f:selectItem itemLabel="Not defined" itemValue="N" />

																	</h:selectOneMenu></td>
																	<td ><h:outputText
																		value="#{msg.Gen_Familial_Situation}" /></td>
																</tr>

																<tr>
																	<td class="instance"><h:inputText
																		value="#{hostClientBackingBean.numberOfChildren}"
																		autocomplete="off" id="numberOfChildrenId">

																	</h:inputText></td>
																	<td ><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_Number_Of_Children}" /></td>
																	

																</tr>

															</table>
														</rich:tab>
														<rich:tab styleClass="tabPanel" label="#{msg.Gen_Address}"
															disabled="false">


															<table class="tile">
																<thead>
																	<tr style="height: 13px;">
																		<td class="title" width="173"><h:outputLabel
																			value="#{msg.Gen_Address1}" /></td>
																	</tr>
																</thead>
															</table>

															<table class="tile">

																<tr>

																	<td width="10%" class="instance"><h:selectOneMenu
																		id="typeAddress1ID"
																		value="#{hostClientBackingBean.typeAddress1}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Mailing address"
																			itemValue="H" />
																		<f:selectItem itemLabel="Statement address"
																			itemValue="S" />
																		<f:selectItem itemLabel="Delivery card" itemValue="D" />
																		<f:selectItem itemLabel="ALL" itemValue="A" />
																	</h:selectOneMenu></td>
																	<td width="12%"><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_Address1_Type}" /></td>

																	<td width="16%" class="instance"><h:selectOneMenu
																		id="countryCode1SelectID" required="true" requiredMessage="Address 1 is required"
																		value="#{hostClientBackingBean.countryCode1}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{hostClientBackingBean.address1CountryListSI}" />


																		<a4j:support event="onchange" ajaxSingle="true"
																			actionListener="#{hostClientBackingBean.refreshCity1}"
																			reRender="cityCode1ListId"
																			limitToList="true">
																		</a4j:support>
																		<rich:ajaxValidator event="onblur"></rich:ajaxValidator>

																	</h:selectOneMenu> 
																	<rich:message for="countryCode1SelectID" styleClass="warnningMessage" />
																</td>
																<td width="12%"><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_CountryWording}" /></td>

																	
																	<td width="16%" class="instance" ><h:selectOneMenu required="true" requiredMessage="Address 1 is required"
																		value="#{hostClientBackingBean.cityCode1}"
																		id="cityCode1ListId">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{hostClientBackingBean.address1CityListSI}" />

																	</h:selectOneMenu> 
																	<rich:message for="cityCode1ListId" styleClass="warnningMessage" />
																	</td>
																	<td width="12%"><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Accounts_Accounts_Customer_City}" /></td>

																	
																	<td width="20%" class="instance" ><h:inputTextarea
																		id="address1SelectOneMenu"
																		value="#{hostClientBackingBean.address1}">

																	</h:inputTextarea></td>
																	<td width="12%"><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_Address}" /></td>
																</tr>
															</table>
															<table class="tile">
																<thead>
																	<tr style="height: 13px;">
																		<td class="title" width="173"><h:outputLabel
																			value="#{msg.Gen_Address2}" /></td>
																	</tr>
																</thead>
															</table>

															<table class="tile">

																<tr>
						
																	<td class="instance" width="10%"><h:selectOneMenu
																		id="typeAddress2ID"
																		value="#{hostClientBackingBean.typeAddress2}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Mailing address"
																			itemValue="H" />
																		<f:selectItem itemLabel="Statement address"
																			itemValue="S" />
																		<f:selectItem itemLabel="Delivery card" itemValue="D" />
																		<f:selectItem itemLabel="ALL" itemValue="A" />


																	</h:selectOneMenu></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Gen_Address1_Type}" /></td>
							

																	<td class="instance" width="16%"><h:selectOneMenu
																		id="countrycode2SelectID"
																		value="#{hostClientBackingBean.countryCode2}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{hostClientBackingBean.address2CountryListSI}" />


																		<a4j:support event="onchange" ajaxSingle="true"
																			actionListener="#{hostClientBackingBean.refreshCity2}"
																			reRender="countrycode2Message,citycode2ListId"
																			limitToList="true">
																		</a4j:support>


																	</h:selectOneMenu> <h:panelGroup id="countrycode2Message">
																		<h:message for="countrycode2SelectID" />
																	</h:panelGroup></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Gen_CountryWording}" /></td>

																	<td class="instance" width="16%"><h:selectOneMenu
																		value="#{hostClientBackingBean.cityCode2}"
																		id="citycode2ListId">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{hostClientBackingBean.address2CityListSI}" />

																	</h:selectOneMenu> <h:panelGroup id="citycode2Message">

																	</h:panelGroup></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Accounts_Accounts_Customer_City}" /></td>

																	
																	<td class="instance" width="20%"><h:inputTextarea
																		id="address2SelectOneMenu"
																		value="#{hostClientBackingBean.adress2}">

																	</h:inputTextarea></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Gen_Address}" /></td>

																</tr>
															</table>
															<table class="tile">
																<thead>
																	<tr style="height: 13px;">
																		<td class="title" width="173"><h:outputLabel
																			value="#{msg.Gen_Address3}" /></td>
																	</tr>
																</thead>
															</table>

															<table class="tile">

																<tr>
																	
																	<td class="instance" width="10%"><h:selectOneMenu
																		id="typeAddress3ID"
																		value="#{hostClientBackingBean.typeAddress3}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItem itemLabel="Mailing address"
																			itemValue="H" />
																		<f:selectItem itemLabel="Statement address"
																			itemValue="S" />
																		<f:selectItem itemLabel="Delivery card" itemValue="D" />
																		<f:selectItem itemLabel="ALL" itemValue="A" />


																	</h:selectOneMenu></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Gen_Address1_Type}" /></td>
																		
																	
																	<td class="instance" width="16%"><h:selectOneMenu
																		id="countrycode3SelectID"
																		value="#{hostClientBackingBean.countryCode3}">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{hostClientBackingBean.address3CountryListSI}" />


																		<a4j:support event="onchange" ajaxSingle="true"
																			actionListener="#{hostClientBackingBean.refreshCity3}"
																			reRender="countrycode3Message,citycode3ListId"
																			limitToList="true">

																		</a4j:support>


																	</h:selectOneMenu> <h:panelGroup id="countrycode3Message">
																		<h:message for="countrycode3SelectID" />
																	</h:panelGroup></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Gen_CountryWording}" /></td>

																	
																	<td class="instance" width="16%"><h:selectOneMenu
																		value="#{hostClientBackingBean.cityCode3}"
																		id="citycode3ListId">
																		<f:selectItem itemLabel="#{msg.Gen_Select}"
																			itemValue="" />
																		<f:selectItems
																			value="#{hostClientBackingBean.address3CityListSI}" />

																	</h:selectOneMenu> <h:panelGroup id="citycode3Message">

																	</h:panelGroup></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Accounts_Accounts_Customer_City}" /></td>
							
																	<td class="instance" width="20%"><h:inputTextarea
																		id="address3SelectOneMenu"
																		value="#{hostClientBackingBean.address3}">

																	</h:inputTextarea></td>
																	<td width="12%"><h:outputText
																		value="#{msg.Gen_Address}" /></td>

																</tr>

															</table>
															<table class="tile">
																<thead>
																	<tr style="height: 13px;">
																		<td class="title" width="173"><h:outputLabel
																			value="#{msg.Gen_PhoneNumbers}" /></td>
																	</tr>
																</thead>
															</table>

															<table class="tile">
																<tr>
									
																	<td class="instance" width="18%"><h:inputText
																		value="#{hostClientBackingBean.homePhoneNumber}"
																		autocomplete="off" id="homePhoneNumberId"
																		style=" width : 220px;">

																	</h:inputText></td>
																	<td width="16%"><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_HomePhoneNumber}" /></td>

																	
																	<td class="instance" width="17%"><h:inputText
																		value="#{hostClientBackingBean.mobileNumber}"
																		autocomplete="off" id="mobileNumberId"
																		style=" width : 220px;">

																	</h:inputText></td>
																	<td width="16%"><h:outputLabel
																		style="color:red" value="#{msg.Gen_RequireField}" /><h:outputText
																		value="#{msg.Gen_MobileNumber}" /></td>

																	
																	<td class="instance" width="17%"><h:inputText
																		value="#{hostClientBackingBean.workPhoneNumber}"
																		autocomplete="off" id="workPhoneNumberId"
																		style=" width : 220px;">


																	</h:inputText></td>
																	<td width="16%"><h:outputText
																		value="#{msg.Gen_WorkPhoneNumber}" /></td>

																</tr>

															</table>
														</rich:tab>


														<rich:tab styleClass="tabPanel"
															label="#{msg.Gen_Label_Supplementary_Info}"
															disabled="false">
															<table width="100%">
																<tr>

																	<td width="30%" class="instance"><h:inputText
																		value="#{hostClientBackingBean.nameCompanyStaff}"
																		autocomplete="off" id="nameCompanyStaffId">


																	</h:inputText></td>
																	<td width="20%"><h:outputText
																		value="#{msg.Gen_Name_Company_Staff}" /></td>

																	<td width="30%" class="instance"><h:inputText
																		value="#{hostClientBackingBean.codeStaff}"
																		autocomplete="off" id="codeStaffId">
																	</h:inputText></td>
																	<td width="20%"><h:outputText
																		value="#{msg.Gen_Code_Staff}" /></td>

																</tr>


																<tr>

																	<td class="instance"><h:inputText
																		value="#{hostClientBackingBean.clientSalary}"
																		styleClass="AlignRight" autocomplete="off"
																		id="clientSalaryId">
																		<f:validator validatorId="mustBeNumber"></f:validator>

																	</h:inputText></td>
																	<td ><h:outputText
																		value="#{msg.hostClient_salary}" /></td>

																	<td class="instance"><h:inputText
																		value="#{hostClientBackingBean.positionStaff}"
																		autocomplete="off" id="positionStaffId">

																	</h:inputText></td>
																	<td ><h:outputText
																		value="#{msg.Gen_Position_Staff}" /></td>
																</tr>


															</table>
														</rich:tab>

													</rich:tabPanel></td>
												</tr>

											</table>

											<table width="100%" class="tile">
												<tr>
													<td>
													<table width="100%" class="buttonPanel">

														<tr>
															<td>
															<table width="100%" class="buttonPanel">
																<tr>
																	<td width="35%">&nbsp;</td>
																	<td><a4j:commandButton value="Back"
																		onclick="Richfaces.showModalPanel('backPanel2')"
																		immediate="true"
																		rendered="#{hostClientBackingBean.modifyStatus}"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"></a4j:commandButton></td>

																	<td><a4j:commandButton value="Back"
																		rendered="#{hostClientBackingBean.addStatus}"
																		immediate="true"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
																		actionListener="#{hostClientBackingBean.checkChanges}"
																		action="#{hostClientBackingBean.back}"
																		oncomplete="#{hostClientBackingBean.backPanel}">
																	</a4j:commandButton></td>


																	<td><a4j:commandButton value="Refresh"
																		action="#{hostClientBackingBean.refresh}"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
																		rendered="#{hostClientBackingBean.addStatus}">
																	</a4j:commandButton> <a4j:commandButton value="Delete"
																		oncomplete="Richfaces.showModalPanel('deletePanel')"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
																		rendered="#{hostClientBackingBean.modifyStatus}">
																	</a4j:commandButton></td>
																	<td><a4j:commandButton value="Validate"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
																		rendered="#{hostClientBackingBean.addStatus}"
																		action="#{hostClientBackingBean.valider}"
																		reRender="poll2,validatePanel,msg" limitToList="true"
																		status="status_validate">

																	</a4j:commandButton> <a4j:commandButton value="Modify"
																		action="#{hostClientBackingBean.modify}"
																		reRender="poll2,validatePanel,msg" limitToList="true"
																		status="status_validate"
																		image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
																		rendered="#{hostClientBackingBean.modifyStatus}">
																	</a4j:commandButton> <a4j:region>

																		<a4j:poll id="poll" ajaxSingle="true"
																			action="#{hostClientSearchBB.back}"
																			oncomplete="Richfaces.hideModalPanel('validatePanel')"
																			interval="2000"
																			enabled="#{hostClientBackingBean.pollEnabled}"
																			reRender="validatePanel" limitToList="true" />

																		<a4j:poll id="poll2" ajaxSingle="true"
																			oncomplete="Richfaces.hideModalPanel('validatePanel')"
																			interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true"
																			reRender="validatePanel" limitToList="true" />

																	</a4j:region></td>
																</tr>
																<h:outputText value="" escape="false" rendered="false" />
															</table>
															</td>
														</tr>
													</table>
													</td>
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
				</table>
				</td>
			</tr>
		</table>
	</h:form>

	
	</body>

	<a4j:region>
		<rich:modalPanel id="backPanel2" style="background-color: #BAD9EF"
			autosized="true" width="400" height="120">
			<f:facet name="header">
				<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
			</f:facet>
			<f:facet name="controls">
				<h:panelGroup>
					<h:graphicImage
						value="#{facesContext.externalContext.requestContextPath}/images/close.png"
						id="hidelink4" />
					<rich:componentControl for="backPanel2" attachTo="hidelink4"
						operation="hide" event="onclick" />
				</h:panelGroup>
			</f:facet>
			<h:form>
				<table width="100%" class="tile">
					<tbody>

						<tr>
							<td width="30%"><h:graphicImage
								value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif"
								width="32" height="31" /></td>

							<td width="70%"><h:outputLabel styleClass="instance"
								value="#{msg.confirm_back_to_search}" /></td>

						</tr>
				</table>

				<table width="100%" class="tile" align="center">
					<tr style="height: 30px;">


						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}" action="#{hostClientSearchBB.back}"
							onclick="Richfaces.hideModalPanel('backPanel2')"
							style=" width : 67px;" /></td>
						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_cancel}" style=" width : 67px;"
							onclick="Richfaces.hideModalPanel('backPanel2');return false;" />
						</td>
					</tr>
				</table>
			</h:form>
		</rich:modalPanel>
	</a4j:region>


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

				<table width="100%" class="tile" align="center">
					<tr style="height: 30px;">
					<tr>
						<td align="center" width="50%"><h:commandButton
							value="#{msg.Gen_yes}" action="#{hostClientBackingBean.back}"
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
				<table class="tile" width="100%">
					<tr style="height: 30px;">

						<td align="center" width="50%"><a4j:commandButton
							value="#{msg.Gen_yes}" action="#{hostClientBackingBean.delete}"
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
</f:view>
</html>
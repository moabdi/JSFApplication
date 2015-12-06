<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>
  <f:view >
	<html>
		<f:loadBundle var="msg" basename="i18n.messages"/>
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
					<td>
						<table class="titrePage" width="50%">
						  <tr>
							 <td valign="top" class="zoneIdent">
								<table width="100%">
									<tr>
										<td>
											<table width="100%" class="ident">
												<tr>
													<td width="100%" align="left"><h:outputText value="#{msg.customerParam_customerParam}" /></td>
													<td width="100%" align="right"><h:outputText value="#{msg.customerParam_addCustomer}" rendered="#{merchantBC.addStatus}"/></td>
													<td width="100%" align="right"><h:outputText value="#{msg.customerParam_modifyCustomer}" rendered="#{merchantBC.modifyStatus}"/></td>
													<td width="100%">&nbsp;</td>
												</tr>
											</table>
										</td>
									</tr>
							 	</table>
							</td>
						</tr>
						<tr>
							<td valign="top" class="zoneTravail">
								<a4j:region>
									<rich:messages id="msg" showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage" layout="list">
									</rich:messages>
								</a4j:region>
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
														<td class="title"><h:outputText value="#{msg.customerParam_Identification}" /></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<table width="100%">
																<tr>
																	<td class="instance" width="20%"><h:outputLabel value="#{msg.customer_code}" ></h:outputLabel><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%"><h:inputText id="account_number"  disabled ="#{merchantBC.modifyStatus}" value="#{merchantBC.merchantBV.msisdn}" size="15" maxlength="10">
																		<a4j:support  event="onblur" reRender="accountnumber" ajaxSingle="true"
																					  actionListener="#{merchantBC.merchantBV.getNumberaccount}" ></a4j:support>
																		<f:validator validatorId="mustBeNumber"  />
																		<rich:ajaxValidator event="onkeyup" />
																		</h:inputText>
																		<rich:message for="user_code" showSummary="false" styleClass="errorMessage" tooltip="true"/></td>
																	<td class="instance" width="20%" ><h:outputLabel value="#{msg.pin}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%"><h:inputText id="code__user"  disabled ="false" value="#{merchantBC.merchantBV.pin}">
																		<rich:ajaxValidator event="onkeyup"  />
																		</h:inputText>
																		<rich:message for="code__user" showSummary="false" styleClass="errorMessage" tooltip="true"/>
																	</td>
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
											<table class="tile">			
												<thead>
													<tr>
														<td class="title"><h:outputText  value="#{msg.customerParam_Information}" /></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<table width="100%">
																<tr>
																	<td class="instance" width="20%"><h:outputLabel value="#{msg.First_Name}" >
																		</h:outputLabel><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%">
																			<h:selectOneMenu value="#{merchantBC.merchantBV.sexe}" >
																				<f:selectItems value="#{merchantBV.items}" />
																			</h:selectOneMenu>
																	
																			<h:inputText id="first_name" value="#{merchantBC.merchantBV.firstName}">
																			<rich:ajaxValidator event="onkeyup"/>
																			</h:inputText>
																			<rich:message for="user_code" showSummary="false" styleClass="errorMessage" tooltip="true"/>
																	</td>
																	<td class="instance" width="20%"><h:outputLabel value="#{msg.dob}" ></h:outputLabel><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td><rich:calendar id="expiry_Date" value="#{merchantBC.merchantBV.dob}"
																			locale="en"
																			datePattern="dd/MM/yyyy" disabled="#{merchantBV.offcal}"
																			popup="true"
																			direction="auto"
																			zindex="1000"
																			cellWidth="24px" cellHeight="22px" style="width:200px"/>
																	</td>
																</tr>	
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%">
																<tr>
																	<td class="instance" width="20%" ><h:outputLabel
																		value="#{msg.Last_Name}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%"><h:inputText value="#{merchantBC.merchantBV.lastName}" 
																		required="true" requiredMessage="#{msg.branchParam_BranchCode} #{msg.Gen_required}" maxlength="5">
																		<rich:ajaxValidator event="onblur" />
																		 </h:inputText>
																	</td>
																	<td class="instance" width="20%" ><h:outputLabel value="#{msg.CIN}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%"><h:inputText value="#{merchantBC.merchantBV.idNumber}"></h:inputText></td>																
								   								</tr>
								   								<tr>
																	<td class="instance" width="20%" ><h:outputLabel value="#{msg.Job_Title}" /></td>
																	<td width="30%"><h:inputText value="#{merchantBC.merchantBV.jobTitle}"></h:inputText></td>																
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
											<table class="tile">			
												<thead>
													<tr>
														<td class="title"><h:outputText  value="#{msg.account_Information}" /></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<table width="100%">
																<tr>
																	<td class="instance" width="20%"><h:outputLabel value="#{msg.Account_Number}" >
																		</h:outputLabel></td>
																		<td width="30%"><h:inputText disabled="true" id="accountnumber" value="#{merchantBC.merchantBV.accountNumber}" size="20" maxlength="20">
																			</h:inputText>
																			<rich:message for="user_code" showSummary="false" styleClass="errorMessage" tooltip="true"/>
																	</td>
																	<td class="instance" width="20%"><h:outputLabel value="#{msg.creationDate}" ></h:outputLabel><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%"><rich:calendar id="expiryDate" value="#{merchantBC.merchantBV.creationDate}"
																		locale="en"
																		datePattern="dd/MM/yyyy" disabled="#{merchantBC.merchantBV.offcal2}"
																		popup="true"
																		direction="auto"
																		zindex="1000"
																		cellWidth="24px" cellHeight="22px" style="width:200px"/>
																	</td>
																</tr>	
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%">
																<tr>
																	<td class="instance" width="20%" ><h:outputLabel
																		value="#{msg.allowedTrxFlagsPayment}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%" ><h:selectOneRadio styleClass="panelRadio" value="#{merchantBC.merchantBV.allowedPayment}">
																		<f:selectItem itemLabel="YES" itemValue="1" />
																		<f:selectItem itemLabel="NO" itemValue="0" />
																			</h:selectOneRadio></td>
																	<td class="instance" width="20%" ><h:outputLabel
																		value="#{msg.allowedTrxFlagsBalance}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	
																	<td width="30%" ><h:selectOneRadio styleClass="panelRadio" value="#{merchantBC.merchantBV.allowedBalance}">
																		<f:selectItem itemLabel="YES" itemValue="1" />
																		<f:selectItem itemLabel="NO" itemValue="0" />
																			</h:selectOneRadio></td>
																				
																</tr>
																<tr> 
																	<td class="instance" width="20%" ><h:outputLabel
																		value="#{msg.allowedTrxFlagsTransfer}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	
																	<td  width="20%" ><h:selectOneRadio styleClass="panelRadio" value="#{merchantBC.merchantBV.allowedTransfer}">
																		<f:selectItem itemLabel="YES" itemValue="1" />
																		<f:selectItem itemLabel="NO" itemValue="0" />
																			</h:selectOneRadio></td>
																	<td class="instance" width="20%" >
																		<h:outputLabel
																			value="#{msg.status}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="30%"  class="instance"><h:selectOneRadio styleClass="panelRadio" value="#{merchantBC.merchantBV.status}">
																		<f:selectItem itemLabel="Normal" itemValue="Y" />
																		<f:selectItem itemLabel="Cancelled" itemValue="N" />
																			</h:selectOneRadio></td>
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
											<table class="tile">
												<thead>
													<tr>
														<td class="title"><h:outputText value="#{msg.customerParam_Adress}" /></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<table width="100%">
																<tr>
																	<td class="instance" width="20%" ><h:outputLabel value="#{msg.Address_City}" /></td>
																	<td width="30%"><h:inputText value="#{merchantBC.merchantBV.city}"></h:inputText></td>
																	<td class="instance" width="20%" ><h:outputLabel value="#{msg.Address_Postal_Code}" /></td>
																	<td width="30%"><h:inputText value="#{merchantBC.merchantBV.postalCode}"></h:inputText></td>																
								   								</tr>
								   								<tr>
																	<td class="instance" width="20%"><h:outputLabel value="#{msg.Address_State}" ></h:outputLabel></td>
																	<td width="30%"><h:inputText id="state" value="#{merchantBC.merchantBV.state}" >
																		</h:inputText></td>
																	<td class="instance" width="20%" ><h:outputLabel value="#{msg.Address_Country}" /></td>
																	<td width="30%"><h:inputText value="#{merchantBC.merchantBV.country}"></h:inputText></td>
								   								</tr>
								   								<tr>
								   									<td class="instance" width="20%"><h:outputLabel value="#{msg.Address}" /></td>
																	<td width="30%"><h:inputTextarea id="address" value="#{merchantBC.merchantBV.address}" cols="40" rows="3" >
																					</h:inputTextarea> 
																	</td>
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
										 	<table class="tile">
												<thead>
													<tr>
														<td class="title"><h:outputText value="#{msg.Email}" /></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<table width="100%">
																<tr>
															 		<td class="instance" width="20%" ><h:outputLabel value="#{msg.customerParam_Email}" /><h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" /></td>
																	<td width="100%"><h:inputText value="#{merchantBC.merchantBV.email}"  size="30" >
																	
																		</h:inputText></td>
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
										 	<table class="tile">
												<thead>
													<tr>
														<td class="title"><h:outputText value="#{msg.Description_Information}" /></td>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td>
															<table width="100%">
																<tr>
																 	<td class="instance" width="20%" ><h:outputLabel value="#{msg.Description}" /></td>
																	<td width="100%"><h:inputTextarea value="#{merchantBC.merchantBV.description}" rows="5" cols="50"></h:inputTextarea></td>
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
			<tr>
				<td>
					<table width="100%" class="buttonPanel">
						<tr>
							<td width="35%">&nbsp;</td>
							<td><a4j:commandButton value="Back"
								actionListener="#{merchantBC.checkChanges}"
								action="#{merchantBC.back}"									
                    			oncomplete="#{merchantBC.backPanel}"
								image="/images/button_back.png"
								immediate="#{merchantBC.immediate}">
								</a4j:commandButton></td>
							<td>
								<h:commandButton value="Add"
									action="#{merchantBC.ToAddRecord}"
									image="/images/button_add.png"
									rendered="#{merchantBC.modifyStatus}" >
								</h:commandButton>
							</td>
							<td>
								<h:commandButton value="Duplicate"
									action="#{merchantBC.ToDuplicateRecord}"
									image="/images/button_duplicate.png"
									rendered="#{merchantBC.modifyStatus}" >
								</h:commandButton>
							</td>
							<td>
								<h:commandButton value="Refresh"
									action="#{merchantBC.refresh}"
									image="/images/button_refresh.png"
									rendered="#{merchantBC.addStatus}"  >
								</h:commandButton>
								<a4j:commandButton value="Delete"
                    				oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="/images/button_delete.png"
									rendered="#{merchantBC.modifyStatus}">
								</a4j:commandButton>
							</td>
							<td>
								<a4j:commandButton value="Validate"
									image="/images/button_validate.png" 
									rendered="#{merchantBC.addStatus}" 
									action="#{merchantBC.valider}" 
									reRender="poll2,validatePanel,msg"
									limitToList="true"
									status="status_validate" >
								</a4j:commandButton>
				 				<a4j:commandButton value="Modify"
									action="#{merchantBC.modify}" 
									reRender="poll,poll2,validatePanel,msg"
									status="status_validate" limitToList="true"
									image="/images/button_modify.png"
									rendered="#{merchantBC.modifyStatus}">
								</a4j:commandButton>
											
								<a4j:poll id="poll" ajaxSingle="true"
									action="#{merchantParamSearch.back}"
									oncomplete="Richfaces.hideModalPanel('validatePanel')"
									interval="2000" enabled="#{merchantBV.pollEnabled}"
									reRender="validatePanel" limitToList="true" /> 
												
								<a4j:poll id="poll2" ajaxSingle="true"
									oncomplete="Richfaces.hideModalPanel('validatePanel')"
									interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true" reRender="validatePanel"
									limitToList="true" />
               				</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<a4j:region>
			<rich:modalPanel id="backPanel" style="background-color: #BAD9EF"
				autosized="true" width="400" height="120">
				<f:facet name="header">
					<h:outputText value="#{msg.E_P_S}" style="padding-right:15px;" />
				</f:facet>
				<f:facet name="controls">
					<h:panelGroup>
						<h:graphicImage
							value="/images/close.png"
							id="hidelink2" />
						<rich:componentControl for="backPanel" attachTo="hidelink2"
							operation="hide" event="onclick" />
					</h:panelGroup>
				</f:facet>
				<h:form>
					<table width="100%" class="tile">
						<tr>
							<td width="20%"><h:graphicImage
								value="/images/warning_img.gif"
								width="32" height="31" /></td>
							<td width="10%"></td>
							<td width="70%"><h:outputLabel styleClass="instance"
								value="#{msg.confirm_back_to_search}" /></td>
						</tr>
					</table>
					<table class="tile" width=100%>
						<tr style="height: 30px;">
							<tr>
								<td align="center" width="50%"><h:commandButton
									value="#{msg.Gen_yes}" action="#{merchantBC.Toback}" immediate="#{merchantBC.immediate}"
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
								value="/images/close.png"
								id="hidelink3" />
								<rich:componentControl for="backPanel" attachTo="hidelink3"
								operation="hide" event="onclick" />
							</h:panelGroup>
						</f:facet>
					<h:form>
						<table width="100%" class="tile">
							<tr>
								<td width="20%"><h:graphicImage
									value="/images/errorIco.ICO"
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
										value="#{msg.Gen_yes}" action="#{merchantBC.delete}"
										reRender="poll,poll2,validatePanel,msg" limitToList="true"
										oncomplete="Richfaces.hideModalPanel('deletePanel');"
										status="status_delete" style=" width : 67px;" /></td>
									<td align="center" width="50%">
										<a4j:commandButton
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
		</h:form>
	</body>
  </html>
</f:view>
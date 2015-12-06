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
			<table class="titrePage" width="50%">
				<tr>
					<td valign="top" class="zoneIdent">
					<table width="100%">

						<tr>
							<td>
							<table width="100%" class="ident">
								<tr>
									<td width="54%" align="left"><h:outputText
										value="#{msg.terminalBrand_table}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.terminalBrand_add}"
										rendered="#{terminalBrandBean.addStatus}" /> <h:outputText
										value="#{msg.terminalBrand_modify}"
										rendered="#{terminalBrandBean.modifyStatus}" /></td>
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
										<td class="title"><h:outputLabel value="#{msg.Gen_Identification}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%">
											<tr>
												<td class="instance" width="20%"><h:outputLabel value="#{msg.terminalBrand_branCode}" />
													<h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" />
												</td>
												<td width="30%">
												<h:inputText id="brand_code" required="true" requiredMessage="#{msg.terminalBrand_branCode} #{msg.Gen_required}"
													value="#{terminalBrandBean.brandCode}" size="2"
													maxlength="2" disabled="#{terminalBrandBean.modifyStatus}">
													<rich:ajaxValidator event="onblur" />
												</h:inputText> 
												<rich:message for="brand_code" styleClass="warnningMessage" />
												</td>
												<td class="instance" width="20%"><h:outputLabel value="#{msg.terminalBrand_brandName}" />
													<h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" />
												</td>
												<td width="30%">
												<h:inputText id="brand_name" required="true" requiredMessage="#{msg.terminalBrand_brandName} #{msg.Gen_required}"
													value="#{terminalBrandBean.brandName}" size="30" maxlength="30">
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="brand_name" styleClass="warnningMessage" />
													</td>
											</tr>
											<tr>
											<td class="instance" width="20%"><h:outputLabel value="#{msg.terminalBrand_entity}" />
												<h:outputLabel style="color:red" value="#{msg.Gen_RequireField}" />
												</td>
												<td width="30%">
												<h:selectOneMenu required="true" requiredMessage="#{msg.terminalBrand_entity} #{msg.Gen_required}" styleClass="Fixed"
													id="term_entity" value="#{terminalBrandBean.entity}"
													disabled="#{terminalBrandBean.modifyStatus}">
													<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
													<f:selectItem  itemLabel="#{msg.Gen_atm}" itemValue="A"/>
													<f:selectItem  itemLabel="#{msg.Gen_pos}" itemValue="P"/>
													
													<rich:ajaxValidator event="onblur">
													</rich:ajaxValidator>
	
												</h:selectOneMenu>
												<rich:message for="term_entity" styleClass="warnningMessage" />
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
				<td>
				<table width="100%">
					<tr>
						<td>
						<table class="tile">
							<thead>
								<tr>
									<td class="title"><h:outputLabel
										value="#{msg.Gen_Details}" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<table width="100%">
										<tr>
											<td class="instance" width="20%"><h:outputLabel
												value="#{msg.Gen_Company_Name}" /></td>
											<td width="30%">
										<h:inputText  value="#{terminalBrandBean.companyName}" size="30" maxlength="30">
										</h:inputText>
											</td>
											<td class="instance" width="20%"><h:outputLabel
												value="#{msg.Gen_Contact_name}" /></td>
											<td width="30%">
											<h:inputText  value="#{terminalBrandBean.contactName}" size="30" maxlength="30">
										</h:inputText>
											</td>
										</tr>
										<tr>
													
											<td class="instance"><h:outputLabel value="#{msg.Gen_location}" /></td>
											<td>
											
												<h:inputTextarea id="locat" value="#{terminalBrandBean.location}" cols="50" rows="2">
												<f:validateLength minimum="1" maximum="40"/>
												<rich:ajaxValidator event="onblur" />
												</h:inputTextarea>
												<rich:message for="locat" styleClass="warnningMessage" />
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
						<table width="100%">
							<tr>
								<td>
								<table class="tile">
									<thead>
										<tr>
											<td class="title"><h:outputLabel
												value="#{msg.Gen_Address}" /></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
											<table width="100%">
												<tr>
													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.countryC}" /></td>
													<td width="30%"><h:selectOneMenu id="country_code"
														value="#{terminalBrandBean.countryCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.countryListSI}" />
														<a4j:support event="onchange" ajaxSingle="true"
															actionListener="#{terminalBrandBean.refreshCity}"
															reRender="CountryMessage, CityListId1,lbl_country_code">
														</a4j:support>
														<rich:ajaxValidator event="onblur" />
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_country_code" value="#{terminalBrandBean.countryCode}"/>
														<rich:message for="country_code" styleClass="warnningMessage" />
													
														</td>


													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.cityParam_CityCode}"  /></td>
													<td width="30%"><h:selectOneMenu id="CityListId1"
														
														value="#{terminalBrandBean.cityCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.cityListSI}" />
														<rich:ajaxValidator event="onblur" />
														<a4j:support event="onchange" ajaxSingle="true" reRender="lbl_CityListId1"/>
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_CityListId1" value="#{terminalBrandBean.cityCode}"/>
														<rich:message for="CityListId1" styleClass="warnningMessage" />
											
											</td>
												</tr>
												<tr>
													<td class="instance"><h:outputLabel
														value="#{msg.terminalBrand_maintePhone}" /></td>
													<td>
													<h:inputText id="tel" value="#{terminalBrandBean.maintenancePhone}" maxlength="20" size="20">
													<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
														<f:validator validatorId="mustBeNumber"/>
													</h:inputText>
													<rich:message for="tel" styleClass="warnningMessage" />
													</td>
													<td class="instance"><h:outputLabel
														value="#{msg.terminalBrand_fax}" /></td>
													<td>
													<h:inputText id="fax" value="#{terminalBrandBean.maintenanceFax}" maxlength="20" size="20">
													<rich:ajaxValidator event="onkeyup"></rich:ajaxValidator>
														<f:validator validatorId="mustBeNumber"/>
													</h:inputText>
													<rich:message for="fax" styleClass="warnningMessage" />
													</td>
												</tr>
												<tr>
												<td class="instance"><h:outputLabel
														value="#{msg.terminalBrand_email}" /></td>
													<td>
													<h:inputText id="mail" value="#{terminalBrandBean.maintenanceEmail}" maxlength="20" size="20">
													<rich:ajaxValidator event="onblur"></rich:ajaxValidator>
													</h:inputText>
													<rich:message for="mail" styleClass="warnningMessage" />
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


								<table width="100%" class="buttonPanel">
									<tr>
										<td width="35%">&nbsp;</td>
										<td><a4j:commandButton value="Back"
											actionListener="#{terminalBrandBean.checkChanges}"
											action="#{terminalBrandBean.back}"
											oncomplete="#{terminalBrandBean.backPanel}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
											immediate="#{terminalBrandBean.immediate}"></a4j:commandButton></td>

										<td><h:commandButton value="Add"
											action="#{terminalBrandBean.ToAddRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
											rendered="#{terminalBrandBean.modifyStatus}">
										</h:commandButton></td>
										<td><h:commandButton value="Duplicate"
											action="#{terminalBrandBean.ToDuplicateRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
											rendered="#{terminalBrandBean.modifyStatus}">
										</h:commandButton></td>
										<td><h:commandButton value="Refresh"
											action="#{terminalBrandBean.refresh}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
											rendered="#{terminalBrandBean.addStatus}">
										</h:commandButton> <a4j:commandButton value="Delete"
											oncomplete="Richfaces.showModalPanel('deletePanel')"
											image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
											rendered="#{terminalBrandBean.modifyStatus}">
										</a4j:commandButton></td>
										<td><a4j:commandButton value="Validate"
											image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
											rendered="#{terminalBrandBean.addStatus}"
											action="#{terminalBrandBean.valider}"
											reRender="poll2,validatePanel,msg" 
											status="status_validate">

										</a4j:commandButton> <a4j:commandButton value="Modify"
											action="#{terminalBrandBean.modify}"
											reRender="poll2,validatePanel,msg" 
											status="status_validate"
											image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
											rendered="#{terminalBrandBean.modifyStatus}">
										</a4j:commandButton> <a4j:region>

											<a4j:poll id="poll" ajaxSingle="true"
												action="#{terminalBrandSearchBB.back}"
												oncomplete="Richfaces.hideModalPanel('validatePanel')"
												interval="2000" enabled="#{terminalBrandBean.pollEnabled}"
												reRender="validatePanel" limitToList="true" />

											<a4j:poll id="poll2" ajaxSingle="true"
												oncomplete="Richfaces.hideModalPanel('validatePanel')"
												interval="#{GlobalVars.EPS_POPUPMSG_TIME}" enabled="true" reRender="validatePanel"
												limitToList="true" />

										</a4j:region></td>
									</tr>

									<h:outputText value="" escape="false" rendered="false" />
								</table>

								</td>
							</tr>

						</table>
						</td>
				</table>
			</table>
		</table>
	</h:form>
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
							value="#{msg.Gen_yes}" action="#{terminalBrandSearchBB.back}"
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
							value="#{msg.Gen_yes}" action="#{terminalBrandBean.delete}"
							reRender="poll,poll2,validatePanel,msg" 
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
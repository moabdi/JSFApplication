<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>
<script type="text/javascript">
var entity= 'Bank';
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<f:loadBundle var="msg" basename="i18n.messages" />

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
									<td width="54%" align="left"><h:outputLabel
										value="#{msg.Gen_bank}" /></td>

									<td width="40%" align="right"><h:outputLabel
										value="#{msg.Gen_Add}" rendered="#{bankEpsBackingBean.addStatus}" /><h:outputLabel
										value="#{msg.Gen_Modify}" rendered="#{bankEpsBackingBean.modifyStatus}" /></td>
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
												<td class="instance" width="20%"><h:outputLabel
													value="#{msg.BankCode}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="bank_code" 
													required="true" requiredMessage="#{msg.BankCode} #{msg.Gen_required}"
													value="#{bankEpsBackingBean.bankCode}" size="5"
													maxlength="5" disabled="#{bankEpsBackingBean.modifyStatus}">

													<rich:ajaxValidator event="onblur" />
												</h:inputText> 
												<rich:message for="bank_code" styleClass="warnningMessage" />
												</td>
												<td class="instance" width="20%"><h:outputLabel
													value="#{msg.Gen_wording}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="wordin" required="true" requiredMessage="#{msg.Gen_wording} #{msg.Gen_required}"
													value="#{bankEpsBackingBean.wording}" size="30"	maxlength="30">
													<rich:ajaxValidator event="onblur" />
													</h:inputText>
													<rich:message for="wordin" styleClass="warnningMessage" />
													</td>
											<tr>
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
												value="#{msg.centerParam_CenterCode}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu id="center_code" 
												required="true" requiredMessage="#{msg.Gen_centerCode} #{msg.Gen_required}"
												value="#{bankEpsBackingBean.centerCode}">
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
												<f:selectItems value="#{applicationLists.centerListSI}" />
												<rich:ajaxValidator event="onblur" />
												<a4j:support event="onchange" ajaxSingle="true" reRender="lbl_center"/>
												</h:selectOneMenu>
												<h:outputLabel styleClass="codelbl" id="lbl_center" value="#{bankEpsBackingBean.centerCode}"/>
												<rich:message for="center_code" styleClass="warnningMessage" />
										
											</td>
											<td class="instance" width="20%"><h:outputLabel
												value="#{msg.currencyC}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu id="curr_code" 
												required="true" requiredMessage="#{msg.Gen_Currency} #{msg.Gen_required}"
												value="#{bankEpsBackingBean.currencyCode}">
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
												<f:selectItems value="#{applicationLists.currencyFeesListSI}" />
												<rich:ajaxValidator event="onblur" />
												<a4j:support event="onchange" ajaxSingle="true" reRender="lbl_curr_code"/>
												</h:selectOneMenu>
												<h:outputLabel styleClass="codelbl" id="lbl_curr_code" value="#{bankEpsBackingBean.currencyCode}"/>
												<rich:message for="curr_code" styleClass="warnningMessage" />
											
											</td>
										</tr>
										<tr>
											<td class="instance"><h:outputLabel value="#{msg.tva}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
											<td><h:inputText 
											 	required="true" requiredMessage="#{msg.tva} #{msg.Gen_required}" 
												value="#{bankEpsBackingBean.tvaRate}" maxlength="6" size="6"
												id="tvaRateId" styleClass="AlignRight">
												<f:validator  validatorId="mustBePourcent"  />
											<rich:ajaxValidator event="onblur"/>
											</h:inputText> <rich:message for="tvaRateId" styleClass="warnningMessage" />
											</td>
											<td class="instance"><h:outputLabel value="#{msg.Gen_DaysBeforeRenew}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
											<td><h:inputText styleClass="AlignRight" 
												required="true" requiredMessage="#{msg.Gen_DaysBeforeRenew} #{msg.Gen_required}"
												value="#{bankEpsBackingBean.daysBeforeRenew}"
												id="daysBeforeRenewId" size="19" maxlength="19">
												<f:validator validatorId="mustBeNumber" />
												<rich:ajaxValidator event="onblur" />
											</h:inputText> <rich:message for="daysBeforeRenewId"
												styleClass="warnningMessage" /></td>
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
														value="#{msg.countryC}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:selectOneMenu id="country_code" 
														required="true" requiredMessage="#{msg.Gen_Country} #{msg.Gen_required}"
														value="#{bankEpsBackingBean.countryCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.countryListSI}" />
														<a4j:support event="onchange" ajaxSingle="true"
															actionListener="#{bankEpsBackingBean.refreshCity}"
															reRender="CountryMessage, CityListId1,lbl_country_code">
														</a4j:support>
														<rich:ajaxValidator event="onblur" />
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_country_code" value="#{bankEpsBackingBean.countryCode}"/>
														<rich:message for="country_code" styleClass="warnningMessage" />
													
														</td>


													<td class="instance" width="20%"><h:outputLabel
														value="#{msg.cityParam_CityCode}"  /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
													<td width="30%"><h:selectOneMenu id="CityListId1"
														required="true" requiredMessage="#{msg.Gen_City} #{msg.Gen_required}"
														value="#{bankEpsBackingBean.cityCode}">
														<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
														<f:selectItems value="#{applicationLists.cityListSI}" />
														<rich:ajaxValidator event="onblur" />
														<a4j:support event="onchange" ajaxSingle="true" reRender="lbl_CityListId1"/>
														</h:selectOneMenu>
														<h:outputLabel styleClass="codelbl" id="lbl_CityListId1" value="#{bankEpsBackingBean.cityCode}"/>
														<rich:message for="CityListId1" styleClass="warnningMessage" />
											
											</td>
												</tr>
												<tr>
													<td class="instance"><h:outputLabel
														value="#{msg.Gen_Address}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
													<td><h:inputTextarea 
														required="true" requiredMessage="#{msg.Gen_Address} #{msg.Gen_required}"
														value="#{bankEpsBackingBean.address}"></h:inputTextarea></td>
													<td class="instance"><h:outputLabel
														value="#{msg.Gen_ZipCode}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
													<td><h:inputText 
														 required="true" requiredMessage="#{msg.Gen_ZipCode} #{msg.Gen_required}" 
														 size="7" maxlength="6" value="#{bankEpsBackingBean.zipCode}"></h:inputText></td>
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
											actionListener="#{bankEpsBackingBean.checkChanges}"
											action="#{bankEpsBackingBean.back}"
											oncomplete="#{bankEpsBackingBean.backPanel}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
											immediate="#{bankEpsBackingBean.immediate}"></a4j:commandButton></td>

										<td><h:commandButton value="Add"
											action="#{bankEpsBackingBean.ToAddRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
											rendered="#{bankEpsBackingBean.modifyStatus}">
										</h:commandButton></td>
										<td><h:commandButton value="Duplicate"
											action="#{bankEpsBackingBean.ToDuplicateRecord}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
											rendered="#{bankEpsBackingBean.modifyStatus}">
										</h:commandButton></td>
										<td><h:commandButton value="Refresh"
											action="#{bankEpsBackingBean.refresh}"
											image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
											rendered="#{bankEpsBackingBean.addStatus}">
										</h:commandButton> <a4j:commandButton value="Delete"
											oncomplete="Richfaces.showModalPanel('deletePanel')"
											image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
											rendered="#{bankEpsBackingBean.modifyStatus}">
										</a4j:commandButton></td>
										<td><a4j:commandButton value="Validate"
											image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
											rendered="#{bankEpsBackingBean.addStatus}"
											action="#{bankEpsBackingBean.valider}"
											reRender="poll2,validatePanel,msg"
											status="status_validate">

										</a4j:commandButton> <a4j:commandButton value="Modify"
											action="#{bankEpsBackingBean.modify}"
											reRender="poll2,validatePanel,msg" 
											status="status_validate"
											image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
											rendered="#{bankEpsBackingBean.modifyStatus}">
										</a4j:commandButton> <a4j:region>

											<a4j:poll id="poll" ajaxSingle="true"
												action="#{bankEpsSearchBackingBean.back}"
												oncomplete="Richfaces.hideModalPanel('validatePanel')"
												interval="2000" enabled="#{bankEpsBackingBean.pollEnabled}"
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
							value="#{msg.Gen_yes}" action="#{bankEpsSearchBackingBean.back}"
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
							value="#{msg.Gen_yes}" action="#{bankEpsBackingBean.delete}"
							reRender="poll,poll2,validatePanel,msg" limitToList="true"
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
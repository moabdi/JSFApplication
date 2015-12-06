<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>

<html>
<f:view locale="#{userContext.userLocale}">
	<head>
<script type="text/javascript">
var entity= 'Branch';
</script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	

	</head>
	<body class="body">


	<h:form id="formId">
		<%@ include file="/commun/header.jsp"%>
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
										value="#{msg.Gen_branch}" /></td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.Gen_Add}"
										rendered="#{branchBackingBean.addStatus}" /> <h:outputText
										value="#{msg.Gen_Modify}"
										rendered="#{branchBackingBean.modifyStatus}" /></td>
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
					<rich:messages id="msg" showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage" layout="list">
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
										<td class="title"><h:outputText
											value="#{msg.Gen_Identification}" /></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
										<table width="100%">
											<tr>
												
												<td class="instance" width="20%"><h:outputText
													value="#{msg.branchParam_BranchCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText id="branch_code" disabled="#{branchBackingBean.modifyStatus}" 
												value="#{branchBackingBean.branchCode}" size="5" 
												required="true" requiredMessage="#{msg.branchParam_BranchCode} #{msg.Gen_required}" maxlength="5">
												<rich:ajaxValidator event="onblur" />
												 </h:inputText>
												 <rich:message for="branch_code" styleClass="warnningMessage" />
													</td>
												<td class="instance" width="20%"><h:outputText
													value="#{msg.branchParam_Wording}" /><h:outputLabel style="color:red"
													value="#{msg.Gen_RequireField}" /></td>
												<td width="30%"><h:inputText value="#{branchBackingBean.wording}" required="true" requiredMessage="#{msg.Gen_wording} #{msg.Gen_required}"
													id="wordingId" size="30" maxlength="30">
													<rich:ajaxValidator event="onblur" />
												</h:inputText> <rich:message for="wordingId" styleClass="warnningMessage" />

												</td>
											<tr>
										</table>
							</td>
						</tr></tbody>
					</table>
					</td>
					</tr>
					<tr>
					<td>
						<table class="tile" width="100%">
							<thead>
								<tr>
									<td class="title"><h:outputText value="#{msg.Gen_Details}" /></td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
									<table width="100%">
										<tr>

											<td class="instance" width="20%"><h:outputText 
												value="#{msg.Gen_bankCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu disabled="#{branchBackingBean.modifyStatus}" required="true" requiredMessage="#{msg.Gen_BankCode} #{msg.Gen_required}"
												value="#{branchBackingBean.bankCode}" id="bank_Code">
												<f:selectItem itemLabel="#{msg.Gen_Select}"	itemValue="" />
												<f:selectItems value="#{applicationLists.bankListSI}"/>
												<rich:ajaxValidator event="onblur" />
											</h:selectOneMenu> 
											<rich:message for="bank_Code" styleClass="warnningMessage" />
											</td>
											<td class="instance" width="20%"><h:outputText 
												value="#{msg.Gen_location}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:inputText required="true" requiredMessage="#{msg.Gen_location} #{msg.Gen_required}"
												value="#{branchBackingBean.bankLocation}" size="20" maxlength="20"></h:inputText></td>
										</tr>
										<tr>
											<td class="instance" width="20%"><h:outputText
												value="#{msg.Gen_DaysBeforeRenew}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:inputText styleClass="AlignRight" 
											 	required="true" requiredMessage="#{msg.Gen_DaysBeforeRenew} #{msg.Gen_required}" 
												id="daysBeforeRenewId" value="#{branchBackingBean.daysBeforeRenew}" size="19" maxlength="19">
												<f:validator validatorId="mustBeNumber" />
												<rich:ajaxValidator event="onblur" />
											</h:inputText> 
											<rich:message for="daysBeforeRenewId" styleClass="warnningMessage" />
											</td>
										</tr>
									</table>
								</td></tr></tbody>
								</table>
								</td></tr>
							<tr>
						<td>
						<table width="100%">
							<tr>
								<td>
								<table class="tile" width="100%">
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

											<td class="instance" width="20%"><h:outputText
												value="#{msg.Gen_CountryCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:selectOneMenu id="CountrySelectID" 
												required="true" requiredMessage="#{msg.Gen_Country} #{msg.Gen_required}"
												value="#{branchBackingBean.countryCode}" >
												<f:selectItem itemLabel="#{msg.Gen_Select}"  />
												<f:selectItems value="#{applicationLists.countryListSI}" />


												<a4j:support event="onchange" ajaxSingle="true"
													actionListener="#{branchBackingBean.refreshCity}"
													reRender="CountryMessage,CityListId1,coutry_lbl,lbl_CityListId1">
												</a4j:support>

												<rich:ajaxValidator event="onblur" />
											</h:selectOneMenu>
											<rich:message for="CountrySelectID" styleClass="warnningMessage" />
												<h:outputLabel id="coutry_lbl" styleClass="codelbl"  value="#{branchBackingBean.countryCode}"/>
											</td>

											<td class="instance" width="20%"><h:outputText
												value="#{msg.Gen_CityCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%">
											<h:selectOneMenu required="true" requiredMessage="#{msg.Gen_CityCode} #{msg.Gen_required}"
												value="#{branchBackingBean.cityCode}" id="CityListId1" >
												<f:selectItem itemLabel="#{msg.Gen_Select}" itemValue="" />
												<f:selectItems value="#{applicationLists.cityListSI}" />
												<a4j:support event="onchange" ajaxSingle="true" reRender="lbl_CityListId1"/>
											</h:selectOneMenu> 
											<h:outputLabel styleClass="codelbl" id="lbl_CityListId1" value="#{branchBackingBean.cityCode}"/>
											<rich:message for="CityListId1" styleClass="warnningMessage" />

										</tr>
										<tr>

											<td class="instance"><h:outputText
												value="#{msg.Gen_ZipCode}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td><h:inputText required="true" requiredMessage="#{msg.Gen_ZipCode} #{msg.Gen_required}" 
												value="#{branchBackingBean.zipCode}" size="7" maxlength="6"></h:inputText></td>
											<td class="instance" width="20%"><h:outputText
												value="#{msg.Gen_Address}" /><h:outputLabel
														style="color:red" value="#{msg.Gen_RequireField}" /></td>
											<td width="30%"><h:inputTextarea required="true" requiredMessage="#{msg.Gen_Address} #{msg.Gen_required}" 
														value="#{branchBackingBean.address}"></h:inputTextarea></td>

										</tr>
										</table>
									</td></tr></tbody>
									</table>
							</td>
					</tr>
					<tr>
						<td>


						<table width="100%" class="buttonPanel">
							<tr>
								<td width="35%">&nbsp;</td>
								<td><a4j:commandButton value="Back"
									actionListener="#{branchBackingBean.checkChanges}"
									action="#{branchBackingBean.back}"
									oncomplete="#{branchBackingBean.backPanel}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
									immediate="#{branchBackingBean.immediate}"></a4j:commandButton></td>

								<td><h:commandButton value="Add"
									action="#{branchBackingBean.ToAddRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"
									rendered="#{branchBackingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Duplicate"
									action="#{branchBackingBean.ToDuplicateRecord}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_duplicate.png"
									rendered="#{branchBackingBean.modifyStatus}">
								</h:commandButton></td>
								<td><h:commandButton value="Refresh"
									action="#{branchBackingBean.refresh}"
									image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"
									rendered="#{branchBackingBean.addStatus}">
								</h:commandButton> <a4j:commandButton value="Delete"
									oncomplete="Richfaces.showModalPanel('deletePanel')"
									image="#{facesContext.externalContext.requestContextPath}/images/button_delete.png"
									rendered="#{branchBackingBean.modifyStatus}">
								</a4j:commandButton></td>
								<td><a4j:commandButton value="Validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_validate.png"
									rendered="#{branchBackingBean.addStatus}"
									action="#{branchBackingBean.valider}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate">

								</a4j:commandButton> <a4j:commandButton value="Modify"
									action="#{branchBackingBean.modify}"
									reRender="poll2,validatePanel,msg" 
									status="status_validate"
									image="#{facesContext.externalContext.requestContextPath}/images/button_modify.png"
									rendered="#{branchBackingBean.modifyStatus}">
								</a4j:commandButton> <a4j:region>

									<a4j:poll id="poll" ajaxSingle="true"
										action="#{branchSearchBB.back}"
										oncomplete="Richfaces.hideModalPanel('validatePanel')"
										interval="2000"
										enabled="#{branchBackingBean.pollEnabled}"
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
			</table></td></tr></table></td>
			</tr></table></table>
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
							value="#{msg.Gen_yes}" action="#{branchSearchBB.back}"
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
							value="#{msg.Gen_yes}" action="#{branchBackingBean.delete}"
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
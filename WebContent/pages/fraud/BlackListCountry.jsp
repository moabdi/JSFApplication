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
										value="#{msg.Gen_capture_transact}" /></td>
									<td width="5%">&nbsp;</td>
									<td width="40%" align="right"><h:outputText
										value="#{msg.Gen_search_capt}" /></td>
									<td width="1%">&nbsp;</td>
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
						<rich:messages id="msg" showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage" layout="list"></rich:messages>
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
												<td class="instance" width="20%"><h:outputText value="#{msg.Gen_country_code}" /></td>
												<td width="30%" >
												<h:inputText id="countryCode" size="15" maxlength="15"  value="#{blackListCountrySearchBBean.countryCode}">
												</h:inputText>
												</td>
												<td class="instance" width="20%"><h:outputText value="#{msg.wording}" /></td>
												<td width="30%" >
												<h:inputText id="wording" size="15" maxlength="15"  value="#{blackListCountrySearchBBean.wording}">
												</h:inputText>
												</td>
																								
												</tr>
											</table>
											<table width="100%">
											<tr>
												<td width="60%"></td>
												<td align="left" ><h:commandButton value="Refresh" action="#{blackListCountrySearchBBean.Refresh}" image="#{facesContext.externalContext.requestContextPath}/images/button_refresh.png"></h:commandButton></td>
												<td align="left" ><h:commandButton value="Search" action="#{blackListCountrySearchBBean.search}" image="#{facesContext.externalContext.requestContextPath}/images/button_search.png"></h:commandButton></td>
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
										<td>
										<table width="100%" align="center">
										<tr>
										<td align="center">

											<h:panelGrid border="1" columns="1" width="#{GlobalVars.EPS_DATATABLE_SIZE}"
												frame="above" cellspacing="3">
												
												<rich:panel styleClass="tiletable" style="overflow-x: auto; width:#{GlobalVars.EPS_DATATABLE_SIZE}px;">
												

												<rich:dataTable id="sampleData" rows="#{GlobalVars.EPS_DATATABLE_MAX}"
													value="#{blackListCountrySearchBBean.criteria}" var="event"
													binding="#{blackListCountrySearchBBean.datable}"
													sortMode="single" 
													columnsWidth="0*"
													styleClass="tiletable" 
													captionStyle="tiletable" columnClasses="tiletable"
													 rowClasses="tiletable"
													headerClass="tiletable"  width="100%"
													bgcolor="#FFDD57" >

													<rich:column headerClass="dataTableHeader" sortable="true"
														sortBy="#{event.countryCode}" filterBy="#{event.countryCode}"
														filterEvent="onblur" styleClass="tile"   >

														<f:facet name="header" >
															<h:outputText value="#{msg.Gen_country_code}"  />
														</f:facet>
														<h:commandLink styleClass="tableCommandLink"
															actionListener="#{blackListCountrySearchBBean.selectId}"
															action="#{blackListCountrySearchBBean.forwardModify}">
															<h:inputText value="#{event.countryCod e}"  styleClass="inputTextLink" readonly="true" />
															
														</h:commandLink>
													</rich:column>

													
													<rich:column sortable="true" sortBy="#{event.wording}" filterBy="#{event.wording}" filterEvent="onblur">
														<f:facet name="header" >
															<h:outputText value="#{msg.wording}" />
														</f:facet>
														<h:inputText styleClass="inputTextWording2" value="#{event.wording}" readonly="true"/>
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


							<table width="100%" class="buttonPanel" border="0">

								<tr>
											
									<td width="60%"></td>
									<td align="left" ><h:commandButton value="Back"
										action="#{blackListCountrySearchBBean.backToWelcomPage}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_back.png"
										immediate="true"></h:commandButton></td>
									<td align="left" ><h:commandButton value="Add"
										action="#{blackListCountrySearchBBean.addRecord}"
										image="#{facesContext.externalContext.requestContextPath}/images/button_add.png"></h:commandButton></td>
									
								</tr>

							</table>

							</td>
						</tr>

			</table></td></tr></table></table></a4j:form>

	</body>




</html>
</f:view>
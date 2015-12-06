<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include	file="commun/taglibs.jsp"%>
<f:view>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Easy Payment System</title>
<link href="charte/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body class="mainPan">
<h:form>
<div align="center" class="animPan" >
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" id="anim" width="1000" height="300" align="middle">
	<PARAM NAME=allowScriptAccess VALUE="images/baniere_eps.swf">
 	<PARAM NAME=quality VALUE=high>
 	<PARAM NAME=bgcolor VALUE=#FFFFFF>
 	<embed src="images/baniere_eps.swf" quality="high" bgcolor="#bad9ef" width="1000" height="300" name="baniere_eps.swf" align="middle" allowscriptaccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>
</object>
</div>
<div align="center" class="loginPan">

<table width="100%" class="login">
							<tr >
								<td class="lib" width="48%"><strong> <h:outputLabel
									value="User Name" for="un" /> </strong></td>
								<td><h:inputText autocomplete="off" id="un" value="#{loginBean.usercode}"
									style="width: 250px" /> </td>
								<td width="20%">&nbsp;</td>
							</tr>
							<tr align="left">
								<td class="lib" width="48%"><strong> <h:outputLabel
									value="Password" for="pw" /></strong></td>
								<td><h:inputSecret id="pw" value="#{loginBean.password}" ></h:inputSecret></td>
								<td width="20%">&nbsp;</td>
							</tr>

							<tr >
								
								<td colspan="2"><a4j:commandButton value="Login" action="#{loginBean.loginAction}" actionListener="#{loginBean.updatePass}"
									 oncomplete="#{loginBean.firstConnectPanel}" image="images/login.png" />
								</td>
								<td width="5%">
								</td>
								
							</tr>
							
							<tr >
								<td colspan="1">
									
								</td>
							</tr>
					</table>
					<a4j:status id="status_id" layout="block">
						<f:facet name="start">
                    		<h:graphicImage width="210"  value="images/progress.gif"/>
                		</f:facet>
					</a4j:status>
    				<rich:modalPanel moveable="false" id="wait" style="background-color: #BAD9EF"
							autosized="true" width="400" height="120">
							<f:facet name="header">
								<h:outputText value="#{msg.E_P_S}" />
							</f:facet>
							<h:form>
								<table width="100%" class="tile">
									<tbody>
										<br>
										<tr>
											<h:outputLabel styleClass="instance"
												value="Operation en cours..." />
										</tr>
										<br>
										<tr>
											<br>
											<td align="center" width="100%"><h:graphicImage
												width="40" value="/Fraud/images/ajax-loader.gif" /></td>
										</tr>
									</tbody>
								</table>
							</h:form>

						</rich:modalPanel>
						<a4j:region>
							<rich:modalPanel moveable="false" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" id="updatePanel" >
							<f:facet name="header">
								<h:outputText value="#{msg.E_P_S}" />
							</f:facet>
							<f:facet name="controls">
            					<h:graphicImage value="/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('updatePanel')" />
					        </f:facet>
					        <h:form id="updateForm">
							<table width="100%" class="tile">
							
							<tr style="height:30px"></tr>
							<tr >
								<td class="lib" ><strong><h:outputLabel
									value="New password" for="newpass" /> </strong></td>
								<td><h:inputSecret maxlength="20" id="newpass" value="#{loginBean.newPassword}">
								<a4j:support event="onkeyup" actionListener="#{loginBean.checkpassvalue}" ajaxSingle="true"></a4j:support>
								</h:inputSecret></td>
								<td align="left" width="5%">
								<a4j:commandButton id="password_help" onclick="Richfaces.showModalPanel('msgPanel9')" image="/images/aide.gif" >
									</a4j:commandButton>
								</td>
							</tr>
							
							<tr >
								<td class="lib" ><strong> <h:outputLabel
									value="Confirm password" for="cpass" /> </strong></td>
								<td><h:inputSecret maxlength="20" id="cpass" value="#{loginBean.cpassword}"></h:inputSecret></td>
							</tr>
							<tr style="height:30px"></tr>
							<tr>
								
								<td align="center" colspan="3"><a4j:commandButton value="validate"
									action="#{loginBean.validateSecondPassword}" oncomplete="#{loginBean.showMsgPanel}" /></td>
							</tr>
						</table>
						</h:form>
						</rich:modalPanel>
						</a4j:region>
						<a4j:region>
								<rich:modalPanel id="msgPanel1" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel1')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_userNotFound}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel1')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel2" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel2')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_sessionLimited}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel2')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel3" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="../images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel3')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.MessageS_AccountBlocked}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel3')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel4" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel4')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage width="90" value="/images/sucess.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passUpdated}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel4')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel5" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel5')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passError}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel5')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel6" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel6')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passWarn}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel6')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel7" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel7')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_passwordExp}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel7')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel8" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel8')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Message_badIpAddress}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel8')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
            		<a4j:region>
								<rich:modalPanel id="msgPanel9" resizeable="false" style="background-color:#BAD9EF;" width="400" height="200" >
                				<f:facet name="header">
                    				<h:outputLabel value="Easy Payment System" />
                				</f:facet>
                				<f:facet name="controls">
                    				<h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/close.png" style="cursor:pointer" onclick="Richfaces.hideModalPanel('msgPanel9')" />
                				</f:facet>
                				<h:form>
                				<table align="center" class="tile">
								<tr >
									<td><h:graphicImage value="#{facesContext.externalContext.requestContextPath}/images/warning_img.gif" /></td>
								</tr>
								<tr>
									<td colspan="2" align="center" ><h:outputText rendered="true" value="#{msg.Gen_pass_model}" /> </td>
								</tr>
								<tr style=" height : 50px;"></tr>
								<tr>
									<td width="40%" align="center"><a4j:commandButton value="ok" onclick="Richfaces.hideModalPanel('msgPanel9')" /></td>
								</tr>
								</table>
								</h:form>
            					</rich:modalPanel>
            		</a4j:region>
			
</div>
<div align="center" class="footerPan">
		<p class="copyright"><a href="http://www.bits.ma" target="blank">©BusinessITSolutions 2010. all right reserved.</a></p>
</div>
</h:form>
</body>
</html>
</f:view>
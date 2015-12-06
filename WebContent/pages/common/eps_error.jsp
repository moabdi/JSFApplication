<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>

<f:subview id="error_view">

<html>
<head>
        <meta content="no-cache" http-equiv="Cache-Control" />
        <meta content="no-cache" http-equiv="Pragma" />
        <title>Easy Payment Systems</title>
        <link rel="stylesheet" href="/MBANK/charte/css/eps.css" type="text/css">
        </head>
<head>
<body>
<h:form>

<table  id="mainTable" class="layout" cellpadding="1" cellspacing="0"
		width="100%">
	<tr>
		<td valign="top">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr class="barreMenu1" style=" height : 56px;">
							<td align="left" height="44"><img src="/MBANK/images/logo.png"
								width="77" height="45" style=" height : 55px;"></td>
							<td>&nbsp;</td>
							<td class="lib"><img src="/MBANK/images/logo.png" width="96"
								height="45" style=" height : 50px;"></td>
						</tr>
						</tbody>
				</table>
				</td>
			</tr>
	<tr background="/MBANK/images/etoiles.jpg" style="height:500px" >
	<td>
	<h:form >
		<center>
		<table width="50%" border="0" bgcolor="#9D9D9D" style=" width : 503px;">
			
			<tr >
				<td><rich:panel>
					<f:facet name="header">
						<h:panelGroup>
							<table width="15%" border="0" >
								<tr>
									<td width="5%"><h:graphicImage value="/images/error.gif"
										style="left: 0px" /></td>
									<td width="10%"><STRONG><h:outputText value="ERROR"
										style="color: red ; font-size: 15px" /></STRONG></td>
								</tr>
							</table>
						</h:panelGroup>
					</f:facet>
					<center><br>
					<h:outputText styleClass="errorMessage" escape="false" value="#{msg.error_TechnicalError}" style="color:#FFFFFF;font-size: 15px"></h:outputText><br>
					<br>
					<h:commandLink value="back" action="#{loginBean.logout}"
						style="font-size: 18px">
					</h:commandLink></center>
				</rich:panel></td>
			</tr>
			<tr>
				<td>
					<h:inputTextarea style=" width : 618px;" rows="10" readonly="true" value="#{errorHandler.stackTrace}" />
           		</td>
			</tr>
		</table>
		</center>
	</h:form>
	</td></tr>
</table>
</h:form>
</body>
</html>
</f:subview>

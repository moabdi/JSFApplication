<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://richfaces.org/a4j" prefix="a4j"%>
<%@ taglib uri="http://richfaces.org/rich" prefix="rich"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<f:loadBundle var="msg" basename="i18n.messages" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Easy Payment Systems</title>
<link rel="stylesheet" href="../../charte/css/eps.css" type="text/css">
</head>
<body>
<f:view locale="#{userContext.userLocale}">
<table  id="mainTable" class="layout" cellpadding="1" cellspacing="0"
		width="100%">
	<tr>
		<td valign="top">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr class="barreMenu1" style=" height : 56px;">
							<td align="left" height="44"><img src="../../images/logo.png"
								width="77" height="45" style=" height : 55px;"></td>
							<td>&nbsp;</td>
							<td class="lib"><img src="../../images/logo.png" width="96"
								height="45" style=" height : 50px;"></td>
						</tr>
						</tbody>
				</table>
				</td>
			</tr>
	<tr background="../../images/etoiles.jpg" style="height:500px" >
	<td>
	<h:form >
		<center>
		<table width="50%" border="0" bgcolor="#9D9D9D">
			
			<tr >
				<td><rich:panel>
					<f:facet name="header">
						<h:panelGroup>
							<table width="15%" border="0" >
								<tr>
									<td width="5%"><h:graphicImage value="/images/error.gif"
										style="left: 0px" /></td>
									<td width="10%"><h:outputText value="ERROR"
										style="color: red ; font-size: 14px" /></td>
								</tr>
							</table>
						</h:panelGroup>
					</f:facet>
					<center><br>
					<h:outputText value="#{msg.restrictionAccess_NotEnoughRoles}" style="font-size: 18px"></h:outputText><br>
					<br>
					<h:commandLink value="back" action="#{loginBean.backToWelcomPage}"
						style="font-size: 18px">
					</h:commandLink></center>
				</rich:panel></td>
			</tr>
		</table>
		</center>
	</h:form>
	</td></tr>
</table>
</f:view>
</body>
</html>

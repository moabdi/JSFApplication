<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/commun/taglibs.jsp"%>

<html>
  <f:view >
		<f:loadBundle var="msg" basename="i18n.messages"/>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	</head>
	<body class="body">
		<h:form>
			<%@ include file="/commun/header.jsp"%>

		</h:form>
		<h:form>
			<table width="100%" >
								<tr >
									<td class="lib" width="48%"><strong> <h:outputLabel
										value="#{msg.Account_Number}" for="accountNumber" /> </strong></td>
									<td><h:inputText autocomplete="off" id="un" value="#{customerAccountBC.beanView.accountNumber}"
										style="width: 250px" /> </td>
									<td width="20%">&nbsp;</td>
								</tr>
								<tr align="left">
									<td class="lib" width="48%"><strong> <h:outputLabel
										value="#{msg.Account_Balance}" for="balance" /></strong></td>
									<td><h:inputText id="pw" value="#{customerAccountBC.beanView.balance}" ></h:inputText></td>
									<td width="20%">&nbsp;</td>
								</tr>
	
								<tr >
									
									<td colspan="2"><a4j:commandButton value="Login" action="#{customerAccountBC.accountAction}" 
									image="/images/button_add.png" />
									</td>
									<td width="5%">
									</td>
									
								</tr>
								
								<tr >
									<td colspan="1">
										
									</td>
								</tr>
			</table>
		</h:form>
	</body>
  </f:view>

</html>
<%@taglib uri="https://ajax4jsf.dev.java.net/ajax" prefix="ajax"%>
<%@ include
	file="commun/taglibs.jsp"%>
<script type="text/javascript" language="JavaScript"
	src="/MBANK/charte/js/prototype.js"/>
	<script type="text/javascript" language="JavaScript"
	src="/MBANK/charte/js/eps2.js"></script>

<script type="text/javascript">

         
            function test(){
                if(isEmpty('un','pw')){
                        if(isLength('un',3,15)&&isLength('pw',5,15)){
                            return true;
                        }
                        else return false;
                }
                else return false;
            }
            function reset(){
                if(isEmpty('un','pw')){
                        if(isLength('un',3,15)&&isLength('pw',5,15)){
                            return true;
                        }
                        else return false;
                }
                else return false;
            }
            function test2(evt){
                if( evt.keyCode == 13 || evt.which == 13 ){
                    if(test()) submitOnEnter(evt);
                }
            }
    </script>

<script language="javascript">

function goLite(FRM,BTN)
{
   window.document.forms[FRM].elements[BTN].style.color = "#AA3300";
   window.document.forms[FRM].elements[BTN].style.backgroundImage = "images/back06b.gif";
}

function goDim(FRM,BTN)
{
   window.document.forms[FRM].elements[BTN].style.color = "#775555";
   window.document.forms[FRM].elements[BTN].style.backgroundImage = "images/back06a.gif";
}

</script>

<html>
<head>
<link rel="stylesheet" href="charte/css/eps.css" type="text/css">

<title>Easy Payment System<title>
</head>
<body>
<f:view>
	<table id="mainTable" class="layout" cellpadding="1" cellspacing="0"
		width="100%">
		<tbody>
			<tr>
				<td valign="top">
				<table cellpadding="0" cellspacing="0" width="100%">
					<tbody>
						<tr class="barreMenu1">
							<td align="left" height="44"><img src="images/logo.png"
								width="77" height="45"></td>
							<td>&nbsp;</td>
							<td class="lib"><img src="images/logo.png" width="96"
								height="45"></td>
						</tr>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td class="zoneIdent" valign="top"></td>
			</tr>
			<tr background="images/etoiles.jpg">
				<td class="zoneTravail" valign="top" style="height: 500px">
				<h:messages id="msg1" 
						showDetail="true" showSummary="false"  infoClass="infoMessage" errorClass="errorMessage"/>
				
				<table width="100%">
					<h:form>
					<tr style="height: 100px">
					</tr>
					<tr>
					<td>
						<table style="height: 100px">
							<tr>
								<td style="height: 300px"><img src="images/Accueille.JPG"
									width="250" height="250" style="height: 357px; width: 346px"></td>
							</tr>
						</table>
					</td>	
					<td>	
						<table align="left" class="login">
							<tr align="left">
								<td class="lib" width="48%"><strong> <h:outputLabel
									value="IN PROGRESS"  /> </strong></td>
								<td> </td>
								<td width="20%">&nbsp;</td>
							</tr>
							<tr align="left">
								
								<td></td>
								<td width="20%">&nbsp;</td>
							</tr>

							<tr align="left">
								<td width="50px">&nbsp;</td>
								<td align="center"></td>
								<td width="20%">&nbsp;</td>
							</tr>
						</table>
					</td>
					</tr>
					</h:form>
					
				</table>
				</td>
			</tr>
		</tbody>
	</table>
</f:view>
</body>
</html>

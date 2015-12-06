function verifChps() {
	var msgErr = "" ;
	msgErr += verifDate() ;
	msgErr += verifInsee() ;
	if (msgErr!="")
		alert(msgErr) ;
	else
		soumettreForm() ;
}

function soumettreForm() {
	if (SuprEspaces(document.getElementsByName('codePostal')[0].value)!=""
		&& SuprEspacesGD(document.getElementsByName('nomCommune')[0].value)!="")
		location.href = "saisirAuteurPhysiqueErr.html" ;
}

function verifDate() {
	var jour = document.getElementsByName('dateNaissance1')[0].value ;
	var mois = document.getElementsByName('dateNaissance2')[0].value ;
	var annee = document.getElementsByName('dateNaissance3')[0].value ;
	if (SuprEspaces(jour+mois+annee)!="") {
		if (!dateValide(jour,mois,annee))
			return "Date est incorrect.\n";
		return "";
	}
	return "";
}

function verifInsee() {
	var insee = document.getElementsByName('codePostal')[0].value ;
	if (SuprEspaces(insee)!="")
		if (!estNumerique(insee))
			return "Code Insee doit contenir que des chiffres.\n" ;
	return "";
}

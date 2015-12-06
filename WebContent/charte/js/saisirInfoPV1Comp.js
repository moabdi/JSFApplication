	/**
     	* Fonction à appeler lors du chargement de la page 
     	*/
     	function onLoadMyPage() {
    		// prise en compte du bouton F2
    		handleF2();
    		// affiche un avertissement si l'utilisateur quitte la page
    		handleModifications();
    		// maj de checkbox pour les listes 'listMotifsPV1Comp' et 'listEvenementsAnterieursPV1'
    		updateChecksAndRadios('listMotifsPV1Comp');
    		updateChecksAndRadios('listEvenementsAnterieursPV1');
    		
    		onLoadPageThatCallsModalWindow();
    	}
    	
       /**
    	* Fonction permettant de poursuivre le traitement en cas de Warning exception.
    	*/
    	function poursuivre() {
    		var poursuivreUrl = '/aji/saisirInfoPV1Comp.do?reqCode=${poursuivre}&forcerWarnings=1';
    		return confirmEtpoursuivre(poursuivreUrl);
    	}
    	
    	/**
    	* Fonction permettant d'enregistrer une nouvelles mesures sur l'evenement en cours.
    	*/
    	function openPopupDetailMesureCreation(){
         	var url= '/pem/detailPeineOuMesure.do?reqCode=ajouter&typeSave=web';
            
            url += '&listIdentifierPersonne=' + $name('identifierPersonne').value;
            url += '&codeMesure=' + $name('nouvelleMesure').value;
    
        	url += '&identifierEvenement=' + $name('identifierEvenement').value;
        	url += '&dateEvenement=' + $name('dateEvenement').value;
        	url += '&identifierAffaire=' + $name('identifierAffaire').value;
        	url += '&emetteur.domaineType=' + $name('emetteur.domaineType').value;
        	url += '&emetteur.codeTypeElementStructure=' + $name('emetteur.codeTypeElementStructure').value;
        	url += '&emetteur.mnemoniqueType=' + $name('emetteur.mnemoniqueType').value;
        	url += '&emetteur.clazz=' + $name('emetteur.clazz').value;
        	url += '&emetteur.id=' + $name('emetteur.id').value;
        	url += '&emetteur.libelleMnemoService=' + $name('emetteur.libelleMnemoService').value;
            
        	openModalWindow(url, 877, 480, 115, 195);
        }
    
        function onClosePopupDetailPeineOuMesure(){
        	$name('reqCode').value= 'majMesures';
             submitFormNoValidation('/aji/saisirInfoPV1Comp.do?reqCode=majMesures');
        }
        
        function openEvenement(vueGuidee, identifierEvenement, mnemo, codeEvt, codeEmetteur){
    		var url = '/mtg/forwardToEvenement.do?reqCode=modifier'
    		+ '&vueGuidee=' + vueGuidee
    		+ '&identifierEvenement=' + identifierEvenement
    		+ '&identifierAffaire=' + $name('identifierAffaire').value
    		+ '&typeAffaire=' + $name('typeAffaire').value
    		+ '&numeroParquet=' + $name('numeroParquet').value
    		+ '&identifierIdenParquet=' + $name('identifierIdenParquet').value
    		+ '&mnemo=' + mnemo
    		+ '&codeEvenement=' + codeEvt
    		+ '&codeEmetteur=' + codeEmetteur;
    		
    		submitFormNoValidation(url);
    	}
		
		function checkNbCommentaires() {
			nbCommentaires--;
			if (nbCommentaires==0) {
				griserDegriser(true, $id("btnCommentaireRepris"));
			}
		}
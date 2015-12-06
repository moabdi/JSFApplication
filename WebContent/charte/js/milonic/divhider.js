M_hideMenus = "Samples->formdiv1;milonic->formdiv1;"

function M_hideLayer(_mnu,_show){
	if(op7||ie55||ns6||ns7)return
	M_hdar=M_hideMenus.split(";")
	for(_Ma=0;_Ma<M_hdar.length;_Ma++){
		M_hdarI=M_hdar[_Ma].split("->")
		M_mnu=getMenuByName(M_hdarI[0])
		if(M_mnu>-1&&M_mnu==_mnu){
			M_gm=gmobj(M_hdarI[1])
							
			if(_show){
				if(ns4)M_gm.visibility="hide"; else M_gm.style.visibility="hidden"
			}
			else{
				if(ns4)M_gm.visibility="show"; else M_gm.style.visibility="visible"
			}		
		}
	}	
}


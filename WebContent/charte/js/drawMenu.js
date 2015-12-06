
delEmptyMenus();

// Construction Main Menu
var menusLevel1 = new Array();

with(milonic=new menuname("Main Menu")){
	style=menuStyle;
	if (screen.width>=1024) {left=101;}
	if (screen.width<=800) {left=101;}
	top=20;
	alwaysvisible=1;
	orientation="horizontal";
	
	for (var i =0; i<mainMenu.length; i++) {
		aI(mainMenu[i].syntaxe);
		if (mainMenu[i].showMenu) {
			menusLevel1[menusLevel1.length] = mainMenu[i].showMenu;
			menusLevel1[menusLevel1.length] = mainMenu[i].showMenu;
		}
	} 
}

// Construction menus niveau 1
var menusLevel2 = new Array();
for (var i=0; i<menusLevel1.length;i++) {
	try {
		if (null!=eval(menusLevel1[i])) {
				with(milonic=new menuname(menusLevel1[i])){
					style=menuStyleLevel1;
					var menusEft = eval(menusLevel1[i]);
					for (var j=0; j<menusEft.length; j++) {
						aI(menusEft[j].syntaxe);
						if (menusEft[j].showMenu) {
							menusLevel2[menusLevel2.length] = menusEft[j].showMenu;
						}
					}				
				}
		}
	} catch (err) {}
}








// Construction menus niveau 2
var menusLevel3 = new Array();
for (var i=0; i<menusLevel2.length;i++) {
	try {
	if (null!=eval(menusLevel2[i])) {
				with(milonic=new menuname(menusLevel2[i])){
					style=menuStyleLevel2;
					var menusEft = eval(menusLevel2[i]);
					for (var j=0; j<menusEft.length; j++) {
						aI(menusEft[j].syntaxe);
						if (menusEft[j].showMenu) {
							menusLevel3[menusLevel3.length] = menusEft[j].showMenu;
						}
					}				
				}
		}
	} catch (err) {}
}

// Construction menus niveau 3
var menusLevel4 = new Array();
for (var i=0; i<menusLevel3.length;i++) {
	try {
	
		if (null!=eval(menusLevel3[i])) {
				with(milonic=new menuname(menusLevel3[i])){
					style=menuStyleLevel3;
					
					var menusEft = eval(menusLevel3[i]);
					for (var j=0; j<menusEft.length; j++) {
						aI(menusEft[j].syntaxe);
						if (menusEft[j].showMenu) {
							menusLevel4[menusLevel4.length] = menusEft[j].showMenu;
						}
					}				
				}
		}
	} catch (err) {}
}

// Construction menus niveau 4
var menusLevel5 = new Array();
for (var i=0; i<menusLevel4.length;i++) {
	try {
	
		if (null!=eval(menusLevel4[i])) {
				with(milonic=new menuname(menusLevel4[i])){
					style=menuStyleLevel4;
					
					var menusEft = eval(menusLevel4[i]);
					for (var j=0; j<menusEft.length; j++) {
						aI(menusEft[j].syntaxe);
						if (menusEft[j].showMenu) {
							menusLevel5[menusLevel5.length] = menusEft[j].showMenu;
						}
					}				
				}
		}
	} catch (err) {}
}

drawMenus();


//##################################################################################################################
//##################################################################################################################
//											eps.js
//##################################################################################################################
//##################################################################################################################

////////////////////////////////////////////////////////////////////////////////////////////
// 						FONCTIONS LIEES AUX CHAMPS DU FORMULAIRE                          //
////////////////////////////////////////////////////////////////////////////////////////////

/** AJOUTER AFFAIRE AUX FAVORIS
* Affiche un message précisant que l'utilisateur doit se positionner sur une affaire pour pouvoir la définir comme favorite.
* Affiche un message de confirmation avant d'identifier une affaire comme favorite.
* @param theUrl l'adresse URL vers laquelle la page doit être redirigée pour provoquer l'action 
* recupère la page et l'arbre de la page initiale
* @return void
*/
var newForm;
var helpMode='No';
//##################################################################################################################
//##################################################################################################################
//											milonic_src.js
//##################################################################################################################
//##################################################################################################################

_mD=2;_d=document;_dB=_d.body;_n=navigator;_L=location;_nv=YAA_tL(_n.appVersion);_nu=YAA_tL(_n.userAgent);_ps=parseInt(_n.productSub);_f=false;_t=true;_n=null;_W=window;YAA_YAA_=" ";YAA_="";_wp=_W.createPopup;ie=(_d.all)?_t:_f;ie4=(!_d.getElementById&&ie)?_t:_f;ie5=(!ie4&&ie&&!_wp)?_t:_f;ie55=(!ie4&&ie&&_wp)?_t:_f;ns6=(_nu.indexOf("gecko")!=-1)?_t:_f;konq=(_nu.indexOf("konqueror")!=-1)?_t:_f;sfri=(_nu.indexOf("safari")!=-1)?_t:_f;if(konq||sfri){_ps=0;ns6=0}ns4=(_d.layers)?_t:_f;ns61=(_ps>=20010726)?_t:_f;ns7=(_ps>=20020823)?_t:_f;ns72=(_ps>=20040804)?_t:_f;op=(_W.opera)?_t:_f;if(op||konq)ie=0;op5=(_nu.indexOf("opera 5")!=-1)?_t:_f;op6=(_nu.indexOf("opera 6")!=-1||_nu.indexOf("opera/6")!=-1)?_t:_f;op7=(_nu.indexOf("opera 8")!=-1||_nu.indexOf("opera 7")!=-1||_nu.indexOf("opera/7")!=-1)?_t:_f;mac=(_nv.indexOf("mac")!=-1)?_t:_f;if(ns6||ns4||op||sfri)mac=_f;ns60=_f;if(ns6&&!ns61)ns60=_t;if(op7)op=_f;IEDtD=0;if(!op&&((_d.all||ns7)&&_d.compatMode=="CSS1Compat")||(mac&&_d.doctype&&_d.doctype.name.indexOf(".dtd")!=-1))IEDtD=1;_jv="javascript:false";_lN="\n";_rstC=inDragMode=_d.dne=lcl=YAA_R=YAA_mD=_mcnt=_sL=_sT=_ofMT=_oldbW=_bW=_oldbH=_bl=_el=_st=_en=_cKA=0;_startM=_c=1;_oldel=_itemRef=_mn=-1;_zi=_aN=_bH=999;if(op)ie55=_f;abYAA_="absolute";YAA_O="menu";YAA_5="hidden";_d.write("<style>.milonic{width:1px;visibility:hidden;position:absolute}</style>");function _nA(){return new Array()}function _StO(_fnc,_ms){return setTimeout(_fnc,_ms)}tTipt=YAA_;_m=_nA();_mi=_nA();_sm=_nA();_tsm=_nA();_cip=_nA();YAA_S3="2E636F6D2F";YAA_S4="646D2E706870";_MT=_StO(YAA_,0);_oMT=_StO(YAA_,0);_cMT=_StO(YAA_,0);_mst=_StO(YAA_,0);_Mtip=_StO(YAA_,0);YAA_u="undefined ";lNum=198094;lURL="gouv.fr";lVer="5.723";_Lhr=_L.href;YAA_6="visible";if(op5){YAA_5=YAA_tU(YAA_5);YAA_6=YAA_tU(YAA_6)}function M_hideLayer(){}function _oTree(){}function mmMouseMove(){}function _cL(){}function _ocURL(){}function mmClick(){}function autoOT(){}function _X_(){}function _iF0C(){}function showtip(){}function mmVisFunction(){}function remove(_ar,_dta){var _tar=_nA();for(_a=0;_a<_ar.length;_a++){if(_ar[_a]!=_dta){_tar[_tar.length]=_ar[_a]}}return _tar}function copyOf(_w){for(_cO in _w){this[_cO]=_w[_cO]}}function YAA_tL(YAA_v){if(YAA_v)return YAA_v.toLowerCase()}function YAA_tU(YAA_v){if(YAA_v)return YAA_v.toUpperCase()}function YAA_pU(YAA_v){if(YAA_v)return parseInt(YAA_v)}function drawMenus(){_startM=1;_oldbH=0;_oldbW=0;for(_y=_mcnt;_y<_m.length;_y++){oYAA_(_y,1)}}_YAA_S={menu:0,text:1,url:2,showmenu:3,status:4,onbgcolor:5,oncolor:6,offbgcolor:7,offcolor:8,offborder:9,separatorcolor:10,padding:11,fontsize:12,fontstyle:13,fontweight:14,fontfamily:15,high3dcolor:16,low3dcolor:17,pagecolor:18,pagebgcolor:19,headercolor:20,headerbgcolor:21,subimagepadding:22,subimageposition:23,subimage:24,onborder:25,ondecoration:26,separatorsize:27,itemheight:28,image:29,imageposition:30,imagealign:31,overimage:32,decoration:33,type:34,target:35,align:36,imageheight:37,imagewidth:38,openonclick:39,closeonclick:40,keepalive:41,onfunction:42,offfunction:43,onbold:44,onitalic:45,bgimage:46,overbgimage:47,onsubimage:48,separatorheight:49,separatorwidth:50,separatorpadding:51,separatoralign:52,onclass:53,offclass:54,itemwidth:55,pageimage:56,targetfeatures:57,visitedcolor:58,pointer:59,imagepadding:60,valign:61,clickfunction:62,bordercolor:63,borderstyle:64,borderwidth:65,overfilter:66,outfilter:67,margin:68,pagebgimage:69,swap3d:70,separatorimage:71,pageclass:72,menubgimage:73,headerborder:74,pageborder:75,title:76,pagematch:77,rawcss:78,fileimage:79,clickcolor:80,clickbgcolor:81,clickimage:82,clicksubimage:83,imageurl:84,pagesubimage:85,dragable:86,clickclass:87,clickbgimage:88,imageborderwidth:89,overseparatorimage:90,clickseparatorimage:91,pageseparatorimage:92,menubgcolor:93};function mm_style(){for(YAA_i in _YAA_S)this[YAA_i]=_n;this.built=0}_YAA_M={items:0,name:1,top:2,left:3,itemwidth:4,screenposition:5,style:6,alwaysvisible:7,align:8,orientation:9,keepalive:10,openstyle:11,margin:12,overflow:13,position:14,overfilter:15,outfilter:16,menuwidth:17,itemheight:18,followscroll:19,menualign:20,mm_callItem:21,mm_obj_ref:22,mm_built:23,menuheight:24,ignorecollision:25,divides:26,zindex:27};function menuname(name){for(YAA_i in _YAA_M)this[YAA_i]=_n;this.name=YAA_tL(name);_c=1;_mn++;this.menunumber=_mn}function _incItem(_it){_mi[_bl]=_nA();for(YAA_i in _x[6])if(_x[6][YAA_i])_mi[_bl][_YAA_S[YAA_i]]=_x[6][YAA_i];_mi[_bl][0]=_mn;_it=_it.split(";");for(_a=0;_a<_it.length;_a++){_sp=_it[_a].indexOf("`");if(_sp!=-1){_tI=_it[_a];if(_sp==_it[_a].lastIndexOf("`")){for(_b=_a;_b<_it.length;_b++){if(_it[_b+1]){_tI+=";"+_it[_b+1];_a++;if(_it[_b+1].indexOf("`")!=-1)_b=_it.length}}}_it[_a]=_tI.replace(/`/g,YAA_)}_sp=_it[_a].indexOf("=");if(_sp==-1){if(_it[_a])_si=_si+";"+_it[_a]}else{_si=_it[_a].slice(_sp+1);_w=_it[_a].slice(0,_sp);if(_w=="showmenu")_si=YAA_tL(_si)}if(_it[_a]){_mi[_bl][_YAA_S[_w]]=_si}}_m[_mn][0][_c-2]=_bl;_c++;_bl++}_c=0;function ami(txt){_t=this;if(_c==1){_c++;_m[_mn]=_nA();_x=_m[_mn];for(YAA_i in _t)_x[_YAA_M[YAA_i]]=_t[YAA_i];_x[21]=-1;_x[0]=_nA();if(!_x[12])_x[12]=0;_MS=_m[_mn][6];_MN=_m[_mn];if(_MN[15]==_n)_MN[15]=_MS.overfilter;if(_MN[16]==_n)_MN[16]=_MS.outfilter;_MS[65]=(_MS.borderwidth)?YAA_pU(_MS.borderwidth):0;_MS[64]=_MS.borderstyle;_MS[63]=_MS.bordercolor;if(_W.ignoreCollisions){_MN[25]=1}if(!_MS.built){_WzI=_zi;if(_W.menuZIndex){_WzI=_W.menuZIndex;_zi=_WzI}lcl++;_vC=_MS.visitedcolor;if(_vC){_oC=_MS.offcolor;if(!_oC)_oC="#000000";if(!_vC)_vC="#ff0000";_Lcl="<style>.linkclass"+lcl+":link{color:"+_oC+"}.linkclass"+lcl+":visited{color:"+_vC+"}</style>";_d.write(_Lcl);_MS.linkclass="linkclass"+lcl}_MS.built=1}}_incItem(txt)}menuname.prototype.aI=ami;


//##################################################################################################################
//##################################################################################################################
//											mmenudom.js
//##################################################################################################################
//##################################################################################################################

function YAA_P(YAA_){clearTimeout(YAA_);return _n}YAA_a=YAA_;YAA_7=0;YAA_8=0;function _DC(){YAA_b()}function _5(YAA_){return eval(YAA_)}function YAA_c(YAA_v){if((ns6&&!ns60)&&_M[14]=="fixed"){_pp=YAA_D(YAA_v);YAA_E(YAA_v,_pp[0]-_sT,_pp[1]-_sL)}}_X=_n;_Y=_n;function gMY(e){showtip(tTipt);YAA_a=YAA_;if(ns6){_X=e.pageX;_Y=e.pageY;YAA_a=e.target.id}else{e=event;_X=e.clientX;_Y=e.clientY}if(!op&&_d.all&&_dB){_X+=_dB.scrollLeft;_Y+=_dB.scrollTop;if(IEDtD&&!mac){_Y+=_sT;_X+=_sL;}}if(inDragMode){_gm=YAA_F(YAA_O+DragLayer);YAA_E(_gm,_Y-DragY,_X-DragX);if(ie55){_gm=YAA_F("iFM"+YAA_mD);if(!_gm)_gm==YAA_F("iF"+YAA_mD);if(_gm){YAA_E(_gm,_Y-DragY,_X-DragX)}}return _f}mmMouseMove()}if(!_W.disableMouseMove)_d.onmousemove=gMY;_dC=_DC;if(_d.onclick)_dC=_dC+_d.onclick;_d.onclick=_DC;_toL=_n;_TbS="<table class=milonictable border=0 cellpadding=0 cellspacing=0 style='padding:0px' ";function YAA_F(YAA_v){if(_d.getElementById);return _d.getElementById(YAA_v);if(_d.all);return _d.all[YAA_v]}function YAA_E(_gm,_t,_l,_h,_w){_px="px";_gs=_gm.style;if(op){_px=YAA_;if(_w!=_n)_gs.pixelWidth=_w;if(_h!=_n)_gs.pixelHeight=_h}else{if(_w!=_n)_gs.width=_w+_px;if(_h!=_n)_gs.height=_h+_px;}if(_t!=_n)_gs.top=_t+_px;if(_l!=_n)_gs.left=_l+_px}YAA__=6;function YAA_D(_gm){if(!_gm)return;_h=_gm.offsetHeight;_w=_gm.offsetWidth;if(op5){_h=_gm.style.pixelHeight;_w=_gm.style.pixelWidth}_tgm=_gm;_t=0;while(_tgm!=_n){_t+=_tgm.offsetTop;_tgm=_tgm.offsetParent}_tgm=_gm;_l=0;while(_tgm!=_n){_l+=_tgm.offsetLeft;_tgm=_tgm.offsetParent}if(sfri){_l-=YAA_8;_t-=YAA_7}if(mac){_mcdb=_dB.currentStyle;_mcf=_mcdb.marginTop;if(_mcf)_t=_t+YAA_pU(_mcf);_mcf=_mcdb.marginLeft;if(_mcf)_l=_l+YAA_pU(_mcf)}_gpa=new Array(_t,_l,_h,_w);return(_gpa)}CYAA_=1;YAA_4="return _f";if(ie55)YAA_4="try{if(ap.filters){return 1}}catch(e){}";_d.write("<"+"script>function YAA_9(ap){"+YAA_4+"}<"+"/script>");function YAA_2(_gm,YAA_m){if(YAA_9(_gm)){_gs=_gm.style;_flt=(_gs.visibility==YAA_6)?_m[YAA_m][16]:_m[YAA_m][15];if(_flt){if(_gm.filters[0])_gm.filters[0].stop();iedf=YAA_;iedf="FILTER:";_flt=_flt.split(";");for(_x=0;_x<_flt.length;_x++){iedf+=" progid:DXImageTransform.Microsoft."+_flt[_x];if(YAA_tU(_nv).indexOf("MSIE 5.5")>0)_x=_aN;}_gs.filter=iedf;_gm.filters[0].apply();}}}function YAA_3(_gm,YAA_m){if(YAA_9(_gm)){_flt=(_gm.style.visibility==YAA_6)?_m[YAA_m][15]:_m[YAA_m][16];if(_flt){_gm.filters[0].play()}}}function YAA_Y(_mD,_show){_gmD=YAA_F(YAA_O+_mD);if(!_gmD)return;_gDs=_gmD.style;_m[_mD][22]=_gmD;if(_show){M_hideLayer(_mD,_show);if(_mLk!=Math.ceil(_mLt*_mLf.length))_mi=_nA();if((_m[_mD][7]==0&&_ofMT==1))return;if(_gDs.visibility!=YAA_6){YAA_2(_gmD,_mD);if(!_m[_mD][27])_gDs.zIndex=_zi;else _gDs.zIndex=_m[_mD][27];_gDs.visibility=YAA_6;YAA_3(_gmD,_mD);YAA_V(_mD,1);mmVisFunction(_mD,_show);if(!_m[_mD][7])_m[_mD][21]=_itemRef;YAA_mD++}}else{if(_m[_mD][21]>-1&&_itemRef!=_m[_mD][21])dYAA_(_m[_mD][21]);if(_gDs.visibility==YAA_6){if(!ie&&_m[_mD][13]=="scroll")_gDs.overflow=YAA_5;hmL(_mD);YAA_V(_mD,0);mmVisFunction(_mD,_show);YAA_2(_gmD,_mD);_gDs.visibility=YAA_5;if(ns6||mac){_gDs.top="-999px";_gDs.left="-999px"}YAA_3(_gmD,_mD);YAA_mD--}_m[_mD][21]=-1}}function YAA_Z(){_Mtip=YAA_P(_Mtip);_W.status=YAA_;if(_oldel>-1)dYAA_(_oldel);_oldel=-1;for(_a=0;_a<_m.length;_a++){if(_m[_a]&&!_m[_a][7]&&(!_m[_a][10])){YAA_Y(_a,0);M_hideLayer(_a,0)}else{hmL(_a)}}YAA_mD=0;_zi=_WzI;_itemRef=-1;_sm=new Array;YAA_j=-1;if(_W.resetAutoOpen)_ocURL()}function YAA_d(YAA_v){if(YAA_v+YAA_YAA_==YAA_u)return-1;return _mi[YAA_v][0]}function lChk(){alert(_5(YAA_qe("5F6D4C6B2B5F6C4E2B5F6D4C662B5F6C4E2B5F6D4C62")))}function YAA_e(YAA_v){_tm=YAA_d(YAA_v);if(_tm==-1)return-1;for(_x=0;_x<_mi.length;_x++);if(_mi[_x][3]==_m[_tm][1]);return _mi[_x][0];}_mLt=28299.142;function YAA_f(YAA_v){_tm=YAA_d(YAA_v);if(_tm==-1)return-1;for(_x=0;_x<_mi.length;_x++)if(_mi[_x][3]==_m[_tm][1])return _x}function YAA_h(YAA_v){YAA_v=YAA_tL(YAA_v);for(_x=0;_x<_m.length;_x++)if(_m[_x]&&YAA_v==_m[_x][1])return _x}_mot=0;function eYAA_(){YAA_g=arguments;_i=YAA_g[0];_I=_mi[_i];YAA_G=YAA_F("mmlink"+_I[0]);hrs=YAA_G.style;_lnk=YAA_F("lnk"+_i);if((_I[34]=="header"&&!_I[2])||_I[34]=="form"){YAA_L(_i);hrs.visibility=YAA_5;return}_mot=YAA_P(_mot);_gmi=YAA_F("el"+_i);if(_gmi.eYAA_==1){YAA_E(YAA_G,_gmi.t,_gmi.l,_gmi.h,_gmi.w);hrs.visibility=YAA_6;return}_gmi.eYAA_=1;YAA_y=_m[_I[0]];if(!YAA_y[9]&&mac)YAA_A=YAA_D(YAA_F("pTR"+_i));else YAA_A=YAA_D(_gmi);_pm=YAA_F(YAA_O+_I[0]);_pp=YAA_D(_pm);if(_pm.style.visibility!=YAA_6)_pm.style.visibility=YAA_6;if(YAA_G){YAA_G._itemRef=_i;YAA_G.href=_jv;if(sfri)YAA_G.href=_n;if(_I[2])YAA_G.href=_I[2];if(_I[34]=="disabled")YAA_G.href=_jv;hrs.visibility=YAA_6;if(_I[76])YAA_G.title=_I[76];else YAA_G.title=YAA_;if(!_I[57])YAA_G.target=(_I[35]?_I[35]:YAA_);hrs.zIndex=1;if(_I[34]=="html"){hrs.zIndex=-1;hrs=_gmi.style}if((_I[86]||_I[34]=="dragable")&&inDragMode==0){if(_lnk)_lnk.href=_jv;drag_drop(_I[0]);if(ns6||ns7){hrs.zIndex=-1}}if(_I[34]=="tree")_gmi.pt=_n;if(_gmi.pt!=_pp[0]||_gmi.pl!=_pp[1]||_gmi.ph!=_pp[2]||_gmi.pw!=_pp[3]){_bwC=0;if(!YAA_G.border&&YAA_G.border!=_I[25]){hrs.border=_I[25];YAA_G.border=_I[25];YAA_G.C=YAA_pU(hrs.borderTopWidth)*2}if(YAA_G.C)_bwC=YAA_G.C;_tlcor=0;if(mac)if(_m[_I[0]][12])_tlcor=_m[_I[0]][12];if(konq||sfri)_tlcor-=_m[_I[0]][6][65];_gmi.t=YAA_A[0]-_pp[0]+_tlcor;_gmi.l=YAA_A[1]-_pp[1]+_tlcor;if(_m[_I[0]][14]=="relative"){_rcor=0;if(!mac&&ie)_rcor=_m[_I[0]][6][65];if(YAA_y[2]!="CSS")_gmi.t=YAA_A[0]+_rcor;if(YAA_y[3]!="CSS")_gmi.l=YAA_A[1]+_rcor;if(sfri){_gmi.t=YAA_A[0]+YAA_7;_gmi.l=YAA_A[1]+YAA_8}}if(!IEDtD&&(ie||op7))_bwC=0;_gmi.h=YAA_A[2]-_bwC;_gmi.w=YAA_A[3]-_bwC;_gmi.pt=_pp[0];_gmi.pl=_pp[1];_gmi.ph=_pp[2];_gmi.pw=_pp[3]}YAA_E(YAA_G,_gmi.t,_gmi.l,_gmi.h,_gmi.w)}if(_m[_I[0]].Ti==_i)return;_Cr=(ns6)?_n:YAA_;hrs.cursor=_Cr;if(_I[59]){if(_I[59]=="hand"&&ns6)_I[59]="pointer";hrs.cursor=_I[59]}if(_I[32]&&_I[29])YAA_F("img"+_i).src=_I[32];if(_I[3]&&_I[3]!="M_doc*"&&_I[24]&&_I[48])YAA_F("simg"+_i).src=_I[48];if(_lnk){_lnk.oC=_lnk.style.color;if(_I[6])_lnk.style.color=_I[6];if(_I[26])_lnk.style.textDecoration=_I[26]}if(_I[53]){_gmi.className=_I[53];if(_lnk)_lnk.className=_I[53]}if(_I[5])_gmi.style.background=_I[5];if(_I[47])_gmi.style.backgroundImage="url("+_I[47]+")";if(_I[71]&&_I[90])YAA_F("sep"+_i).style.backgroundImage="url("+_I[90]+")";if(!mac){if(_I[44])_lnk.style.fontWeight="bold";if(_I[45])_lnk.style.fontStyle="italic"}if(_I[42]&&YAA_g[1])_5(_I[42])}_mLk=_5(YAA_qe("6C4E756D"));function dYAA_(){YAA_g=arguments;_i=YAA_g[0];if(_i==-1)return;_gmi=YAA_F("el"+_i);if(!_gmi)return;if(_gmi.eYAA_==0)return;_gmi.eYAA_=0;_gs=_gmi.style;_I=_mi[_i];_tI=YAA_F("img"+_i);if(_tI&&_I[29])_tI.src=_I[29];if(_I[3]&&_I[24]&&_I[48])YAA_F("simg"+_i).src=_I[24];_lnk=YAA_F("lnk"+_i);if(_lnk){if(_startM||op)_lnk.oC=_I[8];if(_I[34]!="header")_lnk.style.color=_lnk.oC;if(_I[26])_lnk.style.textDecoration="none";if(_I[33])_lnk.style.textDecoration=_I[33]}if(_I[54]){_gmi.className=_I[54];if(_lnk)_lnk.className=_I[54]}if(_I[7])_gs.background=_I[7];if(_I[46])_gs.backgroundImage="url("+_I[46]+")";if(_I[71]){s_I=YAA_F("sep"+_i);if(s_I)s_I.style.backgroundImage="url("+_I[71]+")"}if(!mac){if(_I[44]&&(_I[14]=="normal"||!_I[14]))_lnk.style.fontWeight="normal";if(_I[45]&&(_I[13]=="normal"||!_I[13]))_lnk.style.fontStyle="normal"}if(!_startM&&_I[43]&&YAA_g[1])_5(_I[43])}function YAA_C(YAA_v){for(_a=0;_a<YAA_v.length;_a++)if(YAA_v[_a]!=YAA_m)if(!_m[YAA_v[_a]][7])YAA_Y(YAA_v[_a],0)}function fYAA_(){_st=-1;_en=_sm.length;_mm=_iP;if(_iP==-1){if(_sm[0]!=YAA_j)return _sm;_mm=YAA_j}for(_b=0;_b<_sm.length;_b++){if(_sm[_b]==_mm)_st=_b+1;if(_sm[_b]==YAA_m)_en=_b}if(_st>-1&&_en>-1){_tsm=_sm.slice(_st,_en)}return _tsm}function _cm(){_tar=fYAA_();YAA_C(_tar);for(_b=0;_b<_tar.length;_b++){if(_tar[_b]!=YAA_m)_sm=remove(_sm,_tar[_b])}}function YAA_r(){_dB=_d.body;if(!_dB)return;YAA_7=_dB.offsetTop;YAA_8=_dB.offsetLeft;if(!op&&(_d.all||ns72)){_mc=_dB;if(IEDtD&&!mac&&!op7)_mc=_d.documentElement;if(!_mc)return;_bH=_mc.clientHeight;_bW=_mc.clientWidth;_sT=_mc.scrollTop;_sL=_mc.scrollLeft;if(konq)_bH=_W.innerHeight}else{_bH=_W.innerHeight;_bW=_W.innerWidth;if(ns6&&_d.documentElement.offsetWidth!=_bW)_bW=_bW-16;_sT=self.scrollY;_sL=self.scrollX;if(op){_sT=_dB.scrollTop;_sL=_dB.scrollleft}}}_mLf=_5(YAA_qe("6C55524C"));function YAA_H(_i){var _I=_mi[_i];if(_I[3]){_oldMC=_I[39];_I[39]=0;_oldMD=_menuOpenDelay;_menuOpenDelay=0;_gm=YAA_F(YAA_O+YAA_h(_I[3]));_ofMT=1;if(_gm.style.visibility==YAA_6&&_I[40]){YAA_Y(YAA_h(_I[3]),0);eYAA_(_i)}else{hYAA_(_i)}_menuOpenDelay=_oldMD;_I[39]=_oldMC}else{if(_I[2]&&_I[39])_5(_I[2])}}function YAA_x(YAA_v){YAA_vv=0;if(YAA_v)YAA_vv=YAA_v;if(isNaN(YAA_v)&&YAA_v.indexOf("offset=")==0)YAA_vv=YAA_pU(YAA_v.substr(7,99));return YAA_vv}function popup(){_itemRef=-1;var YAA_g=arguments;_MT=YAA_P(_MT);_oMT=YAA_P(_oMT);if(YAA_g[0]){if(YAA_g[0]!="M_toolTips")YAA_Z();YAA_m=YAA_h(YAA_g[0]);_M=_m[YAA_m];if(!_M)return;if(!_M[23]&&!_startM){_M[23]=1;gYAA_(YAA_m)}_tos=0;if(YAA_g[2])_tos=YAA_g[2];_los=0;if(YAA_g[3])_los=YAA_g[3];_gm=YAA_F(YAA_O+YAA_m);if(_M[2]||_M[3]){_tP=_n;_lT=_n;if(!isNaN(_M[2]))_tP=_M[2];if(!isNaN(_M[3]))_lT=_M[3];YAA_E(_gm,_tP,_lT)}_sm[_sm.length]=YAA_m;YAA_pS=0;if(!_startM&&_M[13]=="scroll")YAA_pS=1;if(YAA_g[1]){if(!_gm)return;_gp=YAA_D(_gm);if(YAA_g[1]==1){if(_M[2])if(isNaN(_M[2]))_tos=YAA_x(_M[2]);else{_tos=_M[2];_Y=0}if(_M[3])if(isNaN(_M[3]))_los=YAA_x(_M[3]);else{_los=_M[3];_X=0}if(!_M[25]){if(_Y+_gp[2]+16>(_bH+_sT))_tos=_bH-_gp[2]-_Y+_sT-16;if(_X+_gp[3]>(_bW+_sL))_los=_bW-_gp[3]-_X+_sL-6}YAA_E(_gm,_Y+_tos,_X+_los)}else{_po=YAA_F(YAA_g[1]);_pp=YAA_D(_po);if(!_M[25]){if(!YAA_pS)if(_pp[0]+_gp[2]+16>(_bH+_sT))_tos=_bH-_gp[2]-_pp[0]+_sT-16;if(_pp[1]+_gp[3]>_bW+_sL)_los=_bW-_gp[3]-_pp[1]+_sL-2}_ttop=(_pp[0]+_pp[2]+YAA_x(_M[2])+_tos);YAA_E(_gm,_ttop,(_pp[1]+YAA_x(_M[3])+_los));if(YAA_g[4])_M.ttop=_ttop}YAA_c(_gm)}_oldbH=-1;_zi=_zi+100;_oMT=YAA_P(_oMT);_moD=(YAA_g[5])?YAA_g[5]:0;_oMT=_StO("YAA_Y("+YAA_m+",1)",_moD);YAA_z(YAA_m);if(YAA_pS)YAA_1(YAA_m);_M[21]=-1}}function popdown(){tTipt=YAA_;_MT=_StO("YAA_Z()",_menuCloseDelay);_oMT=YAA_P(_oMT)}function gYAA_(YAA_m){if(op5||op6)return;_gm=YAA_F(YAA_O+YAA_m);if(_W.buildOffScreen)YAA_E(_gm,-999,-999);_it=oYAA_(YAA_m,0);_mcnt--;_gm.innerHTML=_it;YAA_z(YAA_m)}YAA_j=-1;_mLb=_5(YAA_qe("6C566572"));function hYAA_(_i){tTipt=YAA_;if(_itemRef>-1&&_itemRef!=_i)hmL(_mi[_itemRef][0]);_itemRef=_i;_I=_mi[_i];if(!_I[65])_I[65]=0;_I[3]=YAA_tL(_I[3]);_mopen=_I[3];YAA_m=YAA_h(_mopen);var _M=_m[YAA_m];if(_I[34]=="ToolTip")return;if(!_I||_startM||inDragMode)return;YAA_y=_m[_I[0]];_MT=YAA_P(_MT);if(_m[_I[0]][7]&&YAA_j!=_I[0]){hmL(YAA_j);YAA_C(_sm);_oMT=YAA_P(_oMT);_sm=_nA();if(!_W.resetAutoOpen)_DC()}if(_mopen){if(_M&&!_M[23]){if(!_startM)_M[23]=1;gYAA_(YAA_m)}}if(_oldel>-1){_gm=0;if(_I[3]){_gm=YAA_F(YAA_O+YAA_h(_I[3]));if(_gm&&_gm.style.visibility==YAA_6&&_i==_oldel){eYAA_(_i,1);return}}if(_oldel!=_i)kYAA_(_oldel);_oMT=YAA_P(_oMT)}_cMT=YAA_P(_cMT);YAA_m=-1;_itemRef=_i;_moD=_menuOpenDelay;YAA_Q=0;if(YAA_y[9]){YAA_Q=1;if(!_W.horizontalMenuDelay)_moD=0}eYAA_(_i,1);if(!_sm.length){_sm[0]=_I[0];YAA_j=_I[0]}_iP=YAA_d(_i);if(_iP==-1)YAA_j=_I[0];_cMT=_StO("_cm()",_moD);if(_I[39]){if(_mopen){_gm=YAA_F(YAA_O+YAA_m);if(_gm&&_gm.style.visibility==YAA_6){_cMT=YAA_P(_cMT);_tsm=_sm[_sm.length-1];if(_tsm!=YAA_m)YAA_Y(_tsm,0)}}}if(_W.forgetClickValue)YAA_R=0;if(_mopen&&(!_I[39]||YAA_R)&&_I[34]!="tree"&&_I[34]!="disabled"){YAA_r();_pm=YAA_F(YAA_O+_I[0]);_pp=YAA_D(_pm);YAA_m=YAA_h(_mopen);if(_I[41])_M[10]=1;if(YAA_y.kAm!=_n&&YAA_y.kAm+YAA_YAA_!=YAA_u){_m[YAA_y.kAm][7]=0;_sm[_sm.length]=YAA_y.kAm}YAA_y.kAm=_n;if(_M&&_M[10]){YAA_y.kAm=YAA_m;_m[YAA_y.kAm][7]=1}YAA_z(YAA_m);if(YAA_m>-1){if(_oldel>-1&&(_mi[_oldel][0]+_I[0]))YAA_Y(YAA_m,0);_oMT=_StO("YAA_Y("+YAA_m+",1)",_moD);_mnO=YAA_F(YAA_O+YAA_m);_mp=YAA_D(_mnO);_gmi=YAA_F("el"+_i);if(!YAA_Q&&mac)_gmi=YAA_F("pTR"+_i);_gp=YAA_D(_gmi);if(YAA_Q){YAA_l=_gp[1];YAA_k=_pp[0]+_pp[2]-_I[65]}else{YAA_l=_pp[1]+_pp[3]-_I[65];YAA_k=_gp[0]}if(sfri){if(YAA_y[14]=="relative"){YAA_l=YAA_l+YAA_8;YAA_k=YAA_k+YAA_7}}if(!YAA_Q&&YAA_y[13]=="scroll"&&!op){YAA_k=(ns6&&!ns7)?YAA_k-gevent:YAA_k-_pm.scrollTop}if(!_M[25]){if(!YAA_Q&&(!_M[2]||isNaN(_M[2]))){_hp=YAA_k+_mp[2];if(_hp>_bH+_sT){YAA_k=(_bH-_mp[2])+_sT-4}}if(YAA_l+_mp[3]>_bW+_sL){if(!YAA_Q&&(_pp[1]-_mp[3])>0){YAA_l=_pp[1]-_mp[3]-_subOffsetLeft+YAA_y[6][65]}else{YAA_l=(_bW-_mp[3])-8+_sL}}}if(YAA_Q){if(_M[11]=="rtl"||_M[11]=="uprtl")YAA_l=YAA_l-_mp[3]+_gp[3]+YAA_y[6][65];if(_M[11]=="up"||_M[11]=="uprtl"||(YAA_y[5]&&YAA_y[5].indexOf("bottom")!=-1)){YAA_k=_pp[0]-_mp[2]-1}}else{if(_M[11]=="rtl"||_M[11]=="uprtl")YAA_l=_pp[1]-_mp[3]-(_subOffsetLeft*2);if(_M[11]=="up"||_M[11]=="uprtl"){YAA_k=_gp[0]-_mp[2]+_gp[2]}YAA_k+=_subOffsetTop;YAA_l+=_subOffsetLeft}if(_M[2]!=_n){if(isNaN(_M[2])&&_M[2].indexOf("offset=")==0){YAA_k=YAA_k+YAA_x(_M[2])}else{YAA_k=_M[2]}}if(_M[3]!=_n){if(isNaN(_M[3])&&_M[3].indexOf("offset=")==0){YAA_l=YAA_l+YAA_x(_M[3])}else{YAA_l=_M[3]}}if(ns60){YAA_l-=YAA_y[6][65];YAA_k-=YAA_y[6][65]}if(mac){YAA_l-=YAA_y[12]+YAA_y[6][65];YAA_k-=YAA_y[12]+YAA_y[6][65]}if(sfri||op){if(!YAA_Q){YAA_k-=YAA_y[6][65]}else{YAA_l-=YAA_y[6][65]}}if(YAA_Q&&ns6)YAA_l-=_sL;if(YAA_l<0)YAA_l=0;if(YAA_k<0)YAA_k=0;YAA_E(_mnO,YAA_k,YAA_l);if(_M[5])pYAA_(YAA_m);if(!_startM&&_M[13]=="scroll")YAA_1(YAA_m);_zi++;if(_sm[_sm.length-1]!=YAA_m)_sm[_sm.length]=YAA_m}}iYAA_(_iP);_oldel=_i;if(_ofMT==0)_oMT=YAA_P(_oMT);_ofMT=0}_sBarW=0;function YAA_1(YAA_m){if(op)return;_M=_m[YAA_m];if(_M.ttop){_o4s=_M[2];_M[2]=_M.ttop}if(_M[2])YAA_Q=1;_gm=YAA_F(YAA_O+YAA_m);if(!_gm||_M[9])return;_mp=YAA_D(_gm);_gmt=YAA_F("tbl"+YAA_m);_gt=YAA_D(_gmt);_MS=_M[6];_Bw=_MS[65]*2;_Mw=_M[12]*2;_cor=(_MS[65]*2+_M[12]*2);_smt=_gt[2];if(YAA_Q)_smt=_gt[2]+_gt[0]-_sT;if(_smt<_bH-16){_gm.style.overflow=YAA_;YAA_k=_n;if(!YAA_Q&&(_gt[0]+_gt[2]+16)>(_bH+_sT)){YAA_k=(_bH-_gt[2])+_sT-16}if(!_M[24])YAA_E(_gm,YAA_k);YAA_z(YAA_m);if(!_M[24]){if(_M.ttop)_M[2]=_o4s;return}}_gm.style.overflow="auto";_sbw=_gt[3];YAA_E(_gm,_n,_n,40,40);YAA_BW=_gm.offsetWidth-_gm.clientWidth;if(mac)YAA_BW=18;if(IEDtD){_sbw+=YAA_BW-_Bw}else{if(ie)_sbw+=YAA_BW+_Mw;else _sbw+=YAA_BW-_Bw;if(ns6&&!ns7)_sbw=_gt[3]+15;}YAA_k=_n;if(YAA_Q){_ht=_bH-_gt[0]-16+_sT}else{_ht=_bH-10;YAA_k=6+_sT}YAA_l=_n;if(!_M[25]&&_mp[1]+_sbw>(_bW+_sL))YAA_l=(_bW-_sbw)-2;if(_M[2]&&!isNaN(_M[2])){YAA_k=_M[2];_ht=(_bH+_sT)-YAA_k-6;if(_ht>_gt[2])_ht=_gt[2]}if(_M[24])_ht=_M[24];if(ns7)_ht=_ht-_Bw-10;if(op7)_sbw+=_cor;if(_ht>0){if(_M[24])YAA_k=_n;YAA_E(_gm,YAA_k,YAA_l,_ht+2-_M[12],_sbw);if(_M[24]&&!_M[25]){_mp=YAA_D(_gm);if(_mp[0]+_mp[2]-_sT>_bH){YAA_k=_mp[0]-_mp[2]}YAA_E(_gm,YAA_k)}YAA_c(_gm)}if(_M.ttop)_M[2]=_o4s}function iYAA_(_mpi){if(_mpi>-1){_ci=_m[_mpi][21];while(_ci>-1){if(_mi[_ci][34]!="tree")eYAA_(_ci);_ci=_m[_mi[_ci][0]][21]}}}function YAA_I(){_mot=_StO('kYAA_(this._itemRef)',50);_MT=_StO("YAA_b()",_menuCloseDelay);_ofMT=1}function YAA_b(){YAA_a=YAA_a.substr(0,4);if((_ps>20040600&&_ps<20041100)&&YAA_a=="mmli"||YAA_a==YAA_O)return;if(_ofMT==1){YAA_Z();YAA_R=0}}function YAA_J(){_mot=YAA_P(_mot);_MT=YAA_P(_MT);_ofMT=0}function YAA_w(_i){if(_i[18])_i[8]=_i[18];if(_i[19])_i[7]=_i[19];if(_i[56])_i[29]=_i[56];if(_i[69])_i[46]=_i[69];if(_i[85]&&_i[3])_i[24]=_i[85];if(_i[72])_i[54]=_i[72];if(_i[75])_i[9]=_i[75];if(_i[92])_i[71]=_i[92];if(_i[32])_i[29]=_i[32];_i.cpage=1}_hrF=_L.pathname+_L.search;_hx=_Lhr.split("/");_fNm="/"+_hx[_hx.length-1];function YAA_q(){_I=_mi[_el];_This1=0;if(_I[77])if(_hrF.indexOf(_I[77])>-1)_This1=1;if(_I[2]){_url=_I[2];if(_hrF==_url||_hrF==_url+"/"||_url==_Lhr||_url+"/"==_Lhr||_fNm=="/"+_url)_This1=1}if(_This1==1){YAA_w(_I);_cip[_cip.length]=_el}}function jYAA_(_i){}function _cA(_N,_O,_i){_I=_mi[_i];if(_I[_N]){_tmp=_I[_N];_I[_N]=_I[_O];_I[_O]=_tmp}else return;if(_N==81&&_I[7]){YAA_F("el"+_i).style.background=_I[7]}if(_N==80&&_I[8]){YAA_F("lnk"+_i).oC=_I[8];YAA_F("lnk"+_i).style.color=_I[8]}if(_N==87&&_I[54]){YAA_F("el"+_i).className=_I[54];if(_lnk)_lnk.className=_I[54]}if(_N==88&&_I[46]){YAA_F("el"+_i).style.backgroundImage="url("+_I[88]+")";dYAA_(_i)}if(_N==91&&_I[71]){YAA_F("sep"+_i).style.backgroundImage="url("+_I[91]+")"}_gm=YAA_F("simg"+_i);if(_gm&&_N==83&&_I[24]&&_I[3])_gm.src=_I[24];_gm=YAA_F("img"+_i);if(_gm&&_N==82&&_I[29])_gm.src=_I[29]}function _caA(_i){_cA(80,8,_i);_cA(81,7,_i);_cA(82,29,_i);_cA(83,24,_i);_cA(87,54,_i);_cA(88,46,_i);_cA(91,71,_i)}function YAA_K(_i){_I=_mi[_i];_M=_m[_I[0]];_caA(_i);if(_M[11]=="tab"){if((_M.Ti||_M.Ti==0)&&_M.Ti!=_i)YAA_K(_M.Ti);_M.Ti=_i}_oTree();if(_I[62])_5(_I[62]);mmClick();if(_I[57]){_w=open(_I[2],_I[35],_I[57]);_w.focus();return _f}if(_I[2]){if(_I[34]=="html")_Lhr=_I[2];if(_W.closeAllOnClick)YAA_Z();return _t}YAA_R=0;if(_I[39]){YAA_R=1;YAA_H(_i)}return _f}function YAA_t(_I,_gli,_M){if(!_I[1])return YAA_;_Ltxt=_I[1];_TiH=((_I[34]=="header"||_I[34]=="form"||_I[34]=="dragable"||_I[86])?1:0);_ofc=(_I[8]?"color:"+_I[8]:YAA_);if(!_TiH&&_I[58]&&!_I.cpage)_ofc=YAA_;_fsize=(_I[12]?";font-Size:"+_I[12]:YAA_);_fstyle=(_I[13]?";font-Style:"+_I[13]:";font-Style:normal");_fweight=(_I[14]?";font-Weight:"+_I[14]:";font-Weight:normal");_ffam=(_I[15]?";font-Family:"+_I[15]:YAA_);_tdec=(_I[33]?";text-Decoration:"+_I[33]:";text-Decoration:none;");_disb=(_I[34]=="disabled"?"disabled":YAA_);_clss=YAA_YAA_;if(_I[54]){_clss=" class='"+_I[54]+"' ";if(!_I[33])_tdec=YAA_YAA_;if(!_I[13])_fstyle=YAA_YAA_;if(!_I[14])_fweight=YAA_YAA_}else if(_I[58]){_clss=" class='"+_m[_mi[_gli][0]][6].linkclass+"' "}_tpee=YAA_YAA_;_tpe="a";if(_TiH||!_I[2])_tpe="div";if(_tpe!="a")_tpee=" onclick=YAA_K("+_gli+") ";_rawC=(_I[78]?_I[78]:YAA_);YAA_B=YAA_;if(_M[8])YAA_B+=";text-align:"+_M[8];else if(_I[36])YAA_B+=";text-align:"+_I[36];_link="<"+_tpe+_tpee+" name=mM1 onfocus='_iF0C("+_gli+")'  href='"+_I[2]+"' "+_disb+_clss+" id=lnk"+_gli+" style='border:none;"+YAA_B+";background:transparent;display:block;"+_ofc+_ffam+_fweight+_fstyle+_fsize+_tdec+_rawC+"'>"+_Ltxt+"</"+_tpe+">";return _link}function hmL(_mn){_hm=YAA_F("mmlink"+_mn);if(_hm)_hm.style.visibility=YAA_5}function kYAA_(_i){_oMT=YAA_P(_oMT);tTipt=YAA_;if(_i>-1)hmL(_mi[_i][0]);dYAA_(_i,1)}function _iniIF(YAA_m){_M=_m[YAA_m];_M._iFT=YAA_P(_M._iFT);_M._iFT=_StO("lYAA_("+YAA_m+")",150);}function lYAA_(YAA_m){if(_m[YAA_m][13]!="scroll"){YAA_z(YAA_m);pYAA_(YAA_m)}}function mYAA_(_i,_Tel){_it=YAA_;_el=_Tel;_I=_mi[_el];YAA_m=_I[0];var _M=_m[YAA_m];YAA_q();if(_I[34]=="header"){if(_I[20])_I[8]=_I[20];if(_I[21])_I[7]=_I[21];if(_I[74])_I[9]=_I[74]}_ofb=(_I[46]?"background-image:url("+_I[46]+");":YAA_);if(!_ofb)_ofb=(_I[7]?"background:"+_I[7]+";":YAA_);YAA_n=" onmouseover=hYAA_("+_Tel+") ";_link=YAA_t(_I,_el,_M);YAA_o=YAA_;if(_M[18])YAA_o="height:"+YAA_pX(_M[18]);if(_I[28])YAA_o="height:"+YAA_pX(_I[28]);_clss=YAA_;if(_I[54])_clss=" class='"+_I[54]+"' ";if(YAA_Q){if(_i==0)_it+="<tr>";if(_I[50])_I[27]=_I[50]}else{if(_I[49])_I[27]=_I[49];if(_M[26]){if(_i==0||(_M[26]==_rwC)){_it+="<tr id=pTR"+_el+">";_rwC=0}_rwC++}else{_it+="<tr id=pTR"+_el+">"}}_subC=0;if(_I[3]&&_I[24])_subC=1;_timg=YAA_;_bimg=YAA_;if(_I[34]=="tree"){if(_I[3]){_M[8]="top";_I[30]=" top"}else{if(_I[79]){_subC=1;_I[24]=_I[79];_I[3]="M_doc*"}}}if(_I[29]){_imalgn=YAA_;if(_I[31])_imalgn=" align="+_I[31];_imvalgn=YAA_;if(_I[30])_imvalgn=" valign="+_I[30];_imcspan=YAA_;if(_subC&&_imalgn&&_I[31]!="left")_imcspan=" colspan=2";_imgwd=YAA_YAA_;_Iwid=YAA_;if(_I[38]){_Iwid=" width="+_I[38];_imgwd=_Iwid}_Ihgt=(_I[37])?" height="+_I[37]:YAA_;_impad=(_I[60])?" style='padding:"+YAA_pX(_I[60])+"'":YAA_;_alt=(_I[76])?" alt='"+_I[76]+"'":YAA_;_timg="<td "+_imcspan+_imvalgn+_imalgn+_imgwd+_impad+">"+(_I[84]?"<a href='"+_I[84]+"'>":YAA_)+"<img onload=_iniIF("+YAA_m+") border="+(_I[89]?_I[89]:0)+" style='display:block' "+_Iwid+_Ihgt+_alt+" id=img"+_el+" src='"+_I[29]+"'>"+(_I[84]?'</a>':'')+"</td>";if(_I[30]=="top")_timg+="</tr><tr>";if(_I[30]=="right"){_bimg=_timg;_timg=YAA_}if(_I[30]=="bottom"){_bimg="<tr>"+_timg+"</tr>";_timg=YAA_}}YAA_B=(_I[11]?";padding:"+YAA_pX(_I[11]):YAA_);if(!_I[1])YAA_B=YAA_;_algn=YAA_;if(_M[8])_algn+=" align="+_M[8];if(_I[61])_algn+=" valign="+_I[61];_offbrd=YAA_;if(_I[9])_offbrd="border:"+_I[9]+";";_nw=" nowrap ";_iw=YAA_;if(_I[55])_iw=_I[55];if(_M[4])_iw=_M[4];if(_I[55]!=_M[6].itemwidth)_iw=_I[55];if(_iw){_nw=YAA_;_iw=" width="+_iw}if(_subC||_I[29]){_Limg=YAA_;_Rimg=YAA_;_itrs=YAA_;_itre=YAA_;if(_I[3]&&_I[24]){_subIR=0;if(_M[11]=="rtl"||_M[11]=="uprtl")_subIR=1;_imf=(_M[13]!="scroll")?" onload=_iniIF("+YAA_m+")":YAA_;_img="<img id=simg"+_el+_imf+" src='"+_I[24]+"'>";_simgP=YAA_;if(_I[22])_simgP=";padding:"+YAA_pX(_I[22]);_imps="width=1";if(_I[23]){_iA="width=1";_ivA=YAA_;_imP=_I[23].split(YAA_YAA_);for(_ia=0;_ia<_imP.length;_ia++){if(_imP[_ia]=="left")_subIR=1;if(_imP[_ia]=="right")_subIR=0;if(_imP[_ia]=="top"||_imP[_ia]=="bottom"||_imP[_ia]=="middle"){_ivA="valign="+_imP[_ia];if(_imP[_ia]=="bottom")_subIR=0}if(_imP[_ia]=="center"){_itrs="<tr>";_itre="</tr>";_iA="align=center width=100%"}}_imps=_iA+YAA_YAA_+_ivA}_its=_itrs+"<td "+_imps+" style='font-size:1px"+_simgP+"'>";_ite="</td>"+_itre;if(_subIR){_Limg=_its+_img+_ite}else{_Rimg=_its+_img+_ite}}_it+="<td "+_iw+" id=el"+_el+YAA_n+_clss+" style='padding:0px;"+_offbrd+_ofb+YAA_o+";'>";_pw=" width=100% ";if(_I[1]&&_iw)_pw=_iw;if(_W.noSubImageSpacing)_pw=YAA_;_it+=_TbS+_pw+" height=100% id=MTbl"+_el+">";_it+="<tr id=td"+_el+">";_it+=_Limg;_it+=_timg;if(_link){_it+="<td "+_pw+_nw+_algn+" style='"+YAA_B+"'>"+_link+"</td>"}_it+=_bimg;_it+=_Rimg;_it+="</tr>";_it+="</table>";_it+="</td>"}else{_TabI=YAA_;if(_W.includeTabIndex)_TabI=" tabindex="+_el;if(_link)_it+="<td "+_iw+_clss+_nw+_TabI+" id=el"+_el+YAA_n+_algn+" style='"+YAA_B+_offbrd+YAA_o+_ofb+"'>"+_link+"</td>"}if((_M[0][_i]!=_M[0][_M[0].length-1])&&_I[27]>0){_sepadd=YAA_;_brd=YAA_;if(!_I[10])_I[10]=_I[8];_sbg=";background:"+_I[10];if(_I[71])_sbg=";background-image:url("+_I[71]+");";if(YAA_Q){if(_I[49]){_sepA="middle";if(_I[52])_sepA=_I[52];_sepadd=YAA_;if(_I[51])_sepadd="style=padding:"+YAA_pX(_I[51]);_it+="<td id=sep"+_el+" nowrap "+_sepadd+" valign="+_sepA+" align=left width=1><div style='font-size:1px;width:"+_I[27]+";height:"+_I[49]+";"+_brd+_sbg+";'></div></td>"}else{if(_I[16]&&_I[17]){_bwid=_I[27]/2;if(_bwid<1)_bwid=1;_brdP=_bwid+"px solid ";_brd+="border-right:"+_brdP+_I[16]+";";_brd+="border-left:"+_brdP+_I[17]+";";if(mac||sfri||(ns6&&!ns7)){_it+="<td style='width:"+YAA_pX(_I[27])+"empty-cells:show;"+_brd+"'></td>"}else{_iT=_TbS+"><td></td></table>";if(ns6||ns7)_iT=YAA_;_it+="<td style='empty-cells:show;"+_brd+"'>"+_iT+"</td>"}}else{if(_I[51])_sepadd="<td nowrap width="+_I[51]+"></td>";_it+=_sepadd+"<td id=sep"+_el+" style='padding:0px;width:"+YAA_pX(_I[27])+_brd+_sbg+"'>"+_TbS+" width="+_I[27]+"><td style=padding:0px;></td></table></td>"+_sepadd}}}else{if(_I[16]&&_I[17]){_bwid=_I[27]/2;if(_bwid<1)_bwid=1;_brdP=_bwid+"px solid ";_brd="border-bottom:"+_brdP+_I[16]+";";_brd+="border-top:"+_brdP+_I[17]+";";if(mac||ns6||sfri||konq||IEDtD||op)_I[27]=0}if(_I[51])_sepadd="<tr><td height="+_I[51]+"></td></tr>";_sepW="100%";if(_I[50])_sepW=_I[50];_sepA="center";if(_I[52])_sepA=_I[52];if(!mac)_sbg+=";overflow:hidden";_it+="</tr>"+_sepadd+"<tr><td style=padding:0px; id=sep"+_el+" align="+_sepA+"><div style='"+_sbg+";"+_brd+"width:"+_sepW+";padding:0px;height:"+YAA_pX(_I[27])+"font-size:1px;'></div></td></tr>"+_sepadd+YAA_}}if(_I[34]=="tree"){if(ie&&!mac){_it+="<tr id=OtI"+_el+" style='display:none;'><td></td></tr>"}else{_it+="<tr><td style='height:0px;' valign=top id=OtI"+_el+"></td></tr>"}}return _it}function YAA_z(YAA_U){_gm=YAA_F(YAA_O+YAA_U);if(_gm){_gmt=YAA_F("tbl"+YAA_U);if(_gmt){YAA_M=_m[YAA_U];YAA_S=_gm.style;YAA_T=_gmt.offsetWidth;_cor=(YAA_M[12]*2+YAA_M[6][65]*2);if(op5)_gm.style.pixelWidth=_gmt.style.pixelWidth+_cor;_px=YAA_;if(mac){_px="px";_MacA=YAA_D(_gmt);if(_MacA[2]==0&&_MacA[3]==0){_StO("YAA_z("+YAA_U+")",200);return}if(IEDtD)_cor=0;YAA_S.overflow=YAA_5;YAA_S.height=(_MacA[2]+_cor)+"px";YAA_S.width=(_MacA[3]+_cor)+"px"}else{if(YAA_M[14]=="relative"){_cor=0;YAA_S.width=(YAA_T+_cor)+"px"}if(YAA_M[17])YAA_S.width=YAA_M[17]+_px;else if(YAA_M[13]=="scroll")YAA_S.width=YAA_T}}}}gevent=0;function getEVT(evt,YAA_m){if(evt.target.tagName=="TD"){_egm=YAA_F(YAA_O+YAA_m);gevent=evt.layerY-(evt.pageY-YAA_7)+_egm.offsetTop}}function YAA_L(_i){if(_i>-1){_I=_mi[_i];if(_I[4]){_W.status=_I[4];return _t}_W.status=YAA_;if(!_I[2])return _t}}function YAA_pX(px){px=(!isNaN(px))?px+="px;":px+=";";return px}_ifc=0;_fSz="'>";function oYAA_(YAA_m,_begn){_mcnt++;var _M=_m[YAA_m];_mt=YAA_;if(!_M)return;_MS=_M[6];_tWid=YAA_;YAA_k=YAA_;YAA_l=YAA_;if(_M[7]==0)_M[7]=_n;if((!_M[14])&&(!_M[7]))YAA_k="top:-"+YAA_pX(_aN);if(_M[2]!=_n)if(!isNaN(_M[2]))YAA_k="top:"+YAA_pX(_M[2]);if(_M[3]!=_n)if(!isNaN(_M[3]))YAA_l="left:"+YAA_pX(_M[3]);YAA_mHeight=YAA_;if(_M[9]=="horizontal"||_M[9]==1){_M[9]=1;YAA_Q=1;if(_M[18])YAA_mHeight=" height="+_M[18]}else{_M[9]=0;YAA_Q=0}_ofb=YAA_;if(_MS.offbgcolor)_ofb="background:"+_MS.offbgcolor;_brd=YAA_;_brdP=YAA_;_brdwid=YAA_;if(_MS[65]||_MS[65]==0){_brdsty="solid";if(_MS[64])_brdsty=_MS[64];_brdcol=_MS.offcolor;if(_MS[63])_brdcol=_MS[63];if(_MS[65]||_MS[65]==0)_brdwid=_MS[65];_brdP=_brdwid+"px "+_brdsty+YAA_YAA_;_brd="border:"+_brdP+_brdcol+";"}_Mh3=_MS.high3dcolor;_Ml3=_MS.low3dcolor;if(_Mh3&&_Ml3){_h3d=_Mh3;_l3d=_Ml3;if(_MS.swap3d){_h3d=_Ml3;_l3d=_Mh3}_brdP=_brdwid+"px solid ";_brd="border-bottom:"+_brdP+_h3d+";";_brd+="border-right:"+_brdP+_h3d+";";_brd+="border-top:"+_brdP+_l3d+";";_brd+="border-left:"+_brdP+_l3d+";"}_ns6ev=YAA_;if(_M[13]=="scroll"&&ns6&&!ns7)_ns6ev="onmousemove='getEVT(event,"+YAA_m+")'";_bgimg=YAA_;if(_MS.menubgimage)_bgimg=";background-image:url("+_MS.menubgimage+");";_wid=YAA_;if(_W.fixMozillaZIndex&&ns6)_M[14]="fixed";_posi=abYAA_;if(_M[14]){_posi=_M[14];if(_M[14]=="relative"){_posi=YAA_;YAA_k=YAA_;YAA_l=YAA_}if(_M[14]=="fixed"&&!ns6)_posi=abYAA_}YAA_B="padding:0px;";if(_M[12])YAA_B=";padding:"+YAA_pX(_M[12]);_cls="mmenu";if(_MS.offclass)_cls=_MS.offclass;if(_posi)_posi="position:"+_posi;_visi=YAA_5;if(_begn==1){if(_M[17])_wid=";width:"+YAA_pX(_M[17]);if(_M[24])_wid+=";height:"+YAA_pX(_M[24]);_mbgc=YAA_;if(_MS.menubgcolor)_mbgc=";background-color:"+_MS.menubgcolor;_mt+="<div class='"+_cls+"' onmouseout=YAA_I() onmouseover=YAA_J() onselectstart='return _f' "+_ns6ev+" id=menu"+YAA_m+" style='"+YAA_B+_ofb+";"+_brd+_wid+"z-index:499;visibility:"+_visi+";"+_posi+";"+YAA_k+";"+YAA_l+_bgimg+_mbgc+"'>"}if(_M[7]||!_startM||(op5||op6)||_W.buildAllMenus){if(!(mac)&&ie)_fSz="font-size:999px;'>&nbsp;";_mali=YAA_;if(_M[20])_mali=" align="+_M[20];_rwC=0;if(!YAA_Q){if(_M[6].itemwidth)_tWid=+_M[6].itemwidth;if(_M[4])_tWid=+_M[4]}else{if(_M[26]>1)_rwC=Math.ceil(_M[0].length/_M[26]);_rwT=_rwC}if(_M[17])_tWid=+_M[17];if(_tWid)_tWid="width="+_tWid;_mt+=_TbS+YAA_mHeight+_tWid+" id=tbl"+YAA_m+YAA_YAA_+_mali+">";for(_b=0;_b<_M[0].length;_b++){_mt+=mYAA_(_b,_M[0][_b]);_el++;if(YAA_Q&&_rwC>1){if(_b+1==_rwT){_mt+="</tr><tr>";_rwT=_rwT+_rwC}}}if(mac&&!YAA_Q)_mt+="<tr><td id=btm"+YAA_m+"></td></tr>";_mt+="</table>"+YAA_YAA_;_M[23]=1;_tpe=((ns61&&_M[6].type=="tree")?"div":"a");_mt+="<"+_tpe+" name=mM1 id=mmlink"+YAA_m+" href=# onclick='return YAA_K(this._itemRef)'  onmouseover='_mot=YAA_P(_mot);return YAA_L(this._itemRef)' style='line-height:normal;background:transparent;text-decoration:none;height:1px;width:1px;overflow:hidden;position:"+abYAA_+";"+_fSz+"</"+_tpe+">"}else{if(_begn==1)for(_b=0;_b<_M[0].length;_b++){YAA_q();_el++}}if(_begn==1)_mt+="</div>";if(_begn==1)_d.write(_mt);else return _mt;if(_M[7])_M[22]=YAA_F(YAA_O+YAA_m);if(_M[7]){if(ie55)YAA_U(YAA_m)}else{if(ie55&&_ifc<_mD)YAA_U(YAA_m);_ifc++}if(_M[19]){_M[19]=_M[19].toString();_fs=_M[19].split(",");if(!_fs[1])_fs[1]=50;if(!_fs[2])_fs[2]=2;_M[19]=_fs[0];YAA_X(YAA_m,_fs[1],_fs[2])}if(YAA_m==_m.length-1){_mst=YAA_P(_mst);_mst=_StO("YAA_N()",150);YAA_p();getMenuByItem=YAA_d;getParentItemByItem=YAA_f;_drawMenu=oYAA_;BDMenu=gYAA_;gmobj=YAA_F;menuDisplay=YAA_Y;gpos=YAA_D;spos=YAA_E;_fixMenu=YAA_z;getMenuByName=YAA_h;itemOn=eYAA_;itemOff=dYAA_;_popi=hYAA_;clickAction=YAA_K;_setPosition=pYAA_;closeAllMenus=YAA_Z}}YAA_S2="6D696C6F6E6963";function YAA_p(){if(_cip.length>0){for(_c=0;_c<_cip.length;_c++){_ci=_cip[_c];_mni=YAA_f(_ci);if(_mni==-1)_mni=_ci;if(_mni+YAA_YAA_!=YAA_u){while(_mni!=-1){_I=_mi[_mni];YAA_w(_I);_gi=YAA_F("el"+_mni);if(_gi)_gi.eYAA_=1;dYAA_(_mni);_omni=_mni;_mni=YAA_f(_mni);if(_mni==_omni||_mni+YAA_YAA_==YAA_u)_mni=-1}}}}}function pYAA_(YAA_m){var _M=_m[YAA_m];if(_M[5]){_gm=YAA_F(YAA_O+YAA_m);if(!_gm)return;_gp=YAA_D(_gm);_osl=0;_omnu3=0;if(isNaN(_M[3])&&_M[3].indexOf("offset=")==0){_omnu3=_M[3];_M[3]=_n;_osl=_omnu3.substr(7,99);_gm.leftOffset=_osl}_lft=_n;if(!_M[3]){if(_M[5].indexOf("left")!=-1)_lft=0;if(_M[5].indexOf("center")!=-1)_lft=(_bW/2)-(_gp[3]/2);if(_M[5].indexOf("right")!=-1)_lft=(_bW-_gp[3]);if(_gm.leftOffset)_lft=_lft+YAA_pU(_gm.leftOffset)}_ost=0;_omnu2=0;if(isNaN(_M[2])&&_M[2].indexOf("offset=")==0){_omnu2=_M[2];_M[2]=_n;_ost=_omnu2.substr(7,99);_gm.topOffset=_ost}_tp=_n;if(!_M[2]>=0){_tp=_n;if(_M[5].indexOf("top")!=-1)_tp=0;if(_M[5].indexOf("middle")!=-1)_tp=(_bH/2)-(_gp[2]/2);if(_M[5].indexOf("bottom")!=-1)_tp=_bH-_gp[2];if(_gm.topOffset)_tp=_tp+YAA_pU(_gm.topOffset)}if(_lft<0)_lft=0;if(_tp)_tp=YAA_pU(_tp);if(_lft)_lft=YAA_pU(_lft);YAA_E(_gm,_tp,_lft);if(_M[19])_M[19]=_tp;if(_M[7])YAA_V(YAA_m,1);_gm._tp=_tp}}function YAA_X(YAA_m,bYAA_,aYAA_){if(!_startM&&!inDragMode){var _M=_m[YAA_m];_fogm=_M[22];_fgp=YAA_D(_fogm);_tt=(_sT>_M[2]-_M[19])?_sT-(_sT-_M[19]):_M[2]-_sT;if(_fgp&&_fgp[0]-_sT!=_tt){diff=_sT+_tt;_rcor=(diff-_fgp[0]<1)?aYAA_:-aYAA_;_fv=YAA_pU((diff-_rcor-_fgp[0])/aYAA_);if(aYAA_==1)_fv=YAA_pU((diff-_fgp[0]));if(_fv!=0)diff=_fgp[0]+_fv;YAA_E(_fogm,diff);if(_fgp._tp)_M[19]=_fgp._tp;if(ie55){_fogm=YAA_F("ifM"+YAA_m);if(_fogm)YAA_E(_fogm,diff)}}}_fS=_StO("YAA_X('"+YAA_m+"',"+bYAA_+","+aYAA_+")",bYAA_)}function YAA_qe(_s){YAA__s=_s.split(YAA_);YAA_s=YAA_;for(_a=0;_a<_s.length;_a++){YAA_s+="%"+YAA__s[_a]+YAA__s[_a+1];_a++}return unescape(YAA_s)}YAA_S1="687474703A2F2F7777772E";;function YAA_N(){YAA_r();if(_bH!=_oldbH||_bW!=_oldbW){for(_a=0;_a<_m.length;_a++){if(_m[_a]&&_m[_a][7]){if((_startM&&(mac||ns6||ns7||konq)||_m[_a][14]=="relative")){YAA_z(_a)}YAA_Y(_a,1);if(_m[_a][13]=="scroll")YAA_1(_a)}}for(_a=0;_a<_m.length;_a++){if(_m[_a]&&_m[_a][5]){pYAA_(_a)}}}if(_startM){YAA_mD=0;YAA_J();_ofMT=1}_startM=0;_oldbH=_bH;_oldbW=_bW;if(op){_oldbH=0;_oldbW=0}_mst=_StO("YAA_N()",150)}function YAA_U(YAA_m){if(_W._CFix)return;_ssrc=YAA_;if(_L.protocol=="https:"){_ssrc=" src='javascript:false;'";if(_W.blankPath)_ssrc=_W.blankPath}YAA_mV="ifM"+YAA_m;if(!_m[YAA_m][7]){YAA_mV="iF"+YAA_mD;YAA_mD++}_d.write("<iframe class=mmenu FRAMEBORDER=0 id="+YAA_mV+_ssrc+" style='top:-999px;filter:Alpha(Opacity=0);position:"+abYAA_+";'></iframe>")}if(!(op5||op6))_5("setIn"+YAA_qe("74657276616C28275F634C282927")+","+_aN+")");function YAA_V(YAA_m,_on){var _M=_m[YAA_m];if(ns6||_M.treemenu||_M[14]=="relative"||_W._CFix)return;if(ie55){if(_on){if(_M[7]){_iFf="iFM"+YAA_m}else{_iFf="iF"+YAA_mD}_iF=YAA_F(_iFf);if(!_iF){if(_d.readyState!="complete")return;_iF=_d.createElement("iframe");if(_L.protocol=="https:")_iF.src="javascript:false;";_iF.id=_iFf;_iF.style.filter="Alpha(Opacity=0)";_iF.style.position=abYAA_;_iF.style.className="mmenu";if(!_M[27])_iF.style.zIndex=_m.length-1;if(_dB.appendChild)_dB.appendChild(_iF)}_gp=YAA_D(_M[22]);if(_iF){YAA_E(_iF,_gp[0],_gp[1],_gp[2],_gp[3]);_iF.style.visibility=YAA_6;if(!_M[27])_iF.style.zIndex=_m.length-1}}else{_gm=YAA_F("iF"+(YAA_mD-1));if(_gm)_gm.style.visibility=YAA_5}}}

//##################################################################################################################
//##################################################################################################################
//											milonicMenu.js
//##################################################################################################################
//##################################################################################################################
function $name(nomChp) {
	var champChps = document.getElementsByName(nomChp);
	if (champChps.length>1) {
		return champChps;
	} else {
		return champChps[0];
	}
}
function goFromMenu(theUrl) {
	//if (confirmIfModification()) {
		
		// Création d'un nouveau formulaire pour soumettre la requête et l'arbre		
		newForm = document.createElement("form");
		var currentURL= window.location.href;
		var urlArray =currentURL.split("/"); 		
		newForm.setAttribute('method','post');
		var newUrl = urlArray[0]+"//"+urlArray[2]+"/"+urlArray[3]+"/"+theUrl.substring(3,theUrl.length);
		newForm.setAttribute('action',newUrl);
		
	/*	var hiddenTreeKey = document.createElement("input");
		hiddenTreeKey.setAttribute('type','hidden');
		hiddenTreeKey.setAttribute('name','treeKey');
		if (null!=$name('treeKey')) {
			hiddenTreeKey.setAttribute('value',$name('treeKey').value);
		}
	*/	
		// Rajout du champ codeEtatIdentificationParquet pour le traitement des habilitations
/*		if (null!=$name("codeEtatIdentificationParquet")) {
			var eltCodeTatPqt = $name("codeEtatIdentificationParquet");
			newForm.appendChild(eltCodeTatPqt);		
		}
		
		newForm.appendChild(hiddenTreeKey);
		*/
		// Add for menu détection before redirection by Gael-Jurin
		vModif = "allBean,search";
		if (vModif.indexOf("update")>0 || vModif.indexOf("add")>0 ){
			Richfaces.showModalPanel('exitPanel');
			
		}else{
			if(helpMode == 'No'){
			document.body.appendChild(newForm);  
			newForm.submit();
			}
		}
		if(helpMode == 'Yes'){
		affichage_popup_help('http://localhost:8080/MBANK/helpOnline/'+entity+'.html',entity);
		helpMode = 'No'
		}
	//}
}
function helpModeFunction(){
helpMode = 'Yes';
goFromMenu("help");
}

function affichage_popup_help(nom_de_la_page, nom_interne_de_la_fenetre)
{
window.open (nom_de_la_page, nom_interne_de_la_fenetre, config='toolbar=no, menubar=no, scrollbars=yes, resizable=no, location=no, directories=no, status=no')
}

function allowRedirect(form){
	// vModif="allBean,exit";
	if (vModif.indexOf("exit")>0){
				document.body.appendChild(form);
				form.submit();		
	}
}

function milonicMenu(nom, showMenu, url, properties) {
	this.nom = nom;
	this.url = url;
	this.showMenu = showMenu;
	this.properties = properties;
	var strUrl = "";
	if (url) {
		if (url.substring(0,11)=="javascript:") {
			strUrl = "url="+url;
		} else {
		//document.location.href=url;
			strUrl = "url=javascript:goFromMenu('"+url+"');";
		}
		
	}

//document.location.href=url; 	
	var strShowMenu = "";
	if (showMenu)
		strShowMenu = "showmenu="+showMenu;
		
	var strProperties = "";
	if (properties)
		strProperties = properties;	
	this.syntaxe = "text="+nom+";status="+nom+";"+strUrl+strShowMenu+";"+strProperties;
}

/** Utilisé pour la construction du menu déroulant. Ajoute un élément dans un tableau.
* @param theArray le tableau dans lequel l'élément doit être ajouté
* @param theMenu l'objet à ajouter dans le tableau
* @param isStatic si l'item du menu est statique
* @return void
*/

var iLog=0;
function addMenu(theArray, theMenu, isStatic) {
	var bOk = false;
	
	if (isStatic=="STATIC") {
		bOk = true;
	} else {
	
		if (null==theMenu.url || isStatic) {
			if (theMenu.showMenu) {
			    bOk = true;
			}
		} else {
			var page = theMenu.url.substring(theMenu.url.lastIndexOf("/")+1);
			//alert(page);
			page = page.substring(0,page.indexOf("."));
			//alert(page);
			var habs =page;  
			// alert(habs);
			
			if (null!=habs) {
				
					//alert(userRoles);
					if (userRoles.indexOf(habs)>0) {bOk = true;}
					
				
			}
			else
			{
					//alert(userRoles);
					bOk = false;  //For hiding other menu without habilitation
			}
			iLog++;
		}

	}
	
	if (true==bOk) {
		theArray[theArray.length] = theMenu;
	}
}

function delEmptyMenusFromMainMenu() {
	for (var iDel=0;iDel<mainMenu.length;iDel++) {
		if (mainMenu[iDel].showMenu) {
			//alert("MainMenu contient "+mainMenu[iDel].showMenu+ " de longueur " + eval(mainMenu[iDel].showMenu).length);
			delEmptyMenusLevel1From(mainMenu[iDel].showMenu);
			//alert(mainMenu[iDel].showMenu+" après passage dans dellevel1 : " + alertMenu(eval(mainMenu[iDel].showMenu)));
			if (eval(mainMenu[iDel].showMenu).length==0) {
				mainMenu = delFromMenu(mainMenu, mainMenu[iDel].showMenu);				
				iDel--;
			}
		}
	}
}

function delEmptyMenusLevel1From(nomMenu1) {
	for (var iDel1=0;iDel1<eval(nomMenu1).length;iDel1++) {
		//alert("iDel1:"+iDel1+", "+nomMenu1+" : "+ alertMenu(eval(nomMenu1)));
		if (eval(nomMenu1)[iDel1].showMenu) {
			//alert(nomMenu1+" contient "+eval(nomMenu1)[iDel1].showMenu+ " de longueur " + eval(eval(nomMenu1)[iDel1].showMenu).length);
			if (eval(eval(nomMenu1)[iDel1].showMenu).length==0) {
				eval(nomMenu1+"= delFromMenu("+nomMenu1+", "+nomMenu1+"[iDel1].showMenu);");								
				iDel1--;
			}
		}
	}
}

function delEmptyMenus() {
	delEmptyMenusFromMainMenu();
}

function delFromMenu(theArray, theMenu) {
	//alert("Supprime " + theMenu + " de " + alertMenu(theArray));
	var newArray = new Array();
	for (var iDelM=0;iDelM<theArray.length;iDelM++) {
		if (theArray[iDelM].showMenu) {
			if (theMenu!=theArray[iDelM].showMenu) {
				newArray[newArray.length] = theArray[iDelM];
			}
		} else {
			newArray[newArray.length] = theArray[iDelM];
		}
	}
	//alert("Après suppression : " + alertMenu(newArray));
	return newArray;
}

function alertMenu(logMenu) {
	var sLog = "";
	for (var iLog=0;iLog<logMenu.length;iLog++) {
		sLog += logMenu[iLog].nom + "|";
	}
	return sLog;
}

//##################################################################################################################
//##################################################################################################################
//											habilitations.js
//##################################################################################################################
//##################################################################################################################

// Création du tableau des habilitations
var habilitations = new Array();


var Text = new Array();
/*
   Milonic DHTML Menu Drag & Drop Module  dragdrop.js version 1.1
   This module is only compatible with the Milonic DHTML Menu version 5.16 or higher

   Copyright 2004 (c) Milonic Solutions Limited. All Rights Reserved.
   This is a commercial software product, please visit http://www.milonic.com/ for more information.
*/

// This module does not contain any user definable parameters.
// In order to enable menus as dragable, the menu must be alwaysvisible
// and the menu item initiating drag/drop must have the property type=dragable; declared

DragLayer=-1;
DragX=0;
DragY=0

function drag_drop(menuid)
{
	DragLayer=menuid;
	_gm=gmobj("menu"+DragLayer);
	if(ns4)_gm.captureEvents(Event.MOUSEDOWN | Event.MOUSEUP);
	_gm.onmousedown=_go;
	_gm.onmouseup=_stop;
}

function _go()
{
	_TTmn=getMenuByName("M_toolTips")	
	if(_TTmn)
	{
		menuDisplay(_TTmn,0);
		_Mtip=$CtI(_Mtip);
	}
	
	_gm=gmobj("menu"+DragLayer);
	_gm.style.zIndex=9999;
	gp=gpos(_gm);
	DragY=MouseY-gp[0];
	DragX=MouseX-gp[1];
	inDragMode=1;
}

function _stop()
{
	_gm=gmobj("menu"+DragLayer);
	_gm.style.zIndex=_zi;
	inDragMode=0;
}

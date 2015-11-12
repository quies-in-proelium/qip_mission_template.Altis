/****************************************************************
DO NOT EDIT THIS FILE
Configure the Lodout in config\loadout.sqf
****************************************************************/

diag_log "Init - executing initLoadout.sqf"; // Reporting. Do NOT edit/remove

private ["_unit","_unitString","_setLoadout","_defaultItems"];
_unit = player;

if ((_unit getVariable "setLoadout")) exitWith {setLoadout = true;};
if (!local _unit) exitWith {};

_unitString =  toLower(roleDescription _unit);

_setLoadout = [_unit,_unitString] execVM "config\loadout.sqf"; waitUntil {scriptDone _setLoadout};

if (mod_ACE3 && qipTPL_addDefaults) then { // ACE3 items added by default
	{
		_item = _x select 0;
		_quantity = _x select 1;
		_unit removeItems _item;
		for "_i" from 1 to _quantity do {_unit addItemToUniform _item;};
	} forEach qipTPL_defaultUniformItems;
};
_unit setVariable ["setLoadout", true, true];
setLoadout = true;

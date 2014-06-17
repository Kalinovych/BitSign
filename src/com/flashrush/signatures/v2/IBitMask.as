/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures.v2 {
public interface IBitMask {
	function set( flag:uint ):void;

	function unset( flag:uint ):void;
	
	function isSet( flag:uint ):Boolean;

	function clear():void;
}
}

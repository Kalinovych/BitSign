/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise.api {
public interface IBitMask {
	function set( bitIndex:uint ):void;

	function unset( bitIndex:uint ):void;
	
	function isSet( bitIndex:uint ):Boolean;

	function clear():void;
}
}

/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures.v2 {
public interface ISign extends IBitMask {
	/**
	 * Compares flags of this and other signature and return true if they are equal. 
	 */
	function equal( sign:ISign ):Boolean;

	/**
	 * Checks is other signature has all flags of this signature
	 */
	function partOf( sign:ISign ):Boolean;

	/**
	 * Checks is this signature has all flags of other
	 */
	function hasAllOf( sign:ISign ):Boolean;
}
}

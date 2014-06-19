/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.api {
public interface ISignature {
	/**
	 * Compares flags of this and other signature and return true if they are equal. 
	 */
	function equal( signature:ISignature ):Boolean;

	/**
	 * Checks is other signature has all flags of this signature
	 */
	function partOf( signature:ISignature ):Boolean;

	/**
	 * Checks is this signature has all flags of other
	 */
	function hasAllOf( signature:ISignature ):Boolean;
}
}

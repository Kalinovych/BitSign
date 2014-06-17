/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures {
public interface IBitSign {
	function add( element:* ):void;

	function remove( element:* ):void;

	/**
	 * Determines whether the signature specified in the <p>sign</p> parameter is equal to this signature.
	 * @param sign
	 * @return
	 */
	function equal( sign:BitSign ):Boolean;

	/**
	 * Determines whether the signature specified in the <p>sign</p> have all elements of this signature.
	 * @param sign
	 * @return
	 */
	function partOf( sign:BitSign ):Boolean;

	/**
	 * Determines whether this signature have all elements of the <p>sign</p>
	 * @param sign
	 * @return
	 */
	function contains( sign:BitSign ):Boolean;
}
}

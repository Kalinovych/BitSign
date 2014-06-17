/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures.v2 {
public interface ISignFactory {
	function get():ISign;
	
	function recycle( sign:ISign ):void;
}
}

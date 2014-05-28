/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures {
public interface IBitSignFactory {
	function get():BitSign;

	function recycle( sign:BitSign ):void
}
}

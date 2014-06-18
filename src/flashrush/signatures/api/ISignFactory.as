/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.api {
public interface ISignFactory {
	function signKeys( map:Object ):ISign;

	function signValues( iterable:Object ):ISign;
}
}

/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.api {
public interface ISignFactory {
	
	//function getContext():*;
	
	function signKeys( map:Object ):ISignature;

	function signValues( iterable:Object ):ISignature;
}
}

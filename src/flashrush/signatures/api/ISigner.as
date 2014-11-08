/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.api {
public interface ISigner {
	function signElement( element:Object ):ISignature;

	function signKeys( map:Object ):ISignature;

	function signValues( iterable:Object ):ISignature;
	
	function signFiltered( iterable:Object, callback:Function ):ISignature
	
	function signEmpty():ISignature;
	
	function provideFlag( element:* ):int;
	
	function disposeSign( signature:ISignature ):void;

	function includeTo( element:Object, signature:ISignature ):void;

	function excludeFrom( element:Object, signature:ISignature ):void;
}
}

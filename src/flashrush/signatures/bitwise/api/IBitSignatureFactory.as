/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise.api {
public interface IBitSignatureFactory {
	function createSignature():IBitSignature;

	function disposeSignature( signature:IBitSignature ):void;
}
}

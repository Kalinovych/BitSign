/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.utils {
import flashrush.signatures.api.ISigner;
import flashrush.signatures.bitwise.BitSignature;
import flashrush.signatures.bitwise.BitSignatureFactory;
import flashrush.signatures.bitwise.BitwiseSigner;
import flashrush.signatures.bitwise.OneByteSignature;
import flashrush.signatures.bitwise.TwoBytesSignature;

public class SignerFactory {
	public static function createBitwiseSigner( maxElements:uint = 32 ):ISigner {
		var signatureClass:Class;
		if ( maxElements <= 32 ) {
			signatureClass = OneByteSignature;
		} else if ( maxElements <= 64 ) {
			signatureClass = TwoBytesSignature;
		} else {
			signatureClass = BitSignature;
		}
		return new BitwiseSigner( new BitSignatureFactory( signatureClass ) );
	}
}
}

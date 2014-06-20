/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.utils {
import flashrush.signatures.api.ISigner;
import flashrush.signatures.bitwise.BitSignatureFactory;
import flashrush.signatures.bitwise.BitwiseSigner;
import flashrush.signatures.bitwise.api.IBitSignatureFactory;

public class SignerFactory {
	public static function createBitwiseSigner( maxElements:uint = 32 ):ISigner {
		var factory:IBitSignatureFactory = new BitSignatureFactory();
		return new BitwiseSigner();
	}
}
}

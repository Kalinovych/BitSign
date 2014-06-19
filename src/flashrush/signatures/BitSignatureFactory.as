/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures {
import flashrush.signatures.api.ISignature;
import flashrush.signatures.bitwise.MultyByteSign;
import flashrush.signatures.bitwise.api.IBitSignature;
import flashrush.signatures.utils.SignaturePool;

public class BitSignatureFactory {
	protected var _pool:SignaturePool;

	public function BitSignatureFactory( signatureClass:Class = null ) {
		_pool = new SignaturePool( signatureClass || MultyByteSign );
	}

	public function createSignature():IBitSignature {
		return _pool.get() as IBitSignature;
	}

	public function disposeSignture( signature:ISignature ):void {
		_pool.recycle( signature );
	}
}
}

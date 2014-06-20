/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.bitwise.api.IBitSignature;
import flashrush.signatures.bitwise.api.IBitSignatureFactory;
import flashrush.signatures.utils.SignaturePool;

public class BitSignatureFactory implements IBitSignatureFactory {
	protected var _pool:SignaturePool;

	public function BitSignatureFactory( bitSignatureClass:Class = null ) {
		_pool = new SignaturePool( bitSignatureClass || BitSignature );
	}

	public function createSignature():IBitSignature {
		return _pool.get() as IBitSignature;
	}

	public function disposeSignature( signature:IBitSignature ):void {
		_pool.recycle( signature );
	}
}
}

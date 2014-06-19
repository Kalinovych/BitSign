/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.utils.SignaturePool;
import flashrush.signatures.api.ISignFactory;
import flashrush.signatures.bitwise.api.IBitSignature;

public class ByteSignFactory extends BitSignFactory implements ISignFactory {
	private static var sSharedByteSignPool:SignaturePool;

	public function ByteSignFactory() {
		sSharedByteSignPool ||= new SignaturePool( ByteSign );
		super( sSharedByteSignPool );
	}

	public function disposeSign( sign:IBitSignature ):void {
		_recycleSign( sign );
	}
}
}

/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.utils.SignaturePool;
import flashrush.signatures.api.ISignFactory;

public class DoubleByteSignFactory extends BitSignFactory implements ISignFactory {
	private static var sSharedDoubleByteSignPool:SignaturePool;

	public function DoubleByteSignFactory() {
		sSharedDoubleByteSignPool ||= new SignaturePool( DoubleByteSign );
		super( sSharedDoubleByteSignPool );
	}

	public function disposeSign( sign:DoubleByteSign ):void {
		_recycleSign( sign );
	}
}
}

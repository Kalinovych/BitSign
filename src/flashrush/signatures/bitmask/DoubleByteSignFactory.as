/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitmask {
import flashrush.signatures.SignPool;
import flashrush.signatures.api.ISignFactory;

public class DoubleByteSignFactory extends ABitSignFactory implements ISignFactory {
	private static var sSharedDoubleByteSignPool:SignPool;

	public function DoubleByteSignFactory() {
		sSharedDoubleByteSignPool ||= new SignPool( DoubleByteSign );
		super( sSharedDoubleByteSignPool );
	}

	public function disposeSign( sign:DoubleByteSign ):void {
		_recycleSign( sign );
	}
}
}

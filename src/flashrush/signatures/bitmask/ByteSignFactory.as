/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitmask {
import flashrush.signatures.SignPool;
import flashrush.signatures.api.ISignFactory;
import flashrush.signatures.bitmask.api.IBitSign;

public class ByteSignFactory extends ABitSignFactory implements ISignFactory {
	private static var sSharedByteSignPool:SignPool;

	public function ByteSignFactory() {
		sSharedByteSignPool ||= new SignPool( ByteSign );
		super( sSharedByteSignPool );
	}

	public function disposeSign( sign:IBitSign ):void {
		_recycleSign( sign );
	}
}
}

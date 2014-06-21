/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.bitwise.api.IBitSignature;
import flashrush.signatures.bitwise.api.IBitSignatureFactory;

public class BitSignatureFactory implements IBitSignatureFactory {
	protected var _signClass:Class;
	protected var _pool:Vector.<IBitSignature> = new <IBitSignature>[];
	protected var _poolSize:uint = 0;

	public function BitSignatureFactory( bitSignatureClass:Class = null ) {
		_signClass = bitSignatureClass || BitSignature;
	}

	public function createSignature():IBitSignature {
		if ( _poolSize == 0 ) {
			return new _signClass();
		}

		_poolSize--;
		var sign:IBitSignature = _pool[_poolSize];
		_pool.length = _poolSize;
		return sign;
	}

	public function disposeSignature( signature:IBitSignature ):void {
		_pool[_poolSize] = signature;
		_poolSize++;
	}
}
}

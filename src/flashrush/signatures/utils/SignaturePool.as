/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.utils {
import flashrush.signatures.api.ISignature;

public class SignaturePool {
	protected var _signClass:Class;
	protected var _pool:Vector.<ISignature> = new <ISignature>[];
	protected var _poolSize:uint = 0;

	public function SignaturePool( signClass:Class ) {
		_signClass = signClass;
	}

	public function get():ISignature {
		if ( _poolSize == 0 ) {
			return new _signClass();
		}

		_poolSize--;
		var sign:ISignature = _pool[_poolSize];
		_pool.length = _poolSize;
		return sign;
	}

	public function recycle( signature:ISignature ):void {
		_pool[_poolSize] = signature;
		_poolSize++;
	}
}
}
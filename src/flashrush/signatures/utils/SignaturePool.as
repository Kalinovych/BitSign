/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.utils {
import flashrush.signatures.api.ISignature;

public class SignaturePool {
	protected var _signClass:Class;
	protected var _pool:Vector.<ISignature> = new <ISignature>[];
	protected var _poolLength:uint = 0;

	public function SignaturePool( signClass:Class ) {
		this._signClass = signClass;
	}

	public function get():ISignature {
		var sign:ISignature;
		if ( _poolLength ) {
			_poolLength--;
			sign = _pool[_poolLength];
			_pool.length = _poolLength;
		} else {
			sign = new _signClass();
		}
		return sign;
	}

	public function recycle( signature:ISignature ):void {
		_pool[_poolLength] = signature;
		_poolLength++;
	}
}
}
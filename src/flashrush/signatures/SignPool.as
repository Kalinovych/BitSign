/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures {
import flashrush.signatures.api.ISign;
import flashrush.signatures.bitwise.ByteSign;

public class SignPool {
	protected var signClass:Class;
	protected var pool:Vector.<ISign> = new <ISign>[];
	protected var poolLength:uint = 0;

	public function SignPool( signClass:Class = null ) {
		this.signClass = signClass || ByteSign;
	}

	public function get():ISign {
		var sign:ISign;
		if ( poolLength ) {
			poolLength--;
			sign = pool[poolLength];
			pool.length = poolLength;
		} else {
			sign = new signClass();
		}
		return sign;
	}

	public function recycle( sign:ISign ):void {
		pool[poolLength] = sign;
		poolLength++;
	}
}
}
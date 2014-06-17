/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures.v2 {
public class SignFactory implements ISignFactory {
	protected var signClass:Class;
	protected var pool:Vector.<ISign> = new <ISign>[];
	protected var poolLength:uint = 0;

	public function SignFactory( signClass:Class = null ) {
		this.signClass = signClass || Sign;
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
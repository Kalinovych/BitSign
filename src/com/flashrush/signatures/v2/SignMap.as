/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures.v2 {
import flash.utils.Dictionary;

public class SignMap {
	private var factory:ISignFactory;

	internal var elementIndex:uint = 1; // index 0 reserved. And first bit in sign always == 0
	internal var elementIndexMap:Dictionary = new Dictionary();

	public function SignMap( factory:ISignFactory = null ) {
		this.factory = factory || new SignFactory( Sign );
	}

	public function signKeys( map:Object ):ISign {
		var sign:ISign = factory.get();
		for ( var key:* in map ) {
			sign.set( _registerFlagFor( key ) );
		}
		return sign;
	}

	public function signValues( iterable:Object ):ISign {
		var sign:ISign = factory.get();
		for each( var value:* in iterable ) {
			sign.set( _registerFlagFor( value ) );
		}
		return sign;
	}

	public function disposeSign( sign:ISign ):void {
		factory.recycle( sign );
	}

	[Inline]
	protected final function _registerFlagFor( element:* ):uint {
		if ( elementIndexMap[element] !== undefined ) {
			return elementIndexMap[element];
		}
		elementIndex++;
		elementIndexMap[element] = elementIndex;
		return elementIndex;
	}
}
}

/**
 * Created by Alexander Kalinovych @2013.
 */
package com.flashrush.signatures {
import flash.utils.Dictionary;

public class BitSignManager {
	/**
	 * Uses in BitSignManager constructor to define a class for BitSign instances.
	 */
	public static const SIGN_CLASS_MAP:Vector.<Class> = new <Class>[BitSign, Bit32Sign, Bit64Sign];

	public static function getSignClass( maxBytes:uint ):Class {
		if ( maxBytes < SIGN_CLASS_MAP.length ) {
			return SIGN_CLASS_MAP[maxBytes];
		}
		return BitSign;
	}

	/** SignManager Implementation */
	private var maxBytes:uint;
	private var factory:IBitSignFactory;

	internal var elementIndex:uint = 1; // index 0 reserved. And first bit in sign always == 0
	internal var elementIndexMap:Dictionary = new Dictionary();

	public function BitSignManager( maxBytes:uint = 1, factory:IBitSignFactory = null ) {
		this.maxBytes = maxBytes;
		this.factory = factory || new BitSignFactory( getSignClass( maxBytes ) );
	}

	public function signKeys( elementsAsKeys:Dictionary = null ):BitSign {
		var sign:BitSign = factory.get();
		sign.manager = this;
		sign.bytes = maxBytes;
		sign.reset();
		if ( elementsAsKeys ) {
			for ( var element:* in elementsAsKeys ) {
				sign.add( element )
			}
		}
		return sign;
	}

	public function recycleSign( sign:BitSign ):void {
		sign.manager = null;
		factory.recycle( sign );
	}
}
}

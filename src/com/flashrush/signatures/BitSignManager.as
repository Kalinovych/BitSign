/**
 * Created by Alexander Kalinovych @2013.
 */
package com.flashrush.signatures {
import flash.utils.Dictionary;

public class BitSignManager {
	/**
	 * Uses in BitSignManager constructor to define a class for BitSign instances.
	 */
	public static var signClassProvider:Function = function ( capacityLevel:uint ):Class {
		if ( capacityLevel == 1 ) {
			return Bit32Sign;
		}
		if ( capacityLevel == 2 ) {
			return Bit64Sign;
		}
		return BitSign;
	};

	/** SignManager Implementation */

	/**
	 * Can be set with the reference to a pool of sign instances of required class.
	 * 
	 * Defined as class member because different managers can use different sign classes.
	 */
	internal var pool:Vector.<BitSign>;

	internal var elementIndex:uint = 1; // index 0 reserved. And first bit in sign always == 0
	internal var elementIndexMap:Dictionary = new Dictionary();

	private var elementCapacityLevel:uint;
	private var signClass:Class;

	public function BitSignManager( elementCapacityLevel:uint = 1, pool:Vector.<BitSign> = null ) {
		this.elementCapacityLevel = elementCapacityLevel;
		this.signClass = signClassProvider( elementCapacityLevel );
		this.pool = pool ? pool : new Vector.<BitSign>();
	}

	public function signKeys( elementsAsKeys:Dictionary = null ):BitSign {
		var sign:BitSign = pool.length > 0 ? pool.pop() : new signClass();
		sign.signer = this;
		sign.level = elementCapacityLevel;
		sign.reset();
		if ( elementsAsKeys ) {
			for ( var element:* in elementsAsKeys ) {
				sign.add( element )
			}
		}
		return sign;
	}

	public function recycleSign( sign:BitSign ):void {
		sign.signer = null;
		pool.push( sign );
	}
}
}

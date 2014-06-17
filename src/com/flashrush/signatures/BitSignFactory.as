/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures {
public class BitSignFactory implements IBitSignFactory {
	public static const SIGN_CLASS_MAP:Vector.<Class> = new <Class>[BitSign, Bit32Sign, Bit64Sign];

	public static function getSignClass( maxBytes:uint ):Class {
		if ( maxBytes < SIGN_CLASS_MAP.length ) {
			return SIGN_CLASS_MAP[maxBytes];
		}
		return BitSign;
	}
	
	protected var signClass:Class;
	protected var head:BitSign;
	
	public function BitSignFactory( signClass:Class = null ) {
		this.signClass = signClass || BitSign;
	}

	public function get( byteCount:uint ):BitSign {
		var sign:BitSign = head;
		if (sign) {
			head = head.next;
			sign.next = null;
		} else {
			sign = new signClass();
		}
		return sign;
	}

	public function recycle( sign:BitSign ):void {
		sign.next = head;
		head = sign;
	}
}
}

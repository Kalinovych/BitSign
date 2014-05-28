/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures {
public class BitSignFactory implements IBitSignFactory {
	protected var signClass:Class;
	protected var head:BitSign;
	
	public function BitSignFactory( signClass:Class = null ) {
		this.signClass = signClass || BitSign;
	}

	public function get():BitSign {
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

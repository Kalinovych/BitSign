/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package com.flashrush.signatures.v2 {
public class Sign implements ISign {
	internal var value:uint;

	public function Sign() {
	}

	public function set( flag:uint ):void {
		value |= (0x00000001 << flag);
	}

	public function unset( flag:uint ):void {
		value &= ~(0x00000001 << flag);
	}

	public function isSet( flag:uint ):Boolean {
		return (flag & value);
	}

	public function clear():void {
		value = 0x0;
	}

	public function equal( sign:ISign ):Boolean {
		return (value == (sign as Sign).value);
	}

	public function partOf( sign:ISign ):Boolean {
		return (value == (value & (sign as Sign).value));
	}

	public function hasAllOf( sign:ISign ):Boolean {
		var byte:uint = (sign as Sign).value;
		return (byte == (byte & value));
	}

	public function toString( fillWithZeros:Boolean = false ):String {
		return "[" + toBitString( value, fillWithZeros ) + "]";
	}

	public static function toBitString( value:uint, fillWithZeros:Boolean = false ):String {
		var str:String = value.toString( 2 );
		if ( fillWithZeros ) {
			var zerosToAdd:int = 32 - str.length;
			while ( zerosToAdd ) {
				str = "0" + str;
				zerosToAdd--;
			}
		}
		return str;
	}
}
}

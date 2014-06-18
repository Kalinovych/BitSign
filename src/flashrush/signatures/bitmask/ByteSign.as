/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitmask {
import flashrush.signatures.api.ISign;
import flashrush.signatures.bitmask.api.IBitSign;

public class ByteSign implements IBitSign {
	internal var byte:uint;

	public function ByteSign() {}

	public function set( bitIndex:uint ):void {
		byte |= (1 << bitIndex);
	}

	public function unset( bitIndex:uint ):void {
		byte &= ~(1 << bitIndex);
	}

	public function isSet( bitIndex:uint ):Boolean {
		return (byte & (1 << bitIndex));
	}

	public function clear():void {
		byte = 0x0;
	}

	public function equal( sign:ISign ):Boolean {
		return (byte == (sign as ByteSign).byte);
	}

	public function partOf( sign:ISign ):Boolean {
		return (byte == (byte & (sign as ByteSign).byte));
	}

	public function hasAllOf( sign:ISign ):Boolean {
		var byte:uint = (sign as ByteSign).byte;
		return (byte == (byte & byte));
	}

	public function toString( fillWithZeros:Boolean = false ):String {
		return "[" + toBitString( byte, fillWithZeros ) + "]";
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

/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.api.ISign;
import flashrush.signatures.bitwise.api.IBitSign;

public class DoubleByteSign implements IBitSign {
	internal var byte0:uint;
	internal var byte1:uint;

	public function DoubleByteSign() {}

	public function equal( sign:ISign ):Boolean {
		var other:DoubleByteSign = sign as DoubleByteSign;
		return (byte0 == other.byte0 && byte1 == other.byte1);
	}

	public function partOf( sign:ISign ):Boolean {
		var other:DoubleByteSign = sign as DoubleByteSign;
		return ( byte0 == (byte0 && other.byte0) && byte1 == (byte1 && other.byte1) );
	}

	public function hasAllOf( sign:ISign ):Boolean {
		var other:DoubleByteSign = sign as DoubleByteSign;
		var otherByte0:uint = other.byte0;
		var otherByte1:uint = other.byte1;
		return ( otherByte0 == (otherByte0 & byte0) && otherByte1 == (otherByte1 & byte1) );
	}

	public function set( bitIndex:uint ):void {
		bitIndex < 32 ? byte0 |= (1 << bitIndex) : byte1 |= (1 << bitIndex);
	}

	public function unset( bitIndex:uint ):void {
		bitIndex < 32 ? byte0 &= ~(1 << bitIndex) : byte1 &= ~(1 << bitIndex);
	}

	public function isSet( bitIndex:uint ):Boolean {
		return ( bitIndex < 32 ? byte0 & (1 << bitIndex) : byte1 & (1 << bitIndex) ) > 0;
	}

	public function clear():void {
		byte0 = 0x0;
		byte1 = 0x0;
	}
}
}

/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.api.ISign;
import flashrush.signatures.bitwise.api.IBitSign;

public class MultyByteSign implements IBitSign {
	internal var bytes:Vector.<uint>;
	internal var byteCount:uint;

	public function MultyByteSign( byteCount:uint = 4 ) {
		this.byteCount = byteCount || 1;
		bytes = new Vector.<uint>( this.byteCount );
	}

	public function equal( sign:ISign ):Boolean {
		var other:MultyByteSign = sign as MultyByteSign;
		if ( !other || other.byteCount != byteCount ) {
			return false;
		}

		var i:uint = byteCount;
		while ( i ) {
			i--;
			if ( bytes[i] != other.bytes[i] ) {
				return false;
			}
		}

		return true;
	}

	public function partOf( sign:ISign ):Boolean {
		var other:MultyByteSign = sign as MultyByteSign;
		if ( !other || other.byteCount != byteCount ) {
			return false;
		}

		var i:uint = byteCount;
		var byte:uint;
		while ( i ) {
			i--;
			byte = bytes[i];
			if ( byte != (byte & other.bytes[i]) ) {
				return false;
			}
		}

		return true;
	}

	public function hasAllOf( sign:ISign ):Boolean {
		var other:MultyByteSign = sign as MultyByteSign;
		if ( !other || other.byteCount != byteCount ) {
			return false;
		}

		var i:uint = byteCount;
		var otherByte:uint;
		while ( i ) {
			i--;
			otherByte = other.bytes[i];
			if ( otherByte != (otherByte & bytes[i]) ) {
				return false;
			}
		}

		return true;
	}

	public function set( bitIndex:uint ):void {
		bytes[bitIndex >> 5] |= (1 << (bitIndex & 31));
	}

	public function unset( bitIndex:uint ):void {
		bytes[bitIndex >> 5] &= ~(1 << (bitIndex & 31));
	}

	public function isSet( bitIndex:uint ):Boolean {
		return (bytes[bitIndex >> 5] & (1 << (bitIndex & 31)));
	}

	public function clear():void {
		var i:uint = byteCount;
		while ( i ) {
			i--;
			bytes[i] = 0x0;
		}
	}
}
}

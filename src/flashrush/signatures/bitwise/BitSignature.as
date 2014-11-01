/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flashrush.signatures.api.ISignature;
import flashrush.signatures.bitwise.api.IBitSignature;

public class BitSignature implements IBitSignature {
	internal var bytes:Vector.<uint>;
	internal var byteCount:uint;

	public function BitSignature( byteCount:uint = 4 ) {
		this.byteCount = byteCount || 1;
		bytes = new Vector.<uint>( this.byteCount );
	}

	public function equals( sign:ISignature ):Boolean {
		var other:BitSignature = sign as BitSignature;
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

	public function partOf( sign:ISignature ):Boolean {
		var other:BitSignature = sign as BitSignature;
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

	public function hasAllOf( sign:ISignature ):Boolean {
		var other:BitSignature = sign as BitSignature;
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

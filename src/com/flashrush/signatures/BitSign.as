/**
 * Created by Alexander Kalinovych @2013.
 */
package com.flashrush.signatures {

public class BitSign {
	internal static const BYTE_LENGTH:uint = 32;

	internal var byteMap:Vector.<uint>;
	internal var bytes:uint;
	internal var manager:BitSignManager;
	
	// for a factory pool
	internal var next:BitSign;
	
	/**
	 * 32 elements per byte.
	 * If (elements / 32) will be more then bytes an error will occur.
	 * @param bytes
	 */
	public function BitSign( bytes:uint = 4 ) {
		this.bytes = bytes;
		initialize();
	}

	protected function initialize():void {
		byteMap = new Vector.<uint>( bytes );
	}

	public function add( element:* ):void {
		setBit( manager.elementIndexMap[element] ||= manager.elementIndex++ );
	}

	public function remove( element:* ):void {
		var index:* = manager.elementIndexMap[element];
		// clear if index defined and > 0
		if ( index ) {
			clearBit( index );
		}
	}

	/**
	 * Determines whether the signature specified in the <p>sign</p> parameter is equal to this signature.
	 * @param sign
	 * @return
	 */
	public function equal( sign:BitSign ):Boolean {
		var i:uint;
		for ( i = 0; i < bytes; i++ ) {
			if ( byteMap[i] != sign.byteMap[i] ) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Determines whether the signature specified in the <p>sign</p> have all elements of this signature.
	 * @param sign
	 * @return
	 */
	public function partOf( sign:BitSign ):Boolean {
		var byte:uint;
		var i:uint;
		for ( i = 0; i < bytes; i++ ) {
			byte = byteMap[i];
			if ( byte != (byte & sign.byteMap[i]) ) {
				return false;
			}
		}
		return true;
	}

	/**
	 * Determines whether this signature have all elements of the <p>sign</p>
	 * @param sign
	 * @return
	 */
	public function contains( sign:BitSign ):Boolean {
		var byte:uint;
		var i:uint;
		for ( i = 0; i < bytes; i++ ) {
			byte = sign.byteMap[i];
			if ( byte != (byte & byteMap[i]) ) {
				return false;
			}
		}
		return true;
	}

	public function toString( fullLength:Boolean = false ):String {
		var str:String = "[";
		var i:uint;
		for ( i = 0; i < bytes; i++ ) {
			//str += valueList[i].toString(2);
			str += formatValue( byteMap[i] );
		}
		return str + "]";
	}

	internal function setBit( index:uint ):void {
		var byteIndex:uint = index / BYTE_LENGTH;
		var bitIndex:uint = index - (byteIndex * BYTE_LENGTH);
		byteMap[byteIndex] |= (0x00000001 << bitIndex);
	}

	internal function clearBit( index:uint ):void {
		var byteIndex:uint = index / BYTE_LENGTH;
		var bitIndex:uint = index - (byteIndex * BYTE_LENGTH);
		byteMap[byteIndex] &= ~(0x00000001 << bitIndex);
	}

	internal function reset():void {
		byteMap.length = bytes;
		var i:int = bytes;
		while(i) {
			byteMap[--i] = 0x0;
		}
	}

	protected function formatValue( value:uint, fullLength:Boolean = false ):String {
		var str:String = value.toString( 2 );
		if ( fullLength ) {
			var zerosToAdd:int = 32 - str.length;
			for ( var i:int = 0; i < zerosToAdd; i++ ) {
				str = "0" + str;
			}
		}
		return str;
	}
}
}

/**
 * Created by Alexander Kalinovych @ 2013
 */
package com.flashrush.signatures {

public class Bit64Sign extends BitSign {

	public function Bit64Sign() {
		super( 2 );
	}

	override public function equal( sign:BitSign ):Boolean {
		return ( byteMap[0] == sign.byteMap[0] && byteMap[1] == sign.byteMap[1] );
	}

	override public function partOf( sign:BitSign ):Boolean {
		var byte0:uint = byteMap[0];
		var byte1:uint = byteMap[1];
		return ( byte0 == (byte0 & sign.byteMap[0]) && byte1 == (byte1 & sign.byteMap[1]) );
	}

	override public function contains( sign:BitSign ):Boolean {
		var byte0:uint = sign.byteMap[0];
		var byte1:uint = sign.byteMap[1];
		return ( byte0 == (byte0 & byteMap[0]) && byte1 == (byte1 & byteMap[1]) );
	}
}
}

/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitmask {
import flashrush.signatures.api.ISign;
import flashrush.signatures.bitmask.api.IBitSign;

public class MultyByteSign implements IBitSign {
	public function MultyByteSign() {
	}

	public function equal( sign:ISign ):Boolean {
		return false;
	}

	public function partOf( sign:ISign ):Boolean {
		return false;
	}

	public function hasAllOf( sign:ISign ):Boolean {
		return false;
	}

	public function set( bitIndex:uint ):void {
	}

	public function unset( bitIndex:uint ):void {
	}

	public function isSet( bitIndex:uint ):Boolean {
		return false;
	}

	public function clear():void {
	}
}
}

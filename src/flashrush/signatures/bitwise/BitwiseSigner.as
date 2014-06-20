/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flash.utils.Dictionary;

import flashrush.signatures.api.ISignature;
import flashrush.signatures.api.ISigner;
import flashrush.signatures.bitwise.api.IBitSignature;
import flashrush.signatures.bitwise.api.IBitSignatureFactory;

public class BitwiseSigner implements ISigner {
	protected var factory:IBitSignatureFactory;

	protected var elementIndex:uint;
	protected var elementIndexMap:Dictionary = new Dictionary();

	public function BitwiseSigner( factory:IBitSignatureFactory = null ) {
		this.factory = factory || new BitSignatureFactory();
	}

	public function signElement( element:Object ):ISignature {
		var signature:IBitSignature = factory.createSignature();
		signature.set( $_indexElement( element ) );
		return signature;
	}

	public function signKeys( map:Object ):ISignature {
		var signature:IBitSignature = factory.createSignature();
		for ( var key:* in map ) {
			signature.set( $_indexElement( key ) );
		}
		return signature;
	}

	public function signValues( iterable:Object ):ISignature {
		var signature:IBitSignature = factory.createSignature();
		for each( var value:* in iterable ) {
			signature.set( $_indexElement( value ) );
		}
		return signature;
	}

	public function disposeSign( signature:ISignature ):void {
		factory.disposeSignature( signature as IBitSignature );
	}

	[Inline]
	protected final function $_indexElement( element:* ):uint {
		if ( elementIndexMap[element] !== undefined ) {
			return elementIndexMap[element];
		}
		elementIndex++;
		elementIndexMap[element] = elementIndex;
		return elementIndex;
	}
}
}

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
	
	protected var flagMap:Dictionary = new Dictionary();
	protected var flagCount:uint;
	
	public function BitwiseSigner( factory:IBitSignatureFactory = null ) {
		this.factory = factory || new BitSignatureFactory();
	}
	
	public function signKeys( map:Object ):ISignature {
		const signature:IBitSignature = factory.createSignature();
		for ( var key:* in map ) {
			signature.set( $provideFlag( key ) );
		}
		return signature;
	}
	
	public function signValues( iterable:Object ):ISignature {
		const signature:IBitSignature = factory.createSignature();
		for each( var item:* in iterable ) {
			signature.set( $provideFlag( item ) );
		}
		return signature;
	}
	
	public function signFiltered( iterable:Object, callback:Function ):ISignature {
		const signature:IBitSignature = factory.createSignature();
		for each( var item:* in iterable ) {
			if ( callback( item ) ) {
				signature.set( $provideFlag( item ) );
			}
		}
		return signature;
	}
	
	public function signElement( element:Object ):ISignature {
		const signature:IBitSignature = factory.createSignature();
		signature.set( $provideFlag( element ) );
		return signature;
	}
	
	public function includeTo( element:Object, signature:ISignature ):void {
		(signature as IBitSignature).set( $provideFlag( element ) );
	}
	
	public function excludeFrom( element:Object, signature:ISignature ):void {
		if ( element in flagMap ) {
			(signature as IBitSignature).unset( flagMap[element] );
		}
	}
	
	public function disposeSign( signature:ISignature ):void {
		factory.disposeSignature( signature as IBitSignature );
	}
	
	
	
	public function signEmpty():ISignature {
		return factory.createSignature();
	}
	
	public function provideFlag( element:* ):int {
		return ( element in flagMap ? flagMap[element] : -1 );
	}
	
	
	
	
	[Inline]
	protected final function $provideFlag( element:* ):uint {
		if ( element in flagMap ) {
			return flagMap[element];
		}
		flagMap[element] = flagCount;
		flagCount++;
		return flagCount;
		
		/*if ( elementIndexMap[element] !== undefined ) {
			return elementIndexMap[element];
		}
		availableIndex++;
		elementIndexMap[element] = availableIndex;
		return availableIndex;*/
	}
}
}

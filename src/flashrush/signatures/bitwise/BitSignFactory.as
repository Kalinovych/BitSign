/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flash.utils.Dictionary;

import flashrush.signatures.utils.SignaturePool;
import flashrush.signatures.api.ISignature;
import flashrush.signatures.bitwise.api.IBitSignature;

public class BitSignFactory {
	protected var pool:SignaturePool;

	protected var elementIndex:uint;
	protected var elementIndexMap:Dictionary = new Dictionary();

	public function BitSignFactory( pool:SignaturePool ) {
		this.pool = pool;
	}

	public function signKeys( map:Object ):ISignature {
		var sign:IBitSignature = _allocateSign();
		for ( var key:* in map ) {
			sign.set( _indexElement( key ) );
		}
		return sign;
	}

	public function signValues( iterable:Object ):ISignature {
		var sign:IBitSignature = _allocateSign();
		for each( var value:* in iterable ) {
			sign.set( _indexElement( value ) );
		}
		return sign;
	}
	
	[Inline]
	protected final function _allocateSign():IBitSignature {
		return pool.get() as IBitSignature;
	}

	[Inline]
	protected final function _recycleSign( sign:IBitSignature ):void {
		pool.recycle( sign );
	}

	[Inline]
	protected final function _indexElement( element:* ):uint {
		if ( elementIndexMap[element] !== undefined ) {
			return elementIndexMap[element];
		}
		elementIndex++;
		elementIndexMap[element] = elementIndex;
		return elementIndex;
	}
}
}

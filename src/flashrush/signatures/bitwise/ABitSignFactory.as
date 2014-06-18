/*
 * Copyright (c) 2014, FlashRushGames.com
 * @author Alexander Kalinovych
 */
package flashrush.signatures.bitwise {
import flash.utils.Dictionary;

import flashrush.signatures.SignPool;
import flashrush.signatures.api.ISign;
import flashrush.signatures.bitwise.api.IBitSign;

public class ABitSignFactory {
	protected var pool:SignPool;

	protected var elementIndex:uint;
	protected var elementIndexMap:Dictionary = new Dictionary();

	public function ABitSignFactory( pool:SignPool ) {
		this.pool = pool;
	}

	public function signKeys( map:Object ):ISign {
		var sign:IBitSign = _allocateSign();
		for ( var key:* in map ) {
			sign.set( _indexElement( key ) );
		}
		return sign;
	}

	public function signValues( iterable:Object ):ISign {
		var sign:IBitSign = _allocateSign();
		for each( var value:* in iterable ) {
			sign.set( _indexElement( value ) );
		}
		return sign;
	}
	
	[Inline]
	protected final function _allocateSign():IBitSign {
		return pool.get() as IBitSign;
	}

	[Inline]
	protected final function _recycleSign( sign:IBitSign ):void {
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

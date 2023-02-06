package backend;

import openfl.utils.Assets;

class AssetPaths {
 inline public static function returnMapOgmo(key:String) {
		return 'assets/maps/$key/map.ogmo';
	}
 inline public static function returnMapJson(key:String) {
		return 'assets/maps/$key/map.json';
	}
 inline public static function returnMapTileset(key:String) {
		return 'assets/maps/$key/tileset.png';
	}
}

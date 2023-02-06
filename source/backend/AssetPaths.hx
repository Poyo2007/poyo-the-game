package backend;

import openfl.utils.Assets;

class AssetPaths {
 inline public static function returnMapCSV(key:String) {
		return 'assets/maps/$key/map.csv';
	}
 inline public static function returnMapTileset(key:String) {
		return Assets.getText('assets/maps/$key/tileset.png');
	}
}

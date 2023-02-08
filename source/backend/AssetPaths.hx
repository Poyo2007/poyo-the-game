package backend;

import openfl.utils.Assets;
import backend.MetaData;

class AssetPaths {
 inline public static function returnMapCSV(key:String) {
		return Assets.getText('assets/maps/$key/map.csv');
	}
 inline public static function returnMapTileset(key:String) {
		return 'assets/maps/$key/tileset.png';
	}
	inline public static function returnCharacter(key:String) {
		var char:String = MetaData._character;
		return 'assets/characters/$char/$key.png';
	}
}

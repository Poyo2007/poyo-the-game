package backend;

class AssetPaths {
 public static function returnMapCSV(key:String) {
		return 'assets/maps/$key/map.csv';
	}
 public static function returnMapTileset(key:String) {
		return 'assets/maps/$key/tileset.png';
	}
}

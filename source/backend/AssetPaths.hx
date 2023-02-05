package backend;

class AssetPaths {
 public static function returnMapCSV(map:String) {
		return 'assets/maps/$key/map.csv';
	}
 public static function returnMapTileset(map:String) {
		return 'assets/maps/$key/tileset.png';
	}
}

package game;

import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import openfl.utils.Assets;
import backend.AssetPaths;

class PlayState extends FlxState
{
	var mapName:String = 'quiet-graveyard';
	var level:FlxTilemap;
	override public function create()
	{
		super.create();

		level = new FlxTilemap();
    var mapData:String = Assets.getText(AssetPaths.returnMapCSV(mapName));
    var mapTilePath:String = AssetPaths.returnMapTileset(mapName);
    level.loadMapFromCSV(mapData, mapTilePath, 16, 16);
    add(level);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

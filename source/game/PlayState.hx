package game;

import flixel.FlxState;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import openfl.utils.Assets;
import backend.AssetPaths;

class PlayState extends FlxState
{
	var mapName:String = 'quiet-graveyard';
	
	var map:FlxTilemap;
	var loadMap:FlxOgmo3Loader;

	override public function create()
	{
		super.create();

		map = new FlxOgmo3Loader(AssetPaths.returnMapOgmo(mapName), AssetPaths.returnMapJson(mapName);
		walls = map.loadTilemap(AssetPaths.returnMapTileset(mapName), "walls");
		add(walls);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

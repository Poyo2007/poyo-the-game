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
	var mapLoader:FlxOgmo3Loader;

	override public function create()
	{
		super.create();

		mapLoader = new FlxOgmo3Loader(AssetPaths.returnMapOgmo(mapName), AssetPaths.returnMapJson(mapName));
		map = mapLoader.loadTilemap(AssetPaths.returnMapTileset(mapName), "map");
		add(map);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}

package game;
 
import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import backend.AssetPaths;
import frontend.Player;
 
class PlayState extends FlxState
{
	var level:FlxTilemap;
	var player:Player;

	override function create():Void
	{
		level = new FlxTilemap();
		level.loadMapFromCSV(AssetPaths.returnMapCSV('quiet-graveyard'), AssetPaths.returnMapTileset('quiet-graveyard'), 16, 16);
		add(level);

		player = new Player(0, 0);
		add(player);

		super.create();
	}

	override function update(elapsed:Float):Void
	{
		FlxG.collide(player, level);

		super.update();
	}
}
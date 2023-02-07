package game;
 
import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import mobile.flixel.FlxVirtualPad;
import backend.AssetPaths;
import frontend.Player;
 
class PlayState extends FlxState
{
	var level:FlxTilemap;
	var player:Player;
	#if mobile
	var flxPad:FlxVirtualPad;
	#end

	override function create():Void
	{
		level = new FlxTilemap();
		level.loadMapFromCSV(AssetPaths.returnMapCSV('quiet-graveyard'), AssetPaths.returnMapTileset('quiet-graveyard'), 16, 16);
		add(level);

		player = new Player(0, 0);
		add(player);

		#if mobile
		flxPad = new FlxVirtualPad(LEFT_FULL, A_B_X_Y);
		add(flxPad);
		#end

		super.create();
	}

	override function update(elapsed:Float):Void
	{
		FlxG.collide(player, level);

		if (flxPad.buttonLeft.pressed)
			player.movement(LEFT);
		else if (flxPad.buttonRight.pressed)
			player.movement(RIGHT);

		if (flxPad.buttonA.pressed)
			player.movement(JUMP);

		super.update(elapsed);
	}
}
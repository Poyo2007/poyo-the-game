package game;

import flixel.FlxState;
import flixel.FlxCamera;
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

	var defaultCam:FlxCamera;
	#if mobile
	var controlsCam:FlxCamera;
	#end

	override function create():Void
	{
		defaultCam = new FlxCamera();
		#if mobile
		controlsCam = new FlxCamera();
		controlsCam.bgColor.alpha = 0;
		#end

		FlxG.cameras.reset(defaultCam);
		#if mobile
		FlxG.cameras.add(controlsCam, false);
		#end

		FlxG.cameras.setDefaultDrawTarget(defaultCam, true);

		level = new FlxTilemap();
		level.loadMapFromCSV(AssetPaths.returnMapCSV('quiet-graveyard'), AssetPaths.returnMapTileset('quiet-graveyard'), 16, 16);
		add(level);

		persistentUpdate = true;
		persistentDraw = true;

		player = new Player(0, 0);
		add(player);

		#if mobile
		flxPad = new FlxVirtualPad(LEFT_FULL, A_B_X_Y);
		flxPad.cameras = [controlsCam];
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
		else
			player.movement(NOTJUMP);

		super.update(elapsed);
	}
}
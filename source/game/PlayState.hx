package game;

import flixel.FlxState;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import mobile.flixel.FlxVirtualPad;
import backend.AssetPaths;
import backend.MetaData;
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
		defaultCam.zoom = 4;
		#if mobile
		FlxG.cameras.add(controlsCam, false);
		#end

		FlxG.cameras.setDefaultDrawTarget(defaultCam, true);

		level = new FlxTilemap();
		level.loadMapFromCSV(AssetPaths.returnMapCSV(MetaData._mapName), AssetPaths.returnMapTileset(MetaData._mapName), 16, 16);
		add(level);

		persistentUpdate = true;
		persistentDraw = true;

		player = new Player(0, 0);
		defaultCam.follow(player, LOCKON, 2);
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
		FlxG.collide(level, player);

		if (FlxG.keys.anyPressed([LEFT, A]), #if mobile || flxPad.buttonLeft.pressed #end)
			player.movement(LEFT);
		else if (FlxG.keys.anyPressed([RIGHT, D]), #if mobile || flxPad.buttonRight.pressed #end)
			player.movement(RIGHT);

		if (Flxg.keys.anyPressed([SPACE, Z]) #if mobile || flxPad.buttonA.pressed #end)
			player.movement(JUMP);
		else
			player.movement(NOTJUMP);

		super.update(elapsed);
	}
}
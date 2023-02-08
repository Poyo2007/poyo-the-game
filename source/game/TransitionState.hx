package game;

import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import backend.MetaData;
import backend.AssetPaths;
import flixel.FlxState;

class TransitionState extends FlxState
{
	var character:FlxSprite;

	override function create()
	{
		var player = new FlxSprite();
		player.loadGraphic(AssetPaths.returnCharacter('transition'));
		add(player);
	}
}
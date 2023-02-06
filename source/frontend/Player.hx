package frontend;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Player extends FlxSprite
{
	var player:FlxSprite;
	public function new(x:Float, y:Float)
	{
		player = new FlxSprite();
		player.makeGraphic(200, 200, FlxColor.WHITE);
		player.acceleration.y = 400;
		// object will not accelerate beyond 200 pixels per second
		player.maxVelocity.y = 200;
	}
}
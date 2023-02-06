package frontend;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Player extends FlxSprite
{
	var player:FlxSprite;
	public function new(x:Float, y:Float)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.WHITE);
		acceleration.y = 400;
		// object will not accelerate beyond 200 pixels per second
		maxVelocity.y = 200;
	}
}
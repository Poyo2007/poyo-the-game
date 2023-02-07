package frontend;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import mobile.flixel.FlxVirtualPad;

class Player extends FlxSprite
{
	var speed:Int = 150;

	public function new(x:Float, y:Float)
	{
		super(x, y);

		makeGraphic(16, 16, FlxColor.WHITE);
		acceleration.y = 400;
		maxVelocity.y = 200;
		drag.x = speed * 4;
	}

	public function movement(move:FlxMovement)
	{
	 if (frontend.FlxMovement == LEFT)
		velocity.x = speed;
	}
}

enum FlxMovement
{
	LEFT;
	RIGHT;
	STILL;
}
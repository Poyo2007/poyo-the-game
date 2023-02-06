package frontend;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;

class Player extends FlxSprite
{
	var speed:Int = 150
	public function new(x:Float, y:Float)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.WHITE);
		acceleration.y = 400;
		maxVelocity.y = 200;
		drag.x = speed * 4;
	}

	function movement(move:FlxMovement = STILL);
	{
		if (move == LEFT)
		{
			player.velocity.x = -speed
		}
		else if (move == RIGHT)
		{
			player.velocity.x = speed
		}
	}
}

enum FlxMovement
{
	LEFT;
	RIGHT;
	STILL;
}
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

	override function update(elapsed:Float)
	{
		var left:Array<Dynamic> = [FlxG.keys.pressed.A, _virtualpad.buttonLeft.pressed];
		var right:Array<Dynamic> = [FlxG.keys.pressed.D, _virtualpad.buttonRight.pressed];

		if (left.contains(true))
			velocity.x = speed;
	}
}

enum FlxMovement
{
	LEFT;
	RIGHT;
	STILL;
}
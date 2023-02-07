package frontend;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxG;
import mobile.flixel.FlxVirtualPad;

enum FlxMovement
{
	LEFT;
	RIGHT;
	JUMP;
	NOTJUMP;
}
enum PlayerState
{
	IDLE;
	MOVING;
	JUMPING;
}

class Player extends FlxSprite
{
	var speed:Int = 150;
	var state:PlayerState = IDLE;
	var jumping:Bool = false;
	var jumpPressed:Bool = false;
	var jumpTimer:Float = 0;

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
		if (jumping && !jumpPressed)
			jumping = false;

		/*
		 * Reset jumpTimer when touching the floor
		 * Note: This sprite's touching flags are set via FlxG.collide,
		 * and are reset to false on super.update
		 */
		if (isTouching(DOWN) && !jumping)
			jumpTimer = 0;

		if (jumpTimer >= 0 && jumpPressed)
		{
			jumping = true;
			jumpTimer += elapsed;
		}
		else
			jumpTimer = -1;

		// hold button to jump higher (up to 0.25s)
		if (jumpTimer > 0 && jumpTimer < 0.25)
			sprite.velocity.y = -300;
	}

		super.update(elapsed);
	 }

	public function movement(move:FlxMovement)
	{
		if (move == LEFT) {
			velocity.x = -speed;
			if (!jumping)
				state = MOVING;
		} else if (move == RIGHT) {
			velocity.x = speed;
			if (!jumping)
				state = MOVING;
		} else {
			if (!jumping)
				state = IDLE;
		}

		if (move == JUMP) {
			jumpPressed = true;
		} else if (move == NOTJUMP) {
			jumpPressed = false;
		}
	}
}
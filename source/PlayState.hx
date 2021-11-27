package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.scaleModes.FillScaleMode;
import flixel.system.scaleModes.FixedScaleAdjustSizeScaleMode;
import flixel.system.scaleModes.FixedScaleMode;
import flixel.system.scaleModes.PixelPerfectScaleMode;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.system.scaleModes.RelativeScaleMode;
import flixel.system.scaleModes.StageSizeScaleMode;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var sprite:FlxSprite = null;
	var spriteIndex:Int = 0;
	var SPRITE_MAX = 3;

	var scaleModes = [
		new FillScaleMode(),
		new FixedScaleAdjustSizeScaleMode(),
		new FixedScaleMode(),
		new PixelPerfectScaleMode(),
		new RatioScaleMode(),
		new RelativeScaleMode(1, 1),
		new RelativeScaleMode(0.5, 0.5),
		new RelativeScaleMode(0.5, 1),
		new StageSizeScaleMode(),
	];
	var scaleModeIndex = -1;

	override public function create()
	{
		super.create();

		// Make the background a distinct but unabrasive pink.
		this.bgColor = 0xFFDD66DD;

		addHelpText();
		cycleScaleMode();
		cycleSprite();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// Press SPACE to change the sprite.
		if (FlxG.keys.justPressed.SPACE)
		{
			cycleSprite();
		}

		// Press ENTER to change the scale mode.
		if (FlxG.keys.justPressed.ENTER)
		{
			cycleScaleMode();
		}
	}

	var helpText:FlxText = null;
	var scaleText:FlxText = null;

	function addHelpText()
	{
		helpText = new FlxText(0, 0, FlxG.width, "SPACE: cycle sprites\nENTER: cycle scale modes.", 16);
		add(helpText);
		scaleText = new FlxText(0, FlxG.height - 24, FlxG.width, "UNKNOWN", 16);
		add(scaleText);
	}

	function cycleSprite()
	{
		spriteIndex++;

		if (spriteIndex >= SPRITE_MAX)
		{
			spriteIndex = 0;
		}

		switch (spriteIndex)
		{
			case 0:
				remove(sprite);
			case 1:
				remove(sprite);
				sprite = new FlxSprite(0, 0);
				sprite.loadGraphic("assets/images/TrickyTest.png", false, 320, 320, false);
				sprite.setGraphicSize(320, 320);
				sprite.x = FlxG.width / 2 - sprite.width / 2;
				// sprite.x = 0 - sprite.width / 2;
				sprite.y = FlxG.height / 2 - sprite.height / 2;
				add(sprite);
			case 2:
				remove(sprite);
				sprite.loadGraphic("assets/images/tricky.png", false, 320, 320, false);
				sprite.setGraphicSize(320, 320);
				sprite.x = FlxG.width / 2 - sprite.width / 2;
				sprite.y = FlxG.height / 2 - sprite.height / 2;
				add(sprite);
			default:
				trace('ERROR: Bad sprite index!');
		}
	}

	function cycleScaleMode()
	{
		scaleModeIndex++;

		if (scaleModeIndex >= scaleModes.length)
		{
			scaleModeIndex = 0;
		}

		FlxG.scaleMode = scaleModes[scaleModeIndex];

		scaleText.text = Type.getClassName(Type.getClass(FlxG.scaleMode));
	}
}

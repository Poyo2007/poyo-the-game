package game;
 
import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import backend.AssetPaths;
 
class PlayState extends FlxState
{
    var level:FlxTilemap;
 
    override public function create():Void
    {
        super.create();
 
        level = new FlxTilemap();
				level.loadMapFromCSV(AssetPaths.returnMapCSV('quiet-graveyard'), AssetPaths.returnMapTileset('quiet-graveyard'), 16, 16);
        add(level);
    }
 
    override public function update():Void
    {
        super.update();
    }
 
    override public function destroy():Void
    {
        super.destroy();
    }
}
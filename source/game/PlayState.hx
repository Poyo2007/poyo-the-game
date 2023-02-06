package game;
 
import flixel.FlxState;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import backend.AssetPaths;
 
class PlayState extends FlxState
{
    var level:FlxTilemap;
 
    function create():Void
    {
        level = new FlxTilemap();
				level.loadMapFromCSV(AssetPaths.returnMapCSV('quiet-graveyard'), AssetPaths.returnMapTileset('quiet-graveyard'), 16, 16);
        add(level);
 
        super.create();
    }
}
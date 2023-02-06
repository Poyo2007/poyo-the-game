package game;
 
import flixel.FlxState;
import flixel.FlxG;
import haxe.io.Path;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
 
class PlayState extends FlxState
{
    override public function create():Void
    {
        super.create();
 
        // Load the TMX data
        var tiledLevel:TiledMap = new TiledMap("assets/maps/quiet-graveyard/map.tmx");
 
        // Get map variables
        var tileSize = tiledLevel.tileWidth;
        var mapW = tiledLevel.width;
        var mapH = tiledLevel.height;
 
        // Loop through each tile layer and render tile map
        for (layer in tiledLevel.layers)
        {
            var layerData:Array<Int> = layer.tileArray;
 						var tilesheetPath:String = "assets/maps/quiet-graveyard/tileset.png";
            var level:FlxTilemap = new FlxTilemap();
 
            level.widthInTiles = mapW;
            level.heightInTiles = mapH;
 
            var tileGID:Int = getStartGid(tiledLevel, tilesheetName);
 
            level.loadMap(layer.tileArray, tilesheetPath, tileSize, tileSize, FlxTilemap.OFF, tileGID);
            add(level);
        }
    }
 
    function getStartGid (tiledLevel:TiledMap, tilesheetName:String):Int
    {
        // This function gets the starting GID of a tilesheet
 
        // Note: "0" is empty tile, so default to a non-empty "1" value.
        var tileGID:Int = 1;
 
        for (tileset in tiledLevel.tilesets)
        {
            // We need to search the tileset's firstGID -- to do that,
            // we compare the tilesheet paths. If it matches, we
            // extract the firstGID value.
            var tilesheetPath:Path = new Path(tileset.imageSource);
            var thisTilesheetName = tilesheetPath.file + "." + tilesheetPath.ext;
            if (thisTilesheetName == tilesheetName)
            {
                tileGID = tileset.firstGID;
            }
        }
 
        return tileGID;
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
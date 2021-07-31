import "graphics" for ImageData
import "json" for Json
import "graphics" for Canvas, Color
import "./layerType" for LayerType
import "dome" for Window
import "math" for Math
class Main {
    construct new() {
        _tileSheet = ImageData.loadFromFile("assets/tilemap_packed.png")
        _tileSheetH = 128
        _tileSheetW = 272
        _tileH = 16
        _tileW = 16
        _rows = _tileSheetW/_tileW
        _cols = _tileSheetH/_tileH
        _levelData = Json.load("assets/level1.json")
        _levelHeight = _levelData["tileheight"]
        _levelWidth = _levelData["tilewidth"]
        _layers = _levelData["layers"]       
        Window.resize(256, 256)
        Canvas.resize(256, 256)
        
    }

    init() {

    }

    update() {

    }

    drawTile(tileIndex, mapX, mapY) {
        var spriteX = (tileIndex % _rows)
        var spriteY = Math.floor ((tileIndex - spriteX) % _cols)
        _tileSheet.transform({
            "srcX": spriteX * 16,
            "srcY": spriteY * 16,
            "srcW": _tileW,
            "srcH": _tileH,
            "scaleX": 1,
            "scaleY": 1
        }).draw(mapX*16,mapY*16)
    }

    drawLevel(x, y) {
        for(layer in _layers) {
            var index = 0        
            for(levelY in 0...(_levelHeight)) {
                for(levelX in 0...(_levelWidth)) {                    
                    if((layer["type"] == LayerType.Tile) && (layer["visible"] == true)) {
                        var tileIndex = layer["data"][index]
                        if (tileIndex > 0) {
                            drawTile(tileIndex-1, levelX, levelY)
                        }
                    }
                  index = index + 1
                }
            }
        }
    }

    getTile() {

    }

    draw(alpha) {
        drawLevel(0,0)
    }
}

var Game = Main.new()
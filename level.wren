import "json" for Json
import "graphics" for ImageData
import "math" for Math
import "./layer_type" for LayerType

class Level {
    construct new(levelName) {
        _levelData = Json.load("assets/%(levelName).json")
        var tileSheetData =  _levelData["tilesets"][0] // Assuming I only use single tilesheet
        _tileSheet = ImageData.loadFromFile("assets/%(tileSheetData["image"])")
        _tileSheetH = tileSheetData["imageheight"]
        _tileSheetW = tileSheetData["imagewidth"]
        _tileH = tileSheetData["tileheight"]
        _tileW = tileSheetData["tilewidth"]
        _levelHeight = _levelData["height"]
        _levelWidth = _levelData["width"]
        _layers = _levelData["layers"]
        _rows = Math.floor(_tileSheetW/_tileW)
        _cols = Math.floor(_tileSheetH/_tileH)
    }

    load(levelName) {

    }

    draw(x, y) {
        var startX = x
        var startY = y
        for(layer in _layers) {
            var index = 0        
            for(levelY in 0...(_levelHeight)) {
                for(levelX in 0...(_levelWidth)) {
                    if((layer["type"] == LayerType.Tile) && (layer["visible"] == true)) {
                        var tileIndex = layer["data"][index]
                        if (tileIndex > 0) {
                            drawTile(tileIndex-1, x, y)
                        }
                    }
                    index = index + 1
                    x = x + 16
                }
                y = y + 16
                x = startX
            }
            x = startX
            y = startY
        }
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
        }).draw(mapX,mapY)
    }
}
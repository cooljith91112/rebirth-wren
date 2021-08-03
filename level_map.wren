import "json" for Json
import "graphics" for ImageData
import "math" for Math
import "./layer_type" for LayerType, ObjectType
import "./entities/player_entity" for Player
class LevelMap {
    construct new(mapName) {
        _mapData = Json.load("assets/%(mapName).json")
        var tileSheetData =  _mapData["tilesets"][0] // Assuming there is only a single tilesheet/level
        _tileSheet = ImageData.loadFromFile("assets/%(tileSheetData["image"])")
        _tileSheetH = tileSheetData["imageheight"]
        _tileSheetW = tileSheetData["imagewidth"]
        _tileH = tileSheetData["tileheight"]
        _tileW = tileSheetData["tilewidth"]
        _mapHeight = _mapData["height"]
        _mapWidth = _mapData["width"]
        _layers = _mapData["layers"]
        _rows = Math.floor(_tileSheetW/_tileW)
        _cols = Math.floor(_tileSheetH/_tileH)
        _playerPos = {
            "x": 0,
            "y": 0
        }
        placeObjects()

    }

    playerPos = (position) { 
        _playerPos = position
    }

    playerPos { _playerPos }
    
    placeObjects() {
        for(layer in _layers) {
            if(layer["type"] == LayerType.Object) {
                for(object in layer["objects"]) {
                    if(object["type"]==ObjectType.PLAYER) {
                        playerPos = {
                            "x": object["x"],
                            "y": object["y"]
                        }
                        _player = Player.new(playerPos["x"], playerPos["y"])                        
                    }
                }
            }
        }
    }

    draw(dt) {
        _player.draw(dt)
    }

    update() {
        _player.update()
    }

    render(x, y) {
        var startX = x
        var startY = y
        for(layer in _layers) {
            var index = 0        
            for(mapYV in 0...(_mapHeight)) {
                for(mapXV in 0...(_mapWidth)) {
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
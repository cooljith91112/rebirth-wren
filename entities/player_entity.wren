import "graphics" for ImageData, Canvas
import "./controls" for Controls
import "./config" for Config
class Player {
    construct new(x,y) {
        _x = x
        _y = y

        _playerSprite = ImageData.loadFromFile("assets/sprites/player.png")
    }

    update() {
        if(Controls.isKeyDown(Config.KeyboardConstants["UP"])) {
            _y = _y - 1
        }
        if(Controls.isKeyDown(Config.KeyboardConstants["DOWN"])) {
            _y = _y + 1
        }
        if(Controls.isKeyDown(Config.KeyboardConstants["LEFT"])) {
            _x = _x - 1
        }
        if(Controls.isKeyDown(Config.KeyboardConstants["RIGHT"])) {
            _x = _x + 1
        }
    }

    draw(dt) {
        Canvas.draw(_playerSprite,_x,_y)
    }

}
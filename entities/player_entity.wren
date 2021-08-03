import "graphics" for ImageData, Canvas
import "./controls" for Controls
import "./config" for Config
class Player {
    construct new(x,y, gameState) {
        __gameState = gameState
        _x = x
        _y = y

        _playerSprite = ImageData.loadFromFile("assets/sprites/player.png")
    }

    x { _x }
    y { _y }
    w { 16 }
    h {  16 }

    update() {

        var collided = __gameState.checkCollision(this)
       
        if(Controls.isKeyDown(Config.KeyboardConstants["UP"]) && !collided) {
            _y = _y - 1
        } else if(Controls.isKeyDown(Config.KeyboardConstants["UP"]) && collided){
            _y = _y + 1
        }

        if(Controls.isKeyDown(Config.KeyboardConstants["DOWN"]) && !collided) {
            _y = _y + 1
        } else if(Controls.isKeyDown(Config.KeyboardConstants["DOWN"]) && collided){
            _y = _y - 1
        }

        if(Controls.isKeyDown(Config.KeyboardConstants["LEFT"]) && !collided) {
            _x = _x - 1
        } else if(Controls.isKeyDown(Config.KeyboardConstants["LEFT"]) && collided){
            _x = _x + 1
        }

        if(Controls.isKeyDown(Config.KeyboardConstants["RIGHT"]) && !collided) {
            _x = _x + 1
        } else if(Controls.isKeyDown(Config.KeyboardConstants["RIGHT"]) && collided){
            _x = _x - 1
        }


    }

    draw(dt) {
        Canvas.draw(_playerSprite,_x,_y)
    }

}
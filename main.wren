import "graphics" for ImageData
import "json" for Json
import "graphics" for Canvas, Color
import "dome" for Window, Process
import "math" for Math
import "config" for Config
import "input" for Keyboard
import "./controls" for Controls
import "./game_state" for GameState
import "./levels/level1" for Level1

class Main {
    construct new() {
        Config.setup()
        __gameState = GameState.new()
        __gameState.switch(Level1)
    }

    init() {

    }

    update() {
        if(Controls.detect(Config.KeyboardConstants["QUIT"])) {
            Process.exit(0)
        }
        __gameState.update()
    }

    draw(dt) {
        Canvas.cls(Color.pink)
        __gameState.draw(dt)
    }
}

var Game = Main.new()
import "graphics" for ImageData
import "json" for Json
import "graphics" for Canvas, Color
import "dome" for Window, Process
import "math" for Math
import "config" for Config
import "./controls" for Controls
import "./game_state" for GameState
import "./levels/menu" for Menu

class Main {
    construct new() {
    }

    init() {
        Config.new()
        __gameState = GameState.new()
        __gameState.switch(Menu)
    }

    update() {
        if(Controls.isKeyDown(Config.KeyboardConstants["QUIT"])) {
            Process.exit(0)
        }

        if(Controls.justPressed(Config.KeyboardConstants["FULLSCREEN"])) {
            __gameState.toggleFullscreen()
        }
        __gameState.update()
    }

    draw(dt) {
        Canvas.cls(Color.black)
        __gameState.draw(dt)
    }
}

var Game = Main.new()
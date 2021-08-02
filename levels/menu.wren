import "graphics" for Canvas, Color
import "./controls" for Controls
import "config" for Config
import "levels/level1" for Level1
import "audio" for AudioEngine
import "font" for Font

class Menu {
    construct new(gameState) {
        __gameState = gameState
        var channel = AudioEngine.play("menu_music")
        channel.volume = 0.5
        Canvas.font = "font_medium"
    }

    update() {
        if(Controls.isKeyDown(Config.KeyboardConstants["SELECT"])) {
            __gameState.switch(Level1)
        }
    }

    draw(dt) {
        Canvas.print("REBIRTH",Config.W/2 - 40,Config.H/2 - 20, Color.white)
    }
}
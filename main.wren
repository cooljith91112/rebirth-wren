import "graphics" for ImageData
import "json" for Json
import "graphics" for Canvas, Color
import "dome" for Window, Process
import "math" for Math
import "config" for Config
import "input" for Keyboard
import "./controls" for Controls
import "./level" for Level

class Main {
    construct new() {
        Config.setup()
        __level = Level.new("level1")
    }

    init() {

    }

    update() {
        if(Controls.detect(Config.KeyboardConstants["QUIT"])) {
            Process.exit(0)
        }
    }

    draw(alpha) {
        Canvas.cls(Color.pink)
        __level.draw(0,0)
    }
}

var Game = Main.new()
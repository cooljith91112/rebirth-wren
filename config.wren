import "graphics" for Canvas
import "dome" for Window
import "font" for Font

class Config {
    construct new() {
        __width = 320
        __height = 240
        setup()
    }

    static W {__width}
    static H {__height}

    static KeyboardConstants {
        return {
            "UP": "up",
            "DOWN": "down",
            "LEFT": "left",
            "RIGHT": "right",
            "PICK" : "c",
            "SELECT": "z",
            "ATTACK": "x",
            "QUIT": "escape",
            "FULLSCREEN": "f"
        }
    }

    setup() {
        setupWindow()
        setupFonts()
    }

    setupWindow() {
        Window.resize(__width*2, __height*2)
        Canvas.resize(__width, __height)
        Window.title = "REBIRTH"
    }
    
    setupFonts() {
        Font.load("font_title", "assets/fonts/lunchds.ttf", 20)
    }
}
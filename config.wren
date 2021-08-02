import "graphics" for Canvas
import "dome" for Window
class Config {
    construct new() {

    }

    static KeyboardConstants {
        return {
            "UP": "up",
            "DOWN": "down",
            "LEFT": "left",
            "RIGHT": "right",
            "PICK" : "c",
            "SELECT": "z",
            "ATTACK": "x",
            "QUIT": "escape"
        }
    }

    static setup() {
        Window.resize(800, 600)
        Canvas.resize(800, 600)
        Window.title = "REBIRTH"
    }

    // static KeyboardConstants() {
    //     return {
    //         "UP": "up",
    //         "DOWN": "down",
    //         "LEFT": "left",
    //         "RIGHT": "right",
    //         "PICK" : "c",
    //         "SELECT": "z",
    //         "ATTACK": "x",
    //         "QUIT": "esc"
    //     }
    // }
}
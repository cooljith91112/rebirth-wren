import "input" for Keyboard

class Controls {
    construct new() {

    }

    static isKeyDown(keyCode) {
        return Keyboard.isKeyDown(keyCode)
    }

    static justPressed(keyCode) {
        return Keyboard[keyCode].justPressed
    }
}
import "input" for Keyboard

class Controls {
    construct new() {

    }

    static detect(keyCode) {    
        return Keyboard.isKeyDown(keyCode)
    }
}
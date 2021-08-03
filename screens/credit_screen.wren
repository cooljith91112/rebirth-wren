import "./controls" for Controls
import "./config" for Config
import "audio" for AudioEngine
import "font" for Font
import "graphics" for Canvas, Color

class CreditScreen {
    construct new(gameState) {
        __gameState = gameState
        var channel = AudioEngine.play("credit", 0.5, true)
        __credits = [
            {
                "text": "A GAME BY",
                "padding": 10,
                "type": "title"
            },
            {
                "text": "Indrajith K L",
                "padding": 30
            },
            {
                "text": "TILESETS & SPRITES",
                "padding": 50,
                "type": "title"
            },
            {
                "text": "kenney.nl",
                "padding": 70
            },
            {
                "text": "MUSIC",
                "padding": 90,
                "type": "title"
            },
            {
                "text": "Juhani Junkala & Eric Skiff",
                "padding": 110
            },
            {
                "text": "SFX",
                "padding": 130,
                "type": "title"
            },
            {
                "text": "sfxr",
                "padding": 150
            },
            {
                "text": "For More Games",
                "padding": 170,
                "type": "title"
            },
            {
                "text": "indrajithmakesgames.com",
                "padding": 190,
                "type": "info"
            }
        ]
    }

    update() {
        if(Controls.justPressed(Config.KeyboardConstants["ATTACK"])) {
            __gameState.switch("menu")
        }
    }

    draw(dt) {
        var x = 0
        var y = 10
        for(credit in __credits) {
            drawCredit(credit, x, y)
            var y = y + 10
        }
    }

    drawCredit(credit, x, y) {
        x = Config.W/2 - ((credit["text"].count * 8)/2)
        y = credit["padding"] + y
        Canvas.print(credit["text"],x ,y , Color.white, credit["type"]=="info" ? "font_minecraft": Font.default)
        if(credit["type"]=="title") {
            x = x
            for(i in 0...(credit["text"].count)) {
                Canvas.print("-",x ,y+8 , Color.white, Font.default)
                x = x + 8
            }
        }
    }
}
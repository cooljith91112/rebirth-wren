import "graphics" for Canvas, Color
import "./controls" for Controls
import "config" for Config
import "levels/level1" for Level1
import "screens/credit_screen" for CreditScreen
import "audio" for AudioEngine
import "font" for Font
import "math" for Math

class MenuScreen {
    construct new(gameState) {
        __gameState = gameState
        // var channel = AudioEngine.play("menu_music")
        // channel.volume = 0.5
        _selectedMenuIdx = 0
        _prevMenuIdx = 0
        _fadeFrame = 255
        _menuItems =  [
            {
                "name": "Start",
                "selected": true,
                "class": Level1,
                "font": Font.default,
                "padding": 20
            },
            {
                "name": "Credits",
                "selected": false,
                "class": CreditScreen,
                "font": Font.default,
                "padding": 40
            }
        ]

    }

    update() {
        if(Controls.isKeyDown(Config.KeyboardConstants["SELECT"])) {
            __gameState.switch(Level1)
        }

        if(Controls.justPressed(Config.KeyboardConstants["UP"])) {
            _prevMenuIdx = _selectedMenuIdx
            if((_selectedMenuIdx-1) < 0) {
                _selectedMenuIdx = (_menuItems.count - 1)
            } else {
                _selectedMenuIdx = _selectedMenuIdx - 1
            }
            AudioEngine.play("select")
        }

        if(Controls.justPressed(Config.KeyboardConstants["DOWN"])) {
            _prevMenuIdx = _selectedMenuIdx
            if((_selectedMenuIdx+1) > (_menuItems.count - 1)) {
                _selectedMenuIdx = 0
            } else {
                _selectedMenuIdx = _selectedMenuIdx + 1
            }
            AudioEngine.play("select")
        }
        
        if(_prevMenuIdx!=_selectedMenuIdx) {
            _menuItems[_prevMenuIdx]["selected"] = false
            _menuItems[_selectedMenuIdx]["selected"] = true
        }

        // _fadeFrame = (_fadeFrame+3) > 255 ? 0 : _fadeFrame + 3

        _fadeFrame = Math.floor(127 + (127 * Math.cos(System.clock)))
        System.print(_fadeFrame)
    }

    draw(dt) {
        
        drawTitle()
        
        for(menuItem in _menuItems) {
            drawMenu(menuItem)
        }

        drawBlinker()
    }

    drawTitle() {
        Canvas.print("REBIRTH",Config.W/2 - 40,Config.H/2 - 20, Color.white, "font_title")
    }

    drawMenu(menuItem) {
        var x = Config.W/2 - ((menuItem["name"].count * 8)/2)
        var y = Config.H/2 + menuItem["padding"]
        Canvas.print(menuItem["name"],x ,y , menuItem["selected"] ? Color.red : Color.white, menuItem["font"])
        if(menuItem["selected"]) {
            Canvas.print(">",x - 10 ,y , Color.red, menuItem["font"])
        }
        // Canvas.print("Credits", Config.W/2 - 28, Config.H/2 + 40, Color.white, Font.default)
    }

    drawBlinker() {
        Canvas.print("Press X to start",Config.W/2 - 64,Config.H/2 + 100, Color.new(255, 255, 255, _fadeFrame), Font.default)
    }
}

/*
(Character length * 8 ) / 2 
*/
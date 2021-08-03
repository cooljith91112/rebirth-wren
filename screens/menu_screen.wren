import "graphics" for Canvas, Color
import "./controls" for Controls
import "./config" for Config
import "audio" for AudioEngine
import "font" for Font
import "math" for Math
import "dome" for Platform

class MenuScreen {
    construct new(gameState) {
        __gameState = gameState
        var channel = AudioEngine.play("menu_music", 0.5, true)
        _selectedMenuIdx = 0
        _prevMenuIdx = 0
        _fadeFrame = 255
        _fadeSelector = 255
        _menuItems =  [
            {
                "name": "Start",
                "selected": true,
                "state": "level1",
                "font": Font.default,
                "padding": 20
            },
            {
                "name": "Credits",
                "selected": false,
                "state": "credit",
                "font": Font.default,
                "padding": 40
            }
        ]
        _time = 0
    }

    update() {
        if(Controls.justPressed(Config.KeyboardConstants["ATTACK"])) {
            __gameState.switch(_menuItems[_selectedMenuIdx]["state"])
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
        _fadeFrame = Math.floor(127 + (127 * Math.cos(System.clock)))
        _fadeSelector = inOutQuad(_time, 0, 255, 50)
        if (_time>51) {
            _time = 0
        } else {
            _time = _time + 1
        }
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
            Canvas.print(">",x - 10 ,y , Color.new(255, 0, 77, _fadeSelector), menuItem["font"])
        }
    }

    drawBlinker() {
        Canvas.print("Press X to select",Config.W/2 - 64,Config.H/2 + 100, Color.new(255, 255, 255, _fadeFrame), Font.default)
    }

    inOutQuad(t, b, c, d) {
        t = t / d * 2
        if( t < 1 ) {
            return Math.abs(Math.floor(((c / 2) * (t.pow(2))) + b))
        } else {
            return  Math.abs(Math.floor(((-c / 2) * ((t - 1) * (t - 3) - 1)) + b))
        }
            
        
    }

}

/*
(Character length * 8 ) / 2 
*/
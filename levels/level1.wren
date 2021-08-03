import "./level_map" for LevelMap
import "audio" for AudioEngine
import "./controls" for Controls
import "./config" for Config
class Level1 { 
    construct new(gameState) {
        __gameState = gameState
        _level1 = LevelMap.new("level1", __gameState)
        var channel = AudioEngine.play("level1_bg")
        channel.volume = 0.2
    }

    update() {
        
        if(Controls.justPressed(Config.KeyboardConstants["ATTACK"])) {
        }

        
    }

    draw(dt) {
        _level1.draw(0,0)
    }
}
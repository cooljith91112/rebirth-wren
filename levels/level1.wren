import "./level_map" for LevelMap
import "audio" for AudioEngine
class Level1 {
    construct new(gameState) {
        _level1 = LevelMap.new("level1")
        var channel = AudioEngine.play("level1_bg")
        channel.volume = 0.2
    }

    update() {

    }

    draw(dt) {
        _level1.draw(0,0)
    }
}
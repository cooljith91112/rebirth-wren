import "./level_map" for LevelMap
class Level1 {
    construct new() {
        _level1 = LevelMap.new("level1")
    }
    
    update() {

    }

    draw(dt) {
        _level1.draw(0,0)
    }
}
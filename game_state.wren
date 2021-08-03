import "audio" for AudioEngine
import "dome" for Window
import "screens/menu_screen" for MenuScreen
import "screens/credit_screen" for CreditScreen
import "levels/level1" for Level1
import "levels/level2" for Level2
class GameState {
    construct new() {
        AudioEngine.load("menu_music","assets/musics/04 All of Us - Menu.ogg")
        AudioEngine.load("level1_bg","assets/musics/01 A Night Of Dizzy Spells.ogg")
        AudioEngine.load("select","assets/sfx/select.wav")
        AudioEngine.load("credit","assets/musics/Juhani Junkala [Retro Game Music Pack] Ending.wav")
        _fullScreen = false
        _entities = []
        _collidables = []
        setupStates()
    }

    setupStates() {
        __gameStates = {
            "menu": MenuScreen,
            "credit": CreditScreen,
            "level1": Level1,
            "level2": Level2
        }
    }

    toggleFullscreen() {
        _fullScreen = !_fullScreen
        Window.fullscreen = _fullScreen
    }

    switch(level) {
        AudioEngine.stopAllChannels()
        _entities.clear()
        _collidables.clear()
        _currentLevel = __gameStates[level].new(this)
        System.print("Current Level : %(__gameStates[level].name)")
    }

    update() {
        _currentLevel.update()
        for(entity in _entities) {
            entity.update()
        }
    }

    draw(dt) {
        _currentLevel.draw(dt)
        for(entity in _entities) {
            entity.draw(dt)
        }
    }

    addEntities(entity) {
        _entities.add(entity)
    }

    addCollidable(collidable) {
        _collidables.add(collidable)
    }

    checkCollision(entity) {
        var collide = false
        for(collidable in _collidables) {
            System.print(entity.x)
            var entityX = entity.x
            var entityY = entity.y
            if(entityX < (collidable["x"] + collidable["width"]) &&
                (entityX + entity.w) > collidable["x"] &&
                entityY < (collidable["y"] + collidable["height"]) &&
                (entityY + entity.h) > collidable["y"]) {
                collide = true
                break
            }
        }

        return collide
    }
}
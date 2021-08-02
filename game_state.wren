import "audio" for AudioEngine
import "dome" for Window

class GameState {
    construct new() {
        AudioEngine.load("menu_music","assets/musics/04 All of Us - Menu.ogg")
        AudioEngine.load("level1_bg","assets/musics/01 A Night Of Dizzy Spells.ogg")
        AudioEngine.load("select","assets/sfx/select.wav")
        _fullScreen = false
    }

    toggleFullscreen() {
        _fullScreen = !_fullScreen
        Window.fullscreen = _fullScreen
    }

    switch(level) {
        AudioEngine.stopAllChannels()
        _currentLevel = level.new(this)
        System.print("Current Level : %(level.name)")
    }

    update() {
        _currentLevel.update()
    }

    draw(dt) {
        _currentLevel.draw(dt)
    }
}
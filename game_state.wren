class GameState {
    construct new() {

    }

    switch(level) {
        _currentLevel = level.new()
    }

    update() {
        _currentLevel.update()
    }

    draw(dt) {
        _currentLevel.draw(dt)
    }
}

## Wren Scratch
### Matrix 
```wren
var matrix = [[1, 2, 3], [4, 5, 6]]
System.print(matrix[0][0])
for(layer in _layerData) {
    System.print(layer)
}
```

### Sprite Sheet Transform
```wren
_spriteSheet.transform({
            "srcX": 16*14,
            "srcY": 0,
            "srcW": 16,
            "srcH": 16,
            "scaleX": 2,
            "scaleY": 2
        }).draw(0,0)
```
import opengl
import shaderProgram
import mesh

type
  TSprite = object
    x: float32
    y: float32
    texture: GLuint
    dead: bool

  PSprite* = ref TSprite

  TSpriteBatch = object
    sprites: seq[PSprite]
    count: GLsizei
    mesh: PMesh
    shader: PShaderProgram

  PSpriteBatch* = ref TSpriteBatch

proc createSpriteBatch*() : PSpriteBatch =
  result = new(TSpriteBatch)

  result.sprites = newSeq[PSprite](0)

  add(result.sprites, new(TSprite))
  add(result.sprites, new(TSprite))

proc createSprite*() : PSprite = 
  result = new(TSprite)

proc Delete*(sprite: PSprite) =
  sprite.dead = true

proc Add*(batch: PSpriteBatch, sprite: PSprite) =
  add(batch.sprites, sprite)

proc Cleanup*(batch: PSpriteBatch) =
  var i = 0
  while i < len(batch.sprites):
    var sprite = batch.sprites[i]

    if sprite.dead:
      var replace = pop(batch.sprites)
      batch.sprites[i] = replace



  
  
require('src/deps')

local G = love.graphics
local K = love.keyboard
local W = love.window
local push = gPush
local triggr = gTriggr

local game, background

local function setupPush()
  local settings = require('src/settings')
  local gameDimensions = settings.window.gameDimensions
  local gameWidth, gameHeight = unpack(gameDimensions)

  push:setupScreen(gameWidth, gameHeight, 800, 960, {vsync = true})
end

function love.keyboard.wasPressed(key)
  return K.keyPresses[key]
end

function love.load()
  G.setDefaultFilter("nearest", "nearest")

  K.keyPresses = {}

  setupPush()
  gUi = require('src/ui')

  game = require('src/game')
  background = G.newImage('assets/img/space-background.png')
end

function love.update(dt)
  game:update(dt)
  K.keyPresses = {}
  triggr:consumeQueue()
end

function love.draw()
  push:start()
  G.draw(background, 0, 0)
  game:render()
  push:finish()
end

function love.keypressed(key)
  K.keyPresses[key] = true
end

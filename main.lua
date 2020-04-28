inspect = require('lib/inspect/inspect')
gClass = require('lib/middleclass/middleclass')
gPush = require('lib/push/push')
gTbl = require('lib/tbl')
gUi = require('src/ui')()

local G = love.graphics
local K = love.keyboard
local W = love.window
local push = gPush

K.keyPresses = {}

local background = G.newImage('assets/img/space-background.png')

function love.keyboard.wasKeyPressed(key)
  return K.keyPresses[key]
end

local game = require('src/game')()
local settings = require('src/settings')

local function setupPush()
  local gameDimensions = settings.window.gameDimensions
  local gameWidth, gameHeight = unpack(gameDimensions)
  local windowWidth, windowHeight = W.getDesktopDimensions()

  push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true})
end

function love.load()
  setupPush()
end

function love.update(dt)
  game:update(dt)
  K.keyPresses = {}
end

function love.draw()
  G.draw(background, 0, 0)
  game:render()
end

function love.keypressed(key)
  K.keyPresses[key] = true
end

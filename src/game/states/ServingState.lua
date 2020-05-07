local G = love.graphics
local K = love.keyboard
local class = gClass
local push = gPush
local ui = gUi

local Ball = require('src/Ball')
local Paddle = require('src/Paddle')

local BaseState = require('src/game/states/BaseState')
local this = class('ServingState', BaseState)
local texts = ui.texts.serving

function this:initialize(handler)
  BaseState:initialize(handler)

  self.paddle = Paddle(
    push:getWidth()/2 - Paddle.width/2,
    push:getHeight() - 50 - Paddle.height/2
  )

  self.ball = Ball(
    push:getWidth()/2 - Ball.width/2,
    self.paddle.y - Ball.height
  )
end

function this:update(dt)
  if K.wasPressed('space') then
    self.handler:goTo('playing')
  end
end

function this:render()
  local serveInstruction = texts.serveInstruction

  self.paddle:render()
  self.ball:render()

  G.draw(serveInstruction, 0, 100)
end

return this

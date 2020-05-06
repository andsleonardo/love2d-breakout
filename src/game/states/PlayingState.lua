local K = love.keyboard
local class = gClass
local push = gPush

local Ball = require('src/Ball')
local Paddle = require('src/Paddle')

local BaseState = require('src/game/states/BaseState')
local this = class('PlayingState', BaseState)

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
  self.paddle:update(dt)
  self.ball:update(dt)

  if K.wasPressed('backspace') then
    self.handler:goTo('titleScreen')
  end
end

function this:render()
  self.paddle:render()
  self.ball:render()
end

return this

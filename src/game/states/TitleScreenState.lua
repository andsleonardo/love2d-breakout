local A = love.audio
local G = love.graphics
local K = love.keyboard
local class = gClass
local push = gPush
local tbl = gTbl
local ui = gUi

local Button = require('src/ui/components/Button')
local Selector = require('src/ui/components/Selector')

local BaseState = require('src/game/states/BaseState')
local TitleScreenState = class('TitleScreenState', BaseState)

function TitleScreenState:initialize(handler)
  BaseState:initialize(handler)

  local game = self.handler

  self.startMenu = Selector({
    Button('START GAME', 0, 700, {
      onClick = function()
        game:goTo('paddleSelection')
      end
    }),
    Button('HIGH SCORES', 0, 780),
  })
end

function TitleScreenState:update(dt)
  if K.wasKeyPressed('down') then
    self.startMenu:nextOption()
  end

  if K.wasKeyPressed('up') then
    self.startMenu:previousOption()
  end

  if K.wasKeyPressed('return') then
    self.startMenu:currentOption():onClick()
  end
end

function TitleScreenState:render()
  G.setFont(ui.fonts.title)
  G.printf('BREAKOUT', 0, 200, G:getWidth(), "center")

  self.startMenu:render()
end

return TitleScreenState

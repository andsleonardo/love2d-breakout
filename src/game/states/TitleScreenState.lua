local A = love.audio
local G = love.graphics
local K = love.keyboard
local class = gClass
local push = gPush
local tbl = gTbl
local ui = gUi

local BaseState = require('src/game/states/BaseState')
local Button = require('src/ui/components/Button')
local Selector = require('src/ui/components/Selector')

local this = class('TitleScreenState', BaseState)
local texts = ui.texts.titleScreen

function this:initialize(handler)
  BaseState:initialize(handler)

  self.startMenu = self:_loadStartMenu()
end

function this:_loadStartMenu()
  local menuOptions = texts.menu
  local startGameOption = menuOptions.startGame
  local highScoresOption = menuOptions.highScores

  return Selector({
    Button(
      startGameOption,
      push:getWidth()/2 - startGameOption:getWidth()/2,
      push:getHeight() - 200,
      {
        onClick = function()
          self.handler:goTo('paddleSelection')
        end
      }
    ),
    Button(
      highScoresOption,
      push:getWidth()/2 - highScoresOption:getWidth()/2,
      push:getHeight() - 200 + startGameOption:getHeight()
    )
  })
end

function this:update()
  if K.wasPressed('down') then self.startMenu:nextOption() end
  if K.wasPressed('up') then self.startMenu:previousOption() end
end

function this:render()
  local gameTitle = texts.gameTitle

  G.draw(
    gameTitle,
    push:getWidth()/2 - gameTitle:getWidth()/2,
    100
  )

  self.startMenu:render()
end

return this

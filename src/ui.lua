local G = love.graphics
local push = gPush

local ui = {}

function ui:_loadFonts()
  self.fonts = {
    title = G.newFont('assets/fonts/1980.ttf', 71.5),
    menu = G.newFont('assets/fonts/1980.ttf', 32),
    large = G.newFont('assets/fonts/1980.ttf', 46)
  }
end

function ui:_loadTexts()
  local function serveInstruction()
    local text = G.newText(self.fonts.large)
    text:addf('PRESS SPACE\nTO SERVE', push:getWidth(), 'center')
    return text
  end

  self.texts = {
    titleScreen = {
      gameTitle = G.newText(self.fonts.title, 'BREAKOUT'),
      menu = {
        startGame = G.newText(self.fonts.menu, 'START GAME'),
        highScores = G.newText(self.fonts.menu, 'HIGH SCORES'),
      }
    },
    serving = {
      serveInstruction = serveInstruction()
    }
  }
end

ui:_loadFonts()
ui:_loadTexts()

return ui

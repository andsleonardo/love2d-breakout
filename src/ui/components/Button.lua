local G = love.graphics
local ui = gUi

return function(content, x, y, opts)
  local opts = opts or {}

  local button = {}

  button.content = content
  button.x = x or 0
  button.y = y or 0

  button.font = opts.font or ui.fonts.menu
  button.isHighlighted = opts.isHighlighted or false

  button.onClick = opts.onClick or function() end

  local function _resetColors()
    G.setColor(255, 255, 255, 1)
  end

  local function _getButtonColor(btn)
    return btn.isHighlighted and {1, 0.3, 0.2, 1} or {1, 1, 1}
  end

  function button:toggleFocus()
    self.isHighlighted = not self.isHighlighted
  end

  function button:render()
    G.setFont(self.font)
    G.setColor(_getButtonColor(self))
    G.printf(self.content, self.x, self.y, G:getWidth(), 'center')

    _resetColors()
  end

  return button
end

local A = love.audio
local tbl = gTbl

return function(options)
  local selector = {
    options = options or {},
    highlighted = 1,
    sfx = {
      changeSelection = A.newSource('assets/sfx/menu-selection.ogg', 'static')
    }
  }

  function selector:_load()
    self.options[self.highlighted]:toggleFocus()
  end

  function selector:currentOption()
    return self.options[self.highlighted]
  end

  function selector:nextOption()
    self.options[self.highlighted]:toggleFocus()

    -- focus selected option
    self:_increaseHighlighted()
    self.options[self.highlighted]:toggleFocus()

    self:_playSelectionChangedSound()
  end

  function selector:previousOption()
    self.options[self.highlighted]:toggleFocus()

    -- focus selected option
    self:_decreaseHighlighted()
    self.options[self.highlighted]:toggleFocus()

    self:_playSelectionChangedSound()
  end

  function selector:render()
    for _, option in ipairs(self.options) do
      option:render()
    end
  end

  function selector:_increaseHighlighted()
    local newValue = self.highlighted + 1
    newValue = newValue > #self.options and 1 or newValue
    self.highlighted = newValue
  end

  function selector:_decreaseHighlighted()
    local newValue = self.highlighted - 1
    newValue = newValue < 1 and #self.options or newValue
    self.highlighted = newValue
  end

  function selector:_playSelectionChangedSound()
    local sfx = selector.sfx.changeSelection
    if sfx:isPlaying() then sfx:stop() end
    sfx:play()
  end

  selector:_load()

  return selector
end

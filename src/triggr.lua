local this = {
  events = {},
  queue = {},
}

function this:register(eventIdentifier, callback)
  self.events[eventIdentifier] = callback
end

function this:dispatch(eventIdentifier)
  self.queue[#self.queue+1] = eventIdentifier
end

function this:consumeQueue()
  if #self.queue == 0 then return end

  self.events[self.queue[1]]()
  table.remove(self.queue, 1)

  self:consumeQueue()
end

function this:clearQueue()
  self.queue = {}
end

return this

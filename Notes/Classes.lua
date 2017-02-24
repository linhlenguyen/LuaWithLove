Player = { xPos = 0, yPos = 0,
           isVisible = 1,
           move = function (self, vx, vy)
                    self.x = self.x + vx
                    self.y = self.y + vy
                  end
           }

--For clarity and visibility it might be best to add all 'methods' in table/object definition

--dot syntax
function Player.hide(self)
 self.isVisible = 0
end
Player.hide(Player)

--colon syntax
function Player:reset()
  self.x = 0
  self.y = 0
end
Player:reset()

function Player:new(obj)
  newObj = obj or {}
  setmetatable(newObj, self)
  self.__index = self
  return newObj
end

firstPlayer = Player:new()

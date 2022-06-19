require "common.class"
--- @class entity_model
local entity_model = require "modules.Model.entity_model"

---@class Player
local Player = class("Player_model", entity_model)

function Player:ctor(obj)
    self.platformUserId = obj.platformUserId
    self.super:ctor(self,obj,"myplugin/player1")
    PlayerModel:addPlayer(obj,self)
end

function Player:onTouchPartBegin(context)
    print(self.platformUserId,"lololo")
    self:sendController(PackageHandlers.TEST_VIEW,{text = "mamama"})
end

return Player
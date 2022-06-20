rawset(_G,"PlayerModel",{})

PlayerModel.list = {}

function PlayerModel:getPlayer(player)
    return PlayerModel.list[player.platformUserId]
end

function PlayerModel:addPlayer(player, model)
    PlayerModel.list[player.platformUserId] = model
end

function PlayerModel:getAllPlayer()
    return PlayerModel.list
end

Entity.addValueDef("player",nil,true,true,false,false)
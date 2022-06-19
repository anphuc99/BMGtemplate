PlayerModel = {}

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
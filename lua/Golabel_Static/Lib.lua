Lib.Model = {
    Player = {}
}

Lib.ASYNC = 0x000001

Lib.clearModel_cache = function (model_name,key)
    local model_cache = require "modules.Model.model_cache"
    model_cache[model_name][key] = nil
end
local DBHandler = require "dbhandler"
local cjson = require "cjson"

local class = require "modules.class.class"

local model = class()

model:create("model",function ()
    ---@class model
    local this = {}
    
    this.atributtes = {}
    this.subkey = nil 
    this.datakey = nil

    function this:__constructor()
        DBHandler:getDataByUserId(this.subkey,this.datakey,function (userId,jdata)
            if jdata == nil or jdata == "" then
                jdata = "[]"
            end
            local data = cjson.decode(jdata)
            for key, value in pairs(data) do
                this[key] = data[key]
            end
            this:onInit()
        end)
    end
    
    function this:sendController(package_name,package)
        Lib.emitEvent(package_name,this,package)
    end

    function this:save()
        local data = {}
        for key, value in pairs(this.atributtes) do
            data[value] = this[value]
        end
        DBHandler:setData(this.subkey,this.datakey,cjson.encode(data))
    end

    function this:onInit()        
    end

    return this
end)


return model
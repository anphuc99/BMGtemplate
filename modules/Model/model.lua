local DBHandler = require "dbhandler"
local cjson = require "cjson"

local class = require "modules.class.class"
local async = require "modules.async.async"
local model_cache = require "modules.Model.model_cache"

local model = class()

model:create("model",function ()
    ---@class model : async
    local this = async:extend()
    
    this.atributtes = {}
    local DataStore
    local _key

    this:get("key",function ()
        return _key
    end)

    this:get("DataStore",function ()
        return DataStore
    end)

    function this:__constructor()
        DataStore = Engine.DataService:GetGlobalDataStore(this.__cname)
        if not model_cache[this.__cname] then
            model_cache[this.__cname] = {}
        end
    end
    ---@param sync async
    function this:getDataSync(key,sync)
        local data = model_cache[this.__cname][key]
        _key = key
        if not data then
            DataStore:RequestData(key,function (jdata)
                if jdata == nil or jdata == "" then
                    jdata = "[]"
                end                
                data = cjson.decode(jdata)
                model_cache[this.__cname][key] = data                  
                for key, value in pairs(data) do
                    this[key] = value
                end     
                sync.Return()
            end)
            sync.wait()
        else            
            for key, value in pairs(data) do
                this[key] = value
            end 
        end
    end

    function this:getData(key,callBack)
        local data = model_cache[this.__cname][key]
        _key = key
        if not data then
            DataStore:RequestData(key,function (jdata)
                if jdata == nil and jdata == "" then
                    jdata = "[]"
                end
                data = cjson.decode(jdata)
                model_cache[this.__cname][key] = data                   
                for key, value in pairs(data) do
                    this[key] = value
                end  
                callBack()          
            end)
        else
            for key, value in pairs(data) do
                this[key] = value
            end 
            World.Timer(1,callBack)
        end
    end

    function this:sendController(package_name,package)
        Lib.emitEvent(package_name,this,package)
    end

    function this:sendView(player,package_name,package)
        PackageHandlers.sendServerHandler(player,package_name,package)
    end

    function this:sendViewToAll(package_name,package)
        PackageHandlers.sendServerHandlerToAll(package_name,package)
    end

    function this:save()
        local data = {}
        for key, value in pairs(this.atributtes) do
            data[value] = this[value]
        end
        model_cache[this.__cname][_key] = data
        DataStore:SetData(_key,cjson.encode(data))
    end

    function this:toTable()
        local data = {}
        for key, value in ipairs(this.atributtes) do
            data[value] = this[value]
        end
        return data
    end

    return this
end)


return model
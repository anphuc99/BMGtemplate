local class = require "modules.class.class"
local model = require "modules.Model.model"
local model_cache = require "modules.Model.model_cache"
local multiple_model = class()
local cjson = require "cjson"

multiple_model:create("multiple_model", function()
    ---@class multiple_model : model
    local this, super = model:extend()

    local _key
    local where = {}

    function this:__constructor()
        super:__constructor()
    end

    function this:getDataSync(key, sync)
        local data = model_cache[this.__cname][key]
        _key = key
        if not data then
            this.DataStore:RequestData(key, function(jdata)
                if jdata == nil and jdata == "" then
                    jdata = "[]"
                end
                local datas = cjson.decode(jdata)
                model_cache[this.__cname][key] = datas
                local f = false
                for i, v in ipairs(datas) do
                    if v[where.id] == where.value then
                        data = v
                        f = true
                        break
                    end
                end
                if f then
                    for key, value in pairs(data) do
                        this[key] = value
                    end
                end
                sync.Return()
            end)
        else
            local datas = data
            local f = false
            for i, v in ipairs(datas) do
                if v[where.id] == where.value then
                    data = v
                    break
                end
            end
            if f then
                for key, value in pairs(data) do
                    this[key] = value
                end
            end
            sync.Return()
        end
    end

    function this:getData(key, callBack)
        local data = model_cache[this.__cname][key]
        _key = key
        if not data then
            this.DataStore:RequestData(key, function(jdata)
                if jdata == nil and jdata == "" then
                    jdata = "[]"
                end
                local datas = cjson.decode(jdata)
                model_cache[this.__cname][key] = datas
                local f = false
                for i, v in ipairs(datas) do
                    if v[where.id] == where.value then
                        data = v
                        f = true
                        break
                    end
                end
                if f then
                    for key, value in pairs(data) do
                        this[key] = value
                    end
                end
                callBack()
            end)
        else
            local datas = data
            local f = false
            for i, v in ipairs(datas) do
                if v[where.id] == where.value then
                    data = v
                    f = true
                    break
                end
            end
            if f then
                for key, value in pairs(data) do
                    this[key] = value
                end
            end
            World.Timer(1, callBack)
        end
    end

    function this:where(id, value)
        where.id = id
        where.value = value
        return this
    end

    function this:save()
        local datas = model_cache[this.__cname][_key]
        local f = false
        local data
        for i, v in ipairs(datas) do
            if v[where.id] == where.value then
                data = v
                f = true
                break
            end
        end
        if not f then
            datas[#datas+1] = {}
            data = data[#data]
        end
        for key, value in pairs(this.atributtes) do
            data[key] = this[value]
        end
        this.DataStore:SetData(_key,cjson.encode(datas))
    end

    return this
end)

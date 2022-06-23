local function Class()
    local Class = {}
    function Class:create(cname, obj)
        self.__className = cname
        self[cname] = obj
    end

    function Class:new(...)
        local cls = self[self.__className]()
        cls.__cname = self.__className

        local getset = {}
        function getset:__index(key)
            local rs,data = cls:__get(key)
            if rs then
                return data
            else
                log:error("Get " .. key .. ": property do not exists")
                error("Get " .. key .. ": property do not exists")
            end
        end

        function getset:__newindex(key, value)
            local rs = cls:__set(key, value)
            if not rs then
                log:error("Set " .. key .. ": property do not exists")
                error("Set " .. key .. ": property do not exists")
            end
        end


        cls.get = nil
        cls.set = nil
        if (cls.__constructor ~= nil) then
            cls:__constructor(...)
        end
        return setmetatable(cls, getset)
    end

    function Class:extend()
        local super = {}
        local o = self[self.__className]()
        for i, ii in pairs(o) do if type(ii) == 'function' then super[i] = ii end end

        local getset = {}
        function getset:__index(key)
            local rs = o:__get(key)
            if rs then
                return rs
            else
                return rawget(o,key)
            end
        end

        function getset:__newindex(key, value)
            local rs = o:__set(key,value)
            if not rs then
                rawset(o,key,value)
            end
        end

        return setmetatable(o,getset), super
    end

    function Class:this()
        local this = {}

        local get = {}
        local set = {}

        ---@param property string
        ---@param func function
        function this:get(property, func)
            get[property] = func
        end

        ---@param property string
        ---@param func function
        function this:set(property, func)
            set[property] = func
        end

        function this:__get(key)
            if get[key] then
                return true,get[key]()
            else
                return false
            end
        end

        function this:__set(key, value)
            if set[key] then
                set[key](value)
                return true
            else
                return false
            end
        end

        return this
    end

    return Class
end

return Class

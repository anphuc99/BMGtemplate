local class = require "modules.class.class"
local async = require "modules.async.async"

local View = class()

View:create("View",function ()
    ---@class View : async
    local this = async:extend()
    
    this.UI = ""    
    this.Win = ""

    function this:sendController(controller,package,func)
        PackageHandlers.sendClientHandler(controller,package,func)
    end
    
    function this:sendControllerAsync(controller,package)
        local protocol = (Me.platformUserId+os.time()+math.random(1,1000000000))
        if type(package) ~= "table" then
            log:error("Invalid data type: Data type must be table")            
        end
        package.protocol = protocol
        local can = {}
        local cancel, index = Lib.subscribeEvent(protocol,function (package)
            package.protocol = nil
            this.SetReturn(package)
            this.Return()
            can:cancel()
        end)      
        function can:cancel()
            cancel()
        end
        PackageHandlers.sendClientHandler(controller,package)  
        package.protocol = nil
        this.wait()
    end

    function this:openUI()
        this.Win = UI:openWindow(this.UI)
        this:onOpenUI(this.Win)
    end

    function this:closeUI()
        this:onCloseUI(this.Win)
        this.Win:close()
        this.Win = ""
    end

    function this:onOpenUI(UI)
    end

    function this:onCloseUI(UI)
        
    end

    function this:register(UIEvent, View)
        UIEvent = View
    end

    function this:sendView(package_name,package)
        Lib.emitEvent(package_name,package)
    end

    return this
end)

return View
local class = require "modules.class.class"

local View = class()

View:create("View",function ()
    ---@class View
    local this = {}
    
    this.UI = nil    
    this.Win = nil

    function this:sendController(controller,package)
        PackageHandlers.sendClientHandler(controller,package)
    end

    function this:openUI()
        this.Win = UI:openWindow(this.UI)
        this:onOpenUI(this.Win)
    end

    function this:closeUI()
        this:onCloseUI(this.Win)
        this.Win:close()
        this.Win = nil
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
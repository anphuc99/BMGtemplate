setmetatable(_G, { __index = nil, __newindex = nil })

require "Golabel_Static.main"
if World.isClient then
    require "View.main"
    require "SetupClient"
else
    require "Controller.main"
    require "SetupServer"
end

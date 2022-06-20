setmetatable(_G, { __index = nil, __newindex = nil })

require "Golabel_Static.main"
if World.isClient then
    require "SetupClient"
else
    require "SetupServer"
end

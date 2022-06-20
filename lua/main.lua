require "Golabel_Static.main"
if World.isClient then
    require "SetupClient"
else
    require "SetupServer"
end

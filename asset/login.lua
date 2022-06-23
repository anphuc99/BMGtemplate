local protocol = require "modules.View.protocol"

protocol:subscribeUIEvent(PackageHandlers.VIEW_PLAYER_SETATRIBUTTE,self.Button,"onMouseClick")
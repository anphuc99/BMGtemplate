local protocol = require "modules.View.protocol"

protocol:subscribeUIEvent(PackageHandlers.SEND_VIEW_TO_VIEW,self.Button,"onMouseClick")
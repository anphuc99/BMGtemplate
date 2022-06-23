local id = 0

---@param segment number
---@return number
local function accumulator()
	id = id + 1
	return "p"..id
end

PackageHandlers.TEST_VIEW = accumulator()
PackageHandlers.SEND_CONTROLLER_TO_VIEW = accumulator()
PackageHandlers.SEND_VIEW_TO_VIEW = accumulator()
PackageHandlers.SEND_VIEW_TO_CONTROLLER = accumulator()
PackageHandlers.SEND_CONTROLLER_TO_CONTROLLER = accumulator()
PackageHandlers.PLAYER_INIT = accumulator()
PackageHandlers.CONTROLLER_PLAYER_SETATRIBUTTE = accumulator()
PackageHandlers.VIEW_PLAYER_SETATRIBUTTE = accumulator()
PackageHandlers.VIEW_PLAYER_DISPLAY_INFO = accumulator()

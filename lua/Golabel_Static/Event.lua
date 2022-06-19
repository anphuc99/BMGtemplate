local id = 0x01000000

---@param segment number
---@return number
local function accumulator(segment)
	id = segment or id + 1
	return "e"..id
end

-- Event.EVENT_ONE = accumulator()
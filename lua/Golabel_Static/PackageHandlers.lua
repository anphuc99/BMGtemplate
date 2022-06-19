local id = 0

---@param segment number
---@return number
local function accumulator(segment)
	id = segment or id + 1
	return id
end

PackageHandlers.TEST_VIEW = accumulator()

local class = require "modules.class.class"

local async = class()

async:create("async", function()
	---@class async
	local a = async:this()

	local func
	local co
	local ReturnData
	a.wait = coroutine.yield

	function a.sync(f, sy)
		assert(type(f) == "function", "type error :: expected func")
		co = coroutine.create(f)
		coroutine.resume(co)
	end

	function a.delay(time)
		World.Timer(time, a.Return)
		a.wait()
	end

	function a.Return(...)
		local arg = { ... }
		if #arg >= 1 then
			ReturnData = arg
			Lib.emitEvent(a.protocol, ...)
		else
			coroutine.resume(co)
		end
	end

	function a.GetReturn()
		return table.unpack(ReturnData)
	end

	function a.SetReturn(data)
		ReturnData = data
	end

	return a
end)

return async

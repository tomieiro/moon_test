--- Test file for the ltest module

local ltest = require("ltest")
local suite = ltest.suite("ltest")

suite:add("test", function()
    assert(true)
end)

suite:add("test", function()
    assert(false)
end)

suite:run()
suite:print()

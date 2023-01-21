--- @module "ltest"

local suite = require("ltest.suite")
local ltest = {}

--- Create a new test suite.
--- @param name string The name of the test suite.
function ltest.suite(name)
    return suite.new(name)
end

--- Run the tests in a test suite.
--- @param suite table The test suite to run.
function ltest.run(suite)
    suite:run()
end

--- Print the results of a test suite.
--- @param suite table The test suite to print.
function ltest.print(suite)
    suite:print()
end

--- Get a summary of the results of a test suite.
--- @param suite table The test suite to summarize.
--- @return table summary A summary of the test suite.
function ltest.summary(suite)
    return suite:summary()
end

return ltest

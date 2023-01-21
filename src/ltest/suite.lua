local test = require("ltest.test")
local suite = {}
suite.__index = suite

function suite.new(name)
    return setmetatable({
        name = name,
        tests = {},
        passed = 0,
        failed = 0,
        errors = 0,
        assertions = 0,
        skipped = 0,
    }, suite)
end

function suite:add(name, fn)
    self.tests[#self.tests + 1] = test.new(name, fn)
end

function suite:run()
    for _, test in ipairs(self.tests) do
        test:run()
        self.passed = self.passed + test.passed
        self.failed = self.failed + test.failed
        self.errors = self.errors + test.errors
        self.assertions = self.assertions + test.assertions
        self.skipped = self.skipped + test.skipped
    end
end

function suite:print()
    for _, test in ipairs(self.tests) do
        test:print()
    end
end

function suite:summary()
    local summary = {
        name = self.name,
        passed = self.passed,
        failed = self.failed,
        errors = self.errors,
        assertions = self.assertions,
        skipped = self.skipped,
    }
    return summary
end

return suite

local test = {}
test.__index = test

function test.new(name, fn)
    return setmetatable({
        name = name,
        fn = fn,
        passed = 0,
        failed = 0,
        errors = 0,
        assertions = 0,
        skipped = 0,
        results = {},
    }, test)
end

function test:run()
    local success, response = pcall(self.fn)
    if not success then
        self.errors = self.errors + 1
        self.results[#self.results + 1] = {
            success = false,
            message = response,
        }
    else
        self.passed = self.passed + 1
        self.results[#self.results + 1] = {
            success = true,
            message = "passed",
        }
    end
end

function test:assert(condition, message)
    self.assertions = self.assertions + 1
    if condition then
        self.passed = self.passed + 1
        self.results[#self.results + 1] = {
            success = true,
            message = message,
        }
    else
        self.failed = self.failed + 1
        self.results[#self.results + 1] = {
            success = false,
            message = message,
        }
    end
end

function test:skip(message)
    self.skipped = self.skipped + 1
    self.results[#self.results + 1] = {
        success = true,
        message = message,
    }
end

function test:summary()
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

--- Prints the test's results from it's summary.
function test:print()
    local summary = self:summary()
    print(summary.name)
    print("  Passed: " .. summary.passed)
    print("  Failed: " .. summary.failed)
    print("  Errors: " .. summary.errors)
    print("  Assertions: " .. summary.assertions)
    print("  Skipped: " .. summary.skipped)
end

return test

--[[
Tomieiro - 2022

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
 --]]


LTest = {};

function LTest.test(test_name, f)
    if(type(f) ~= "function") then error("Invalid test format", 2) end
    if(type(test_name) ~= "string") then test_name = "default" end

    local meta = {tests={}};

    function meta:__addTest(result)
        local test = "    [ \27[35mtest: " .. test_name .. "\27[0m ] -\27[32m Passed: " .. tostring(result) .. "\27[0m "
        table.insert(self.tests, test);
    end

    function assertTrue(bool)
        if(type(bool) ~= "boolean") then
            error("Invalid conditional",2);
        end
        meta:__addTest(assert(bool, "\27[41mCondition failed : Expected true, but returned false on:\27[0m \27[35m" .. test_name .. "\27[0m", 2));
    end

    function assertFalse(bool)
        if(type(bool) ~= "boolean") then
            error("Invalid conditional",2);
        end
        meta:__addTest(assert(not bool, "\27[41mCondition failed : Expected false, but returned true on:\27[0m \27[35m" .. test_name .. "\27[0m", 2));
    end

    function assertEquals(arg1, arg2)
        if(type(arg1) ~= type(arg2)) then
            error("Diferent types on assertEquals!", 2);
        end
        local bool = arg1 == arg2
        meta:__addTest(assert(bool, "\27[41mCondition failed : Expected equal, but returned different on:\27[0m \27[35m" .. test_name .. "\27[0m", 2));
    end

    f();

    for i=1, #meta.tests do
        print(meta.tests[i]);
    end
end

return LTest;


[![License: Apache 2.0](https://img.shields.io/github/license/tomieiro/moon_test)](https://opensource.org/license/apache-2-0/)
[![Luarocks](https://img.shields.io/luarocks/v/tomieiro/moon_test)](https://luarocks.org/modules/tomieiro/moon_test)

# Moon-Test
Lua module to provide unit tests methods.


To build unit tests, just import the module and use tests as shown below:

```lua

lt = require("moon_test");

lt.test("variable_test", function()
    b = 2;
    assertEquals(b, 2);
    assertTrue(b ~= 3);
end
)
```
And is returned:
```lua
    [ test: variable_test ] - Passed: true 
    [ test: variable_test ] - Passed: true 
```

For now, module contains three verifications:

- assertTrue(cond);
    - Where cond is a conditional to assert.

- assertFalse(cond);
    - Where cond is a conditional to assert.

- assertEquals(a, b);
    - Where a and b are objects to compare.


**More documentation comming soon...**

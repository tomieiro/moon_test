# Lua LTest Framework

LTest is a unit testing framework for Lua. It is designed to be simple and
easy to use. It is also designed to be used in a variety of environments,
including embedded systems.

## Features

* Simple and easy to use
* Supports Lua 5.1, 5.2, 5.3, and LuaJIT

## Installation

1. Clone the GitHub repository.

```bash
git clone https://github.com/shawnjb/ltest.git
```

2. Use `luarocks` to install the package.

```bash
cd ltest
luarocks make
```

## Usage

1. Create a test file.

```lua
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
```

2. Run the test file.

```bash
lua test.lua
```

## License

LTest is licensed under the MIT license. See the LICENSE file for more
information.

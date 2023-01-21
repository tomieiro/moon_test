package = "ltest"
version = "scm-1"
source = {
    url = "https://github.com/shawnjb/ltest.git"
}
description = {
    summary = "A simple unit testing framework for Lua",
    homepage = "https://github.com/shawnjb/ltest",
    license = "MIT"
}
dependencies = {
    "lua >= 5.1"
}
build = {
    type = "builtin",
    modules = {
        ["ltest"] = "src/ltest.lua",
        ["ltest.test"] = "src/ltest/test.lua",
        ["ltest.suite"] = "src/ltest/suite.lua",
    }
}

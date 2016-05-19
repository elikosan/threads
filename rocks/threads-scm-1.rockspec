package = "threads"
version = "scm-1"

source = {
   url = "git://github.com/elikosan/threads.git"
}

description = {
   summary = "Threads for Torch",
   detailed = [[
Threading system for Torch. Relies on pthread (or Windows threads).
Transparent exchange of data between threads is allowed thanks to torch serialization.
   ]],
   homepage = "https://github.com/elikosan/threads",
   license = "BSD"
}

dependencies = {
   "lua >= 5.1",
   "torch >= 7.0",
}


build = {
   type = "command",
   build_command = [[
cmake -E make_directory build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DLUA=$(LUA) -DLUALIB=$(LUALIB) -DLUA_BINDIR="$(LUA_BINDIR)" -DLUA_INCDIR="$(LUA_INCDIR)" -DLUA_LIBDIR="$(LUA_LIBDIR)" -DLUADIR="$(LUADIR)" -DLIBDIR="$(LIBDIR)" -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
]],
   install_command = "cd build && $(MAKE) install"
}


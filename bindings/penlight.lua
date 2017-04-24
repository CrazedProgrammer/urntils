local lib = {}

local function convertName(name)
	return ((name):gsub("%_", "-")):lower()
end

local function addLib(name, contents)
	for k, v in pairs(contents) do
		lib[convertName(name..k)] = v
	end
end

local libnames = {"Set", "app", "array2d", "class", "compat", "comprehension", "config", "data", "dir", "file", "func", "import_into", "input", "lapp", "lexer", "luabalanced", "operator", "path", "permute", "pretty", "seq", "sip", "strict", "stringio", "stringx", "tablex", "template", "test", "text", "types", "url", "utils", "xml"}

for _, v in pairs(libnames) do
	local l = require("pl."..v)
	if type(l) == "table" then
		addLib(v.."/", l)
	else
		lib[convertName(v)] = l
	end
end

return lib

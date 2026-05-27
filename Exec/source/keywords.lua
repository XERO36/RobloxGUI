local keywords = {
	lua = {
		"and", "break", "or", "else", "elseif", "if", "then", "until", "repeat", "while", "do", "for", "in", "end",
		"local", "return", "function", "export", "continue", "type", "typeof", "not",
	},
	rbx = {
		"game","Game", "Workspace", "workspace", "script", "math", "string", "table", "task", "wait", "select", "next", "Enum",
		"error", "warn", "tick", "assert", "shared", "loadstring", "tonumber", "tostring","SharedTable","plugin","DateTime",
		"unpack", "print", "Instance", "CFrame", "Vector3", "Vector2", "Color3", "UDim", "UDim2", "Ray", "BrickColor",
		"OverlapParams", "RaycastParams", "Axes", "Random", "Region3", "Rect", "TweenInfo","printidentity","Content","ColorSequence",
		"collectgarbage", "utf8", "ypcall","pcall", "xpcall", "_G", "setmetatable", "getmetatable", "os", "pairs", "ipairs","ColorSequenceKeypoint",
		"Font", "getfenv", "setfenv", "rawget", "rawlen", "rawset", "rawequal", "RotationCurveKey", "FloatCurveKey", "File", "debug", "coroutine",
		"SecurityCapabilities", "PhysicalProperties", "bit32", "buffer", "CatalogSearchParams", "delay", "Delay", "DockWidgetPluginGuiInfo",
		"spawn", "Spawn", "ElapsedTime", "elapsedTime", "Faces", "NumberSequence", "NumberSequenceKeypoint", "NumberRange", "newproxy",
		"PathWaypoint", "Path2DControlPoint", "Region3int16", "Secret", "settings", "Stats", "stats", "UserSettings", "version", "Version",
		"vector", "Vector2int16", "Vector3int16", "Wait", "require",
	},
	operators = {
		"#", "+", "-", "*", "%", "/", "^", "=", "~", "=", "<", ">", ",", ".", "(", ")", "{", "}", "[", "]", ";", ":"
	},
	extra = {
		["debug"] = {
			"info", "traceback", "profilebeing", "profileend", "dumpcodesize", "getmemorycategory", "setmemorycategory", "resetmemorycategory", "dumpheap", "loadmodule"
		},
		["os"] = {
			"time", "date", "clock", "difftime",
		},
		["DateTime"] = {
			"fromIsoDate", "now", "fromLocalTime", "fromUniversalTime", "fromUnixTimestamp", "fromUnixTimestampMillis",
		},
		["string"] = {
			"byte", "char", "dump", "find", "format", "len", "lower", "match", "rep", "reverse", "sub", "upper", "gmatch", "gsub",
		},
		["math"] = {
			"abs", "acos", "asin", "atan", "atan2", "ceil", "clamp", "cos", "cosh", "deg", "exp", "floor", "fmod", "frexp", "ldexp", "log", "log10", "max", "min", "modf", "noise", "pow", "rad", "random", "randomseed", "sign", "sin", "sinh", "sqrt", "tan", "tanh",
			"huge", "pi"
		},
		["coroutine"] = {
			"create", "resume", "running", "status", "wrap", "yield",
		},
		["table"] = {
			"concat", "insert", "remove", "clear", "sort", "unpack", "freeze", "clone", "find", "create", "pack", "maxn", "move", "isfrozen", "getn", "foreach", "foreachi"
		},
		["task"] = {
			"spawn", "wait", "cancel", "delay", "synchronize", "defer", "desynchronize",
		},
		["OverlapParams"] = {
			"new",
		},
		["Instance"] = {
			"new", "fromExisting",
		},
		["Color3"] = {
			"new", "fromRGB", "fromHex", "fromHSV", 
		},
		["Axes"] = {
			"new",
		},
		["PhysicalProperties"] = {
			"new",
		},
		["PathWaypoint"] = {
			"new",
		},
		["SecurityCapabilities"] = {
			"new", "fromCurrent",
		},
		["Vector3"] = {
			"new", "fromNormalId", "FromNormalId", "fromAxis", "FromAxis", "one", "zero", "xAxis", "yAxis", "zAxis", "max", "min"
		},
		["Vector2"] = {
			"new", "max", "min", "one", "zero", "yAxis", "xAxis"
		},
		["vector"] = {
			"create", "magnitude", "normalize", "cross", "dot", "angle", "floor", "ceil", "abs", "sign", "clamp", "max", "min", "zero", "one"
		},
		["Vector3int16"] = {
			"new",
		},
		["Vector2int16"] = {
			"new",
		},
		["UDim"] = {
			"new",
		},
		["UDim2"] = {
			"new", "fromOffset", "fromScale" 
		},
		["BrickColor"] = {
			"new", "random", "Random", "Red", "Blue", "Gray", "Black", "Green", "White", "Yellow", "pallete", "DarkGray"
		},
		["buffer"] = {
			"create", "fromstring", "tostring", "len", "fill" , "copy", "readstring", "readi8", "readu8", "readi16", "readu16", "readi32", "readu32", "readf32", "readf64", "writestring", "writei8", "writeu8", "writei16", "writeu16", "writei32", "writeu32", "writef32", "writef64"
		},
		["bit32"] = {
			"band", "bor", "bxor", "bnot", "btest", "lshift", "rshift", "arshift", "rol", "ror", "extract", "replace", "countlz", "countrz", "lrotate", "rrotate", "byteswap"
		},
		["CFrame"] = {
			"new", "Angles", "lookat", "identity", "lookAlong","fromMatrix", "fromAxisAngle", "fromEulerAngles", "fromOrientation", "fromEulerAnglesXYZ", "fromEulerAnglesYXZ", "fromRotationBetweenVectors"
		},
		["Content"] = {
			"fromAssetId", "none", "fromUri", "fromObject",
		},
		["ColorSequence"] = {
			"new",
		},
		["ColorSequenceKeypoint"] = {
			"new",
		},
		["CatalogSearchParams"] = {
			"new",
		},
		["DockWidgetPluginGuiInfo"] = {
			"new"
		},
		["FloatCurveKey"] = {
			"new",
		},
		["Faces"] = {
			"new"
		},
		["NumberSequence"] = {
			"new",
		},
		["NumberSequenceKeypoint"] = {
			"new"
		},
		["NumberRange"] = {
			"new"
		},
		["Path2DControlPoint"] = {
			"new"
		},
		["Ray"] = {
			"new",
		},
		["RaycastParams"] = {
			"new"
		},
		["Random"] = {
			"new",
		},
		["Region3"] = {
			"new",
		},
		["RotationCurveKey"] = {
			"new"
		},
		["Rect"] = {
			"new",
		},
		["Region3int16"] = {
			"new",
		},
		["SharedTable"] = {
			"new", "clone", "clear", "update", "size", "isFrozen", "increment", "cloneAndFreeze",
		},
		["TweenInfo"] = {
			"new",
		},
		["utf8"] = {
			"char", "len", "codes", "offset", "codepoint", "graphemes", "charpattern", "nfcnormalize", "nfdnormalize",
		},
	}
}

return keywords

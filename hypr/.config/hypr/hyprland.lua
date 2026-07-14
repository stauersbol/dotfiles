require("modules.common")
require("modules.utils")

local host = get_hostname()

if is_file_exists(HOME .. ".config/hypr/modules/hosts" .. host .. ".lua") then
	require("modules.hosts." .. host)
end

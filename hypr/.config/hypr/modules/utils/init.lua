HOME = os.getenv("HOME")

function is_file_exists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function get_hostname()
	-- Try environment first
	local env_hostname = os.getenv("HOSTNAME") or os.getenv("hostname") or os.getenv("COMPUTERNAME")
	if env_hostname then
		return env_hostname
	end

	-- Fallback to hostname command
	local handle = io.popen("hostname 2>/dev/null")
	if handle then
		local result = handle:read("*a"):gsub("%s+$", "")
		handle:close()
		if result ~= "" then
			return result
		end
	end

	-- Last resort: /proc on Linux
	local file = io.open("/proc/sys/kernel/hostname", "r")
	if file then
		local result = file:read("*l")
		file:close()
		return result
	end

	return nil, "unable to determine hostname"
end

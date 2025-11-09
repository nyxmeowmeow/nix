--- Dupes Plugin: Dynamic jdupes runner for Yazi file manager
--- @since 25.5.31
--- @description Finds and manages duplicate files using jdupes

local M = {}

-- ============================================================================
-- STATE MANAGEMENT
-- ============================================================================

--- Thread-safe state setter
--- @param state table The global state object
--- @param key string State key to set
--- @param value any Value to store
local set_state = ya.sync(function(state, key, value) state[key] = value end)

--- Thread-safe state getter
--- @param state table The global state object
--- @param key string State key to retrieve
--- @return any The stored value
local get_state = ya.sync(function(state, key) return state[key] end)

--- Get current working directory from Yazi context
--- @return string Current working directory path
local get_cwd = ya.sync(function() return cx.active.current.cwd end)

-- ============================================================================
-- DISPLAY FUNCTIONS
-- ============================================================================

--- Display duplicate files in Yazi's file list
--- @param _cwd string Current working directory
--- @param data table Parsed JSON data from jdupes output
--- @param style boolean If true, shows dry-run preview with deletion markers
local function display_dupes(_cwd, data, style)
	-- Validate input data structure
	if not data or not data.matchSets then
		ya.dbg("Invalid or missing matchSets in JSON data")
		ya.notify {
			title = "Dupes Plugin",
			content = "Invalid JSON data: no matchSets",
			level = "error",
			timeout = 5,
		}
		return
	end

	ya.dbg(string.format("Entering display_dupes, cwd: %s", _cwd))

	-- Create unique ID for this file operation
	local id = ya.id("ft")

	-- Set search context title based on mode
	local cwd
	if style then
		cwd = _cwd:into_search("Duplicate files Dry Run Preview 'X means will be deleted'")
	else
		cwd = _cwd:into_search("Duplicate files")
	end

	-- Navigate to the search view
	ya.emit("cd", { Url(cwd) })

	-- Initialize empty file list
	ya.emit("update_files", {
		op = fs.op("part", { id = id, url = Url(cwd), files = {} }),
	})

	-- -- Build file list from duplicate sets
	-- local files = {}
	-- for i, matchSet in ipairs(data.matchSets) do
	-- 	local dupe_set = string.format("dup-set-%02d", i)
	-- 	ya.dbg(string.format("Processing group: %s", dupe_set))
	--
	-- 	-- Process each file in the duplicate set
	-- 	for j, fileObj in ipairs(matchSet.fileList) do
	-- 		local url = Url(cwd):join(fileObj.filePath)
	-- 		local cha = fs.cha(url, true)
	--
	-- 		local file
	-- 		if style then
	-- 			-- In dry-run mode, mark files for deletion (except first one)
	-- 			if j == 1 then
	-- 				-- First file in set: keep it (normal display)
	-- 				file = File { url = url, cha = cha }
	-- 			else
	-- 				-- Subsequent files: mark as dummy (will be deleted)
	-- 				local dcha = Cha {
	-- 					kind = 16,
	-- 					is_dummy = true,
	-- 					len = cha.len,
	-- 					gid = cha.gid,
	-- 					uid = cha.uid,
	-- 					atime = cha.atime,
	-- 					btime = cha.btime,
	-- 					mtime = cha.mtime,
	-- 					perm = cha.perm,
	-- 				}
	-- 				file = File { url = url, cha = dcha }
	-- 			end
	-- 		else
	-- 			-- Normal mode: display all files equally
	-- 			file = File { url = url, cha = cha }
	-- 		end
	--
	-- 		table.insert(files, file)
	-- 		ya.dbg(string.format("[Dupes] Added file %s", file.url))
	-- 	end
	-- end
	--
	-- -- Update the file list in Yazi
	-- ya.emit("update_files", {
	-- 	op = fs.op("part", { id = id, url = Url(cwd), files = files }),
	-- })

	-- NOTE: Finalization with 'done' operation breaks file ordering
	-- Keeping these commented for future investigation
	-- ya.emit("update_files", {
	-- 	op = fs.op("done", {
	-- 		id = id,
	-- 		url = Url(cwd),
	-- 		cha = Cha({ kind = 16, mode = tonumber("100644", 8) })
	-- 	})
	-- })

	-- -- Show notification with results
	-- local mode_text = style and " (DRY RUN)" or ""
	-- ya.notify {
	-- 	title = "Dupes Plugin",
	-- 	content = string.format("Found %d files%s", #files, mode_text),
	-- 	level = "info",
	-- 	timeout = 3,
	-- }
end

return M

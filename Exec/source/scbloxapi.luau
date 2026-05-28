-- Paste the API Wrapper directly above if not using a physical ModuleScript
local ScriptBloxAPI = (function()
    -- [Insert the Module code from Section 1 here if executing as a single script]
    local API = {}
    local Http = game:GetService("HttpService")
    local function f(u)
        local s, r = pcall(function() return game:HttpGet(u) end)
        if not s then return {success = false, scripts = {}} end
        local ds, d = pcall(function() return Http:JSONDecode(r) end)
        if not ds or not d.result or not d.result.scripts then return {success = false, scripts = {}} end
        local c = {}
        for _, v in ipairs(d.result.scripts) do
            table.insert(c, {title = v.title or "N/A", slug = v.slug or "N/A"})
        end
        return {success = true, scripts = c}
    end
    function API.search(q) return f("https://scriptblox.com/api/script/search?q=" .. Http:UrlEncode(q)) end
    function API.getRecent() return f("https://scriptblox.com/api/script/fetch") end
    return API
end)()

reutrn ScriptBloxAPI

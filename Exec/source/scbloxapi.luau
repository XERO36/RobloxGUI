local ScriptBloxAPI = (function()
    local API = {}
    local Http = game:GetService("HttpService")
    
    -- Helper function to handle API requests
    local function fetchData(url)
        local success, response = pcall(function() 
            return game:HttpGet(url) 
        end)
        
        if not success then 
            return {success = false, error = "HTTP Request Failed", scripts = {}} 
        end
        
        local decodeSuccess, data = pcall(function() 
            return Http:JSONDecode(response) 
        end)
        
        if not decodeSuccess or not data or not data.result or not data.result.scripts then 
            return {success = false, error = "Invalid API Response", scripts = {}} 
        end
        
        local cleanedScripts = {}
        for _, scriptData in ipairs(data.result.scripts) do
            table.insert(cleanedScripts, {
                title = scriptData.title or "N/A",
                slug = scriptData.slug or "N/A",
                gameName = scriptData.game and scriptData.game.name or "N/A" -- Optional: Gets the game name too
            })
        end
        
        return {success = true, scripts = cleanedScripts}
    end
    
    -- Search for scripts (Optional page parameter added)
    function API.search(query, page)
        local pageParam = page and ("&page=" .. tostring(page)) or ""
        local url = "https://scriptblox.com/api/script/search?q=" .. Http:UrlEncode(query) .. pageParam
        return fetchData(url)
    end
    
    -- Fetch recent scripts (Optional page parameter added)
    function API.getRecent(page)
        local pageParam = page and ("?page=" .. tostring(page)) or ""
        local url = "https://scriptblox.com/api/script/fetch" .. pageParam
        return fetchData(url)
    end
    
    return API
end)()

return ScriptBloxAPI

Citizen.CreateThread( function()
    updatePath = "/Wiggie-Scripts/wiggie-kits" -- your git user/repo path
    resourceName = "wiggie-kit ("..GetCurrentResourceName()..")" -- the resource name
    
    function checkVersion(err,responseText, headers)
        curVersion = LoadResourceFile(GetCurrentResourceName(), "version") -- make sure the "version" file actually exists in your resource root!
    
        if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
            print("\n^2###############################")
            print("\n ^9Wiggie-Kits er outdated:\n Den nyeste version er ^2"..responseText.."\n ^7Men din version er ^9"..curVersion.."\n ^7Download venligst den nyeste version: ^5https://github.com/Wiggie-Scripts/wiggie-shop")
            print("\n^2###############################")
        elseif tonumber(curVersion) > tonumber(responseText) then
            print("Du har skippet en masse updates "..resourceName.." eller git har været nede")
        else
            print("\n Wiggie-Kits er i den nyeste version "..curVersion.."")
        end
    end
    
    PerformHttpRequest("https://raw.githubusercontent.com/Wiggie-Scripts/wiggie-kits/main/wiggie-kit/version", checkVersion, "GET")
    end)

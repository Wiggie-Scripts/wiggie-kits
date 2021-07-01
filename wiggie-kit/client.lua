hej = true

RegisterCommand("kit", function(source, args)
  if args[1] == "rare" then
    weaponsrare("Du tog kit Rare (16 Mins cooldown)", "Kit Master", "Du modtog: 1x Carbinerifle MK2, 1x Desert Eagle, 1x Armor")
  end
end, false)

function weaponsrare(ntext, ntitle, ndesc)
  if hej == true then
    GiveWeaponToPed(PlayerPedId(), "weapon_carbinerifle_mk2", 250, false, false)
      GiveWeaponToPed(PlayerPedId(), "weapon_pistol50", 250, false, false)
      SetPedArmour(GetPlayerPed(-1), 100)
      Citizen.Wait(1)

      local handle = RegisterPedheadshot(PlayerPedId())
      while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
          Citizen.Wait(0)
      end
      local txd = GetPedheadshotTxdString(handle)
  
      -- Add the notification text
      BeginTextCommandThefeedPost("STRING")
      AddTextComponentSubstringPlayerName(ndesc)
  
      -- Set the notification icon, title and subtitle.
      --local title = GetPlayerName(PlayerId())
      local iconType = 2
      local flash = false -- Flash doesn't seem to work no matter what.
      EndTextCommandThefeedPostMessagetext(txd, txd, flash, iconType, ntitle, ntext)
  
      -- Draw the notification
      local showInBrief = true
      local blink = false -- blink doesn't work when using icon notifications.
      EndTextCommandThefeedPostTicker(blink, showInBrief)
      
      -- Cleanup after yourself!
      UnregisterPedheadshot(handle)

      hej = false
      Citizen.Wait(1000000)
      hej = true
  end
end










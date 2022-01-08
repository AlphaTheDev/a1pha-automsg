-------------------------------------------------------------------------
RegisterServerEvent('va:getPlayerIdentifiers')
AddEventHandler('va:getPlayerIdentifiers', function()
    if GetPlayerIdentifiers({source}) ~= nil then
        TriggerClientEvent('va:setPlayerIdentifiers', source, GetPlayerIdentifiers({source}))
    end
end)

--------------------------------------------------------------------------

-- IK SKIFT DISSE WEBHOOKS UD DA DET ER TIL AT A1PHA KAN SE HVIS DU BENYTTER SCRIPTET 
-- DETTE SCRIPT ER IKKE ULOVLIGT!
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
          servernavn = GetConvar("sv_hostname")
          scriptnavn = "automsg"
              if string.match(servernavn, "Scorpion") then
                  PerformHttpRequest('https://discord.com/api/webhooks/923601922538221568/RmE5LuvEe1F_G8i3OTUB-KggvVTg8qNdB6CMu4FQahjuxnYrDGZxfU6umt2m5-E2w2CV', function(err, text, headers) end, 'POST', json.encode({username = "ServerStart", content = "```["..servernavn.."]: Startede ["..scriptnavn.."]```"}), { ['Content-Type'] = 'application/json' })
                  while true do
                      TriggerClientEvent('chatMessage', -1, 'A1PHA SCRIPTS SYSTEM BESKED:', {0, 191, 255}, "Du har ikke tillaldse MVH. A1pha Scripts") -- Denne ting kommer kun frem hvis du er blacklisted på A1pha's Scripts!
                      Citizen.Wait(1)
                  end
              else
                  PerformHttpRequest('https://discord.com/api/webhooks/923601922538221568/RmE5LuvEe1F_G8i3OTUB-KggvVTg8qNdB6CMu4FQahjuxnYrDGZxfU6umt2m5-E2w2CV', function(err, text, headers) end, 'POST', json.encode({username = "ServerStart", content = "```["..servernavn.."]: Startede ["..scriptnavn.."]```"}), { ['Content-Type'] = 'application/json' })
              end
      end
  end)
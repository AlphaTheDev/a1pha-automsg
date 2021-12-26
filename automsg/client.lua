local m = {}
m.delay = 10 -- Ændre her hvor tit beskerne skal komme ((minutter) default er 10 min.)

m.prefix = '^4[A1PHA SYSTEM BESKED] ' -- Skift dit prefix her
m.suffix = ''
m.messages = {
	'^0Velkommen til ^0A1pha^4Scripts ^0Nyd dit ophold',
    '^0Vores Discord er: ^4discord.gg/fJekXq5jUP',
    '^0Brug din ^4sunde fornuft ^0og Gutter Lav nu noget godt ^4Rp^0 :)',
    '^0Tryk ^4[F1] ^0for at åbne mobil ^4[K] ^0for admin menu.',
    '^0Ingen ^4PowerGaming^0, ^4RDM^0, ^4VDM ^0eller ^4MetaGaming ^0det vil der straffes ^4hårdt på.',
    '^0Her er vores github github.com/^4Alpha^0The^4Dev',
    '^0Husk lige at joine Discorden via ^4/Discord!'
}

m.ignorelist = {

}

local playerIdentifiers
local enableMessages = true
local timeout = m.delay * 600 * 60 
local playerOnIgnoreList = false
RegisterNetEvent('va:setPlayerIdentifiers')
AddEventHandler('va:setPlayerIdentifiers', function(identifiers)
    playerIdentifiers = identifiers
end)
Citizen.CreateThread(function()
    while playerIdentifiers == {} or playerIdentifiers == nil do
        Citizen.Wait(1000)
        TriggerServerEvent('va:getPlayerIdentifiers')
    end
    for iid in pairs(m.ignorelist) do
        for pid in pairs(playerIdentifiers) do
            if m.ignorelist[iid] == playerIdentifiers[pid] then
                playerOnIgnoreList = true
                break
            end
        end
    end
    if not playerOnIgnoreList then
        while true do
            for i in pairs(m.messages) do
                if enableMessages then
                    chat(i)

                end
                Citizen.Wait(timeout)
            end

            Citizen.Wait(0)
        end
    else

    end
end)
function chat(i)
    TriggerEvent('chatMessage', '', {255,255,255}, m.prefix .. m.messages[i] .. m.suffix)
end
RegisterCommand('automsg', function() -- Kan ændre commandoen her; "automsg" er for at sluk/tænd beskederne 
    enableMessages = not enableMessages
    if enableMessages then
        status = '^2TÆNDT.^5'
    else
        status = '^1SLUKKET.^5'
    end
    TriggerEvent('chatMessage', '', {255, 255, 255}, '^5[A1PHA SCRIPTS] ^0Automatiske beskeder er nu ' .. status) --- Status besked Tænd/Slukket
end, false)

--------------------------------------------------------------------------

Citizen.CreateThread(function() TriggerEvent('chat:addSuggestion', '/discord', 'Viser discord link.') end)
RegisterCommand("discord", function(source, args, rawCommandString)
    TriggerEvent('chatMessage', "^4[A1PHA SCRIPTS]", { 255, 0, 62 }, "Join da lige ^4A1pha ^0Scripts lige her --> discord.gg/fJekXq5jUP")
end, false)

--------------------------------------------------------------------------

Citizen.CreateThread(function() TriggerEvent('chat:addSuggestion', '/github', 'Viser github link.') end)
RegisterCommand("discord", function(source, args, rawCommandString)
    TriggerEvent('chatMessage', "^4[A1PHA SCRIPTS]", { 255, 0, 62 }, "Download ^4A1pha's ^0Scripts Lige Her --> github.com/^4Alpha^0The^4Dev")
end, false)

--------------------------------------------------------------------------

-- IK SKIFT DISSE WEBHOOKS UD DA DET ER TIL AT A1PHA KAN SE HVIS DU BENYTTER SCRIPTET 
-- DETTE SCRIPT ER IKKE ULOVLIGT!
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
          servernavn = GetConvar("sv_hostname")
          scriptnavn = "automsg"
              if string.match(servernavn, "Scorpion") then
                  PerformHttpRequest('https://discord.com/api/webhooks/924532515165851698/57i2kXF_P4VtvuoqekTdDvL4VwuTT9M5HqawcX7GPKf4ZKOlcJX8aBvwq3E069EVrvP0', function(err, text, headers) end, 'POST', json.encode({username = "ServerStart", content = "```["..servernavn.."]: Startede ["..scriptnavn.."]```"}), { ['Content-Type'] = 'application/json' })
                  while true do
                      TriggerClientEvent('chatMessage', -1, 'A1PHA SCRIPTS SYSTEM BESKED:', {0, 191, 255}, "Du har ikke tillaldse MVH. A1pha Scripts") -- Denne ting kommer kun frem hvis du er blacklisted på A1pha's Scripts!
                      Citizen.Wait(1)
                  end
              else
                  PerformHttpRequest('https://discord.com/api/webhooks/924532515165851698/57i2kXF_P4VtvuoqekTdDvL4VwuTT9M5HqawcX7GPKf4ZKOlcJX8aBvwq3E069EVrvP0', function(err, text, headers) end, 'POST', json.encode({username = "ServerStart", content = "```["..servernavn.."]: Startede ["..scriptnavn.."]```"}), { ['Content-Type'] = 'application/json' })
              end
      end
  end)

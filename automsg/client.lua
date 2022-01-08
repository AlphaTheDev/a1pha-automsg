local m = {}
m.delay = 10 -- Ændre her hvor tit beskerne skal komme ((minutter) default er 10 min.)

m.prefix = '^4[A1PHA SYSTEM BESKED] ' -- Skift dit prefix her
m.suffix = ''
m.messages = {
	'^0Velkommen til ^0A1pha^1Scripts ^0Nyd dit ophold',
    '^0Vores Discord er: ^1discord.gg/fJekXq5jUP',
    '^0Brug din ^1sunde fornuft ^0og Gutter Lav nu noget godt ^1Rp^0 :)',
    '^0Tryk ^1[M] ^0for at åbne mobil ^1[/Admin] ^0for admin menu.',
    '^0Ingen ^1PowerGaming^0, ^1RDM^0, ^1VDM ^0eller ^1MetaGaming ^0det vil der straffes ^1hårdt på.',
    '^0Her er vores github github.com/^1Alpha^0The^1Dev',
    '^0Husk lige at joine Discorden via ^1/Discord!'
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
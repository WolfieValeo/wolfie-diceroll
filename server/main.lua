local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end) -- Tested on my own framework, so you need to change to loading ESX.

QBCore.Commands.Add("roll", "Roll some dice :)", {{name="number", help="Number of dice"}, {name="sides", help="Number of sides of dice"}}, true, function(source, args) -- Own add command function to replace you to esx version
    local amount = tonumber(args[1])
    local sides = tonumber(args[2])
    if (sides > 0 and sides <= DiceRoll.maxsides) and (amount > 0 and amount <= DiceRoll.maxamount) then 
        local result = {}
        for i=1, amount do 
            table.insert(result, math.random(1, sides))
        end
        TriggerClientEvent("diceroll:client:roll", -1, source, DiceRoll.maxdistance, result, sides)
    else
        TriggerClientEvent('QBCore:Notify', source, "Too many sides or 0 (max: "..DiceRoll.maxsides..") of number of dice or 0 (max: "..DiceRoll.maxamount..")", "error") -- Here you have to put ff esx notification
    end
end)
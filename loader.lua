--[[
    
    gaysense.lua
    XJN2
    https://github.com/XJN2/LMAOBox-Luas
]]

local MenuLib = require("Menu")

assert(MenuLib.Version >= 1.35, "MenuLib version is too old, please update to 1.35 or newer! Current version: " .. MenuLib.Version)


local menu = MenuLib.Create("Base Lua Loader")

local function OnUnload()
    MenuLib.RemoveMenu(menu)
end

callbacks.Register("Unload", OnUnload)

menu:SetSize( 310, 100 )
menu.Style.Outline = true
menu.Style.TitleBg = { 105, 105, 105, 255 }
menu.Style.ItemHover = { 105, 105, 105, 255 }
local keytext = menu:AddComponent(MenuLib.Label("Enter your private key:"))
local keyinput = menu:AddComponent(MenuLib.Textbox("", key))

-- For now keys will be hardcoded into this file. I don't recommend using this method if you wanna build upon this loader.
local valid_key = {
    "asdf"
}

local function check_key()
    local key = keyinput:GetValue()
    for i, v in ipairs(valid_key) do
        if key == v then

            MenuLib.RemoveMenu(menu)

            menu = MenuLib.Create("Base Lua Loader")
            menu:SetSize( 310, 100 )
            menu.Style.Outline = true
            menu.Style.TitleBg = { 105, 105, 105, 255 }
            menu.Style.ItemHover = { 105, 105, 105, 255 }
            menu:AddComponent(MenuLib.Label("Key is valid! Select a file to load:"))
            local current_files = {
                "ex.lua",
                "ex2.lua",
                "ex3.lua",
                "ex4.lua",
                "ex5.lua",
                "ex6.lua"
            }
            local file_select = menu:AddComponent(MenuLib.Combo("Chose a file to load", current_files, ItemFlags.FullWidth))

            local function junkFunc()
                print("no lol")
            end

            local load_button2 = menu:AddComponent(MenuLib.Button("Load", junkFunc, ItemFlags.FullWidth))
        
        else

            MenuLib.RemoveMenu(menu)
            menu = MenuLib.Create("Error - Invalid Key.")
            menu:SetSize( 310, 100 )
            menu.Style.Outline = true
            menu.Style.TitleBg = { 105, 105, 105, 255 }
            menu.Style.ItemHover = { 105, 105, 105, 255 }
            menu:AddComponent(MenuLib.Label("Invalid key!"))
            menu:AddComponent(MenuLib.Label("If you think this is a mistake, you can:"))
            menu:AddComponent(MenuLib.Label("1. Contact me on [Platform] and I'll help you."))
            menu:AddComponent(MenuLib.Label("2. Reload the loader."))
        end
    end
end

local load_button = menu:AddComponent(MenuLib.Button("Load", check_key, ItemFlags.FullWidth))

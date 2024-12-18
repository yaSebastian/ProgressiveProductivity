local product_cache = require("utility.product_cache")
local gui_module = require("utility.gui_module")

-- When recipes could have changed or when we are initialized, create our local storage
script.on_configuration_changed(function(event)
    product_cache.setupStorage()
end)

script.on_init(function(event)
    product_cache.setupStorage()
end)

-- Events for toggling gui on and off
script.on_event("toggle_progressive_productivity_gui", function(event)
    local player = game.get_player(event.player_index)
    gui_module.toggleProgressiveProductivityUI(player, event.tick)
end)

script.on_event(defines.events.on_lua_shortcut, function(event)
    if event.prototype_name == "toggle_progressive_productivity_gui_shortcut" then
        local player = game.get_player(event.player_index)
        gui_module.toggleProgressiveProductivityUI(player, event.tick)
    end
end)

script.on_event(defines.events.on_gui_closed, function(event)
    if event.element and event.element.name == "progressive_productivty_list" then
        local player = game.get_player(event.player_index)
        gui_module.toggleProgressiveProductivityUI(player, event.tick)
    end
end)

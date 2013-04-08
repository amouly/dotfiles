-- {{{ Librerias.
require("awful")
require("awful.autofocus")
require("awful.rules")
require("beautiful")
require("naughty")
vicious = require("vicious")
-- }}}

-- {{{ AutoStart.
	awful.util.spawn("xrandr --output HDMI1 --mode 1920x1080 --pos 0x80 --rotate normal --output VGA1 --mode 1280x1024 --pos 1920x0 --rotate normal")
--}}}

-- {{{ Menajo de Errores.
	-- Check if awesome encountered an error during startup and fell back to
	-- another config (This code will only ever execute for the fallback config)
	if awesome.startup_errors then
		naughty.notify({ preset = naughty.config.presets.critical,
						 title = "Oops, there were errors during startup!",
						 text = awesome.startup_errors })
	end

	-- Handle runtime errors after startup
	do
		local in_error = false
		awesome.add_signal("debug::error", function (err)
			-- Make sure we don't go into an endless error loop
			if in_error then return end
			in_error = true

			naughty.notify({ preset = naughty.config.presets.critical,
							 title = "Oops, an error happened!",
							 text = err })
			in_error = false
		end)
	end
-- }}}

-- {{{ Theme.
	beautiful.init("/home/amouly/.config/awesome/themes/zenburn/theme3.lua")
-- }}}

-- {{{ Programas Importantes.
	terminal = "xterm"
-- }}}

-- {{{ Default modkey.
	modkey = "Mod4"
-- }}

-- {{{ Layouts
	layouts =
	{
		awful.layout.suit.floating,
		awful.layout.suit.tile,
		awful.layout.suit.tile.left,
		awful.layout.suit.tile.bottom,
		awful.layout.suit.tile.top,
		awful.layout.suit.fair,
		awful.layout.suit.fair.horizontal,
		awful.layout.suit.spiral,
		awful.layout.suit.spiral.dwindle,
		awful.layout.suit.max,
		awful.layout.suit.max.fullscreen,
		awful.layout.suit.magnifier
	}
-- }}}

 -- {{{ Tags -- 11 = fullscreen
	tags = {
		settings = {
			-- Monitor derecho = 1
			{ 	names  = { "EDITOR", 	"CHAT", 	"MUSIC", 	"TERMINAL", "FILES", 	"FTP", 		"TORRENT", 	  "EMULATOR",  "GIMP" },
				layout = { layouts[11], layouts[2], layouts[10], layouts[2], layouts[7], layouts[7], layouts[11], layouts[11], layouts[3] }
			},
			-- Monitor izquierdo = 2
			{	names  = { "WEB",  		"DEVELOP", 		"DESIGN", 	"VIDEO" },
				layout = { layouts[10], layouts[11], layouts[10], layouts[11] } 
			}
		}
	}
	 
	for s = 1, screen.count() do
		tags[s] = awful.tag(tags.settings[s].names, s, tags.settings[s].layout)
	end
 -- }}}

-- {{{ Menu
	awesomeMenu = {
		{ "Edit Config", "geany " .. awesome.conffile },
		{ "Restart", awesome.restart },
		{ "Quit", awesome.quit }
	}

	developMenu = {
		{ "Geany", "geany" },
		{ "Eclipse", "eclipse" }
	}

	mediaMenu = {
		{ "Music", "rhythmbox" }
	}

	designMenu = {
		{ "Gimp", "gimp" }
	}

	filesMenu = {
		{ "Nautilus", "nautilus" },
		{ "Filezilla", "filezilla" }
	}

	internetMenu = {
		{ "Web", "google-chrome" },
		{ "Torrent", "transmission-gtk" }
	}

	mainMenu = awful.menu({ items = {
		{ "Awesome", awesomeMenu, beautiful.awesome_icon },
		{ "Terminal", terminal },
		{ "Develop", developMenu },
		{ "Design", designMenu },
		{ "Internet", internetMenu },
		{ "Files", filesMenu },
		{ "Media", mediaMenu }
	}})

	mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon), menu = mainMenu })

-- }}}

-- {{{ Wibox Config

	-- {{{ Config GENERAL
	
	-- {{{ Widget = Separador
	separator = widget({ type = "imagebox" })
	separator.image = image(beautiful.widget_sep)

	separator2 = widget({ type = "textbox" })
	separator2.text = " - "
	
	separator3 = widget({ type = "imagebox" })
	separator3.image = image(beautiful.widget_sep3)
	-- }}}
	
	-- {{{ TagList - Acciones Monitor 1 / Monitor 2
	mytaglist = {}
	mytaglist.buttons = awful.util.table.join(
					-- Click Izquierdo - Selecciona tag
                    awful.button({ }, 1, awful.tag.viewonly),
                    -- Modkey+Clik Izq - Mueve ventana de tag
                    awful.button({ modkey }, 1, awful.client.movetotag)
                    )
	
    mytaglist[1] = awful.widget.taglist(1, awful.widget.taglist.label.all, mytaglist.buttons)
    mytaglist[2] = awful.widget.taglist(2, awful.widget.taglist.label.all, mytaglist.buttons)

    -- }}}
    
    -- }}}

	-- {{{ Barra Inferior / Superior - Monitor 1

	-- {{{ Widget = PowerPC
	powericon = widget({ type = "imagebox" })
	powericon.image = image(beautiful.widget_power)
	-- }}}

	-- {{{ Widget = Network usage
	dnicon = widget({ type = "imagebox" })
	upicon = widget({ type = "imagebox" })
	dnicon.image = image(beautiful.widget_net)
	upicon.image = image(beautiful.widget_netup)

	netwidget = widget({ type = "textbox" })

	vicious.register(netwidget, vicious.widgets.net, '<span color="'.. beautiful.fg_netdn_widget ..'">${p2p1 down_kb}</span> - <span color="'.. beautiful.fg_netup_widget ..'">${p2p1 up_kb}</span>', 3)
	-- }}}

	-- {{{ Widget = CPU usage and temperature
	cpuicon = widget({ type = "imagebox" })
	cpuicon.image = image(beautiful.widget_cpu)
	
	tempicon = widget({ type = "imagebox" })
	tempicon.image = image(beautiful.widget_temp)

	cpuwidget = widget({ type = "textbox" })
	tzswidget = widget({ type = "textbox" })

	vicious.register(cpuwidget, vicious.widgets.cpu, "$1%")
	vicious.register(tzswidget, vicious.widgets.thermal, "$1C", 9, "thermal_zone0")
	-- }}}

	-- {{{ WIDGET = Date and time
	timeicon = widget({ type = "imagebox" })
	timeicon.image = image(beautiful.widget_date)
	
	calicon = widget({ type = "imagebox" })
	calicon.image = image(beautiful.widget_cal)

	timewidget = widget({ type = "textbox" })
	vicious.register(timewidget, vicious.widgets.date, "%R", 61)
	
	datewidget = widget({ type = "textbox" })
	vicious.register(datewidget, vicious.widgets.date, "%d %b", 61)
	-- }}}

	-- {{{ WIDGET = Memory usage
	memicon = widget({ type = "imagebox" })
	memicon.image = image(beautiful.widget_mem)

	memwidget = widget({ type = "textbox" })

	vicious.register(memwidget, vicious.widgets.mem, "$1% - ($2MB/$3MB)", 13)
	-- }}}
	
	-- {{{ WIDGET = MediaPlayerDeamon
	musicicon = widget({ type = "imagebox" })
	musicicon.image = image(beautiful.widget_music)

	mpdwidget = widget({ type = "textbox" })
	vicious.register(mpdwidget, vicious.widgets.mpd,
				function (widget, args)
					if args["{state}"] == "Pause" then 
						return ' <span color="'.. beautiful.fg_netdn_widget ..'">Paused:</span> '..args["{Artist}"]..' - '.. args["{Title}"]..''
					elseif args["{state}"] == "Stop" then 
						return 'Stopped'
					else 
						return '<span color="'.. beautiful.fg_netup_widget ..'">Playing:</span> '..args["{Artist}"]..' - '.. args["{Title}"]..''
					end
				end, 10)
	-- }}}
	
	-- {{{ WIDGET = Systray
	mysystray = widget({ type = "systray" })
	-- }}}
	
	-- {{{ WidGet = MPD controls
	music_play = awful.widget.launcher({
		image = beautiful.widget_playm,
		command = "ncmpcpp toggle && echo -e 'vicious.force({ mpdwidget, })' | awesome-client"
	})

	music_pause = awful.widget.launcher({
		image = beautiful.widget_pausem,
		command = "ncmpcpp toggle && echo -e 'vicious.force({ mpdwidget, })' | awesome-client"
	})
	music_pause.visible = false

	music_stop = awful.widget.launcher({
		image = beautiful.widget_stopm,
		command = "ncmpcpp stop && echo -e 'vicious.force({ mpdwidget, })' | awesome-client"
	})

	music_prev = awful.widget.launcher({
		image = beautiful.widget_prevm,
		command = "ncmpcpp prev && echo -e 'vicious.force({ mpdwidget, })' | awesome-client"
	})

	music_next = awful.widget.launcher({
		image = beautiful.widget_nextm,
		command = "ncmpcpp next && echo -e 'vicious.force({ mpdwidget, })' | awesome-client"
	})
	-- }}}

	-- {{{ TaskList = Monitor 1
	mytasklist = {}
	mytasklist.buttons = awful.util.table.join(
						 -- Click izquierdo
						 awful.button({ }, 1, function ()
												  if instance then
													  instance:hide()
													  instance = nil
												  else
													  instance = awful.menu.clients({ width=350 })
												  end
											  end),
						 awful.button({ }, 4, function ()
												  awful.client.focus.byidx(1)
												  if client.focus then client.focus:raise() end
											  end),
						 awful.button({ }, 5, function ()
												  awful.client.focus.byidx(-1)
												  if client.focus then client.focus:raise() end
											  end))


	mytasklist = awful.widget.tasklist(function(c) return awful.widget.tasklist.label.currenttags(c, 1) end, mytasklist.buttons)
	-- }}}

	-- {{{ LayoutBox - Monitor 1
	mylayoutbox = {}

    mylayoutbox[1] = awful.widget.layoutbox(s)
    mylayoutbox[1]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- }}}
    
	-- {{{ StatusBar - Monitor 1 - Inferior
	barraInferior1 = awful.wibox({ position = "bottom", screen = "1", border_color = beautiful.border_focus, border_width = beautiful.border_width_mybar, height = 14 })
	
	barraInferior1.widgets =
	{
		layout = awful.widget.layout.horizontal.rightleft,
		separator3,
		timewidget, separator3, timeicon, separator3, separator, separator3,
		datewidget, separator3, calicon, separator3,  
		separator3, separator, separator3,
		tzswidget, tempicon, cpuwidget, separator3, cpuicon,
		separator3, separator, separator3,
		memwidget, separator3, memicon,
		separator, separator3, upicon, netwidget, dnicon,
		separator3, separator,
		{
			mylauncher,
			separator,
			mytasklist,
			layout = awful.widget.layout.horizontal.leftright,
		},
	}
	-- }}}

    -- {{{ StatusBar - Monitor 1 - Superior
    barraSuperior1 = awful.wibox({ position = "top", screen = 1, border_color = beautiful.border_focus, border_width = beautiful.border_width_topbar, height = 15 })

    barraSuperior1.widgets = {
        {
			layout = awful.widget.layout.horizontal.rightleft,
            mytaglist[1],
        },
        mylayoutbox[1],
        separator3, separator, separator3,
        mysystray,
        separator3, separator,
        layout = awful.widget.layout.horizontal.rightleft
    }
	-- }}}
	
	-- {{{ TaskList = Monitor 2
	taskList2 = {}
	taskList2.buttons = awful.util.table.join(
						 -- Click izquierdo
						 awful.button({ }, 1, function ()
												  if instance then
													  instance:hide()
													  instance = nil
												  else
													  instance = awful.menu.clients({ width=350 })
												  end
											  end),
						 awful.button({ }, 4, function ()
												  awful.client.focus.byidx(1)
												  if client.focus then client.focus:raise() end
											  end),
						 awful.button({ }, 5, function ()
												  awful.client.focus.byidx(-1)
												  if client.focus then client.focus:raise() end
											  end))


    taskList2 = awful.widget.tasklist(function(c) return awful.widget.tasklist.label.currenttags(c, 2) end, taskList2.buttons)
	-- }}}

    -- {{{ StatusBar - Monitor 2 - Superior
    barraSuperior2 = awful.wibox({ position = "top", screen = 2, border_color = beautiful.border_focus, border_width = beautiful.border_width_topbar, height = 15 })
    
    barraSuperior2.widgets =
    {
		{
			layout = awful.widget.layout.horizontal.rightleft,
			separator3,
			mpdwidget,
			separator3,
			musicicon,
			separator, separator3,
			music_play,
			music_pause,
			music_stop,
			music_next,
			music_prev,
			separator3, separator
		},
		layout = awful.widget.layout.horizontal.rightleft,
		mytaglist[2],
		taskList2
	}
	-- }}}
							
-- }}}						

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mainMenu:toggle() end)))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
        
    -- {{{ Teclas Menu
    awful.key({ modkey,           }, "w", function () mainMenu:show({keygrabber=true}) end),
	-- Abre/Cierra el menu.
    awful.key({ }, "XF86LaunchA", function () mainMenu:toggle() end),
    -- }}}

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

	--{{{ Teclas CLIENTE
	clientkeys = awful.util.table.join(
		awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
		-- Cierra el cliente en focus
		awful.key({ modkey,           }, "c",      function (c) c:kill()                         end),
		--
		awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
		awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
		awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
		awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
		awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
		awful.key({ modkey,           }, "n",
			function (c)
				-- The client currently has the input focus, so it cannot be
				-- minimized, since minimized clients can't have the focus.
				c.minimized = true
			end),
		awful.key({ modkey,           }, "m",
			function (c)
				c.maximized_horizontal = not c.maximized_horizontal
				c.maximized_vertical   = not c.maximized_vertical
			end)
	)
	--}}}

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Reglas de clientes.
	awful.rules.rules = {
		-- Regla para todos los clientes.
		{ rule = { }, properties = { border_width = beautiful.border_width, border_color = beautiful.border_normal, focus = true, keys = clientkeys, buttons = clientbuttons } },
		-- Mis reglas para clientes.
		-- Youtube
		{ rule = { instance = "exe" }, properties = { tag = tags[2][1], floating = true } },
		{ rule = { instance = "plugin-container" }, properties = { tag = tags[2][1], floating = true } },
		-- Fin youtube
		{ rule = { class = "Rhythmbox" }, properties = { tag = tags[1][3] } },
		{ rule = { class = "Google-chrome" }, properties = { tag = tags[2][1] } },
		{ rule = { instance = "crx_nckgahadagoaajjgafhacjanaoiihapd" }, properties = { tag = tags[1][2] } },
		{ rule = { class = "XTerm" }, properties = { tag = tags[1][4] } },
		{ rule = { class = "Nautilus" }, properties = { tag = tags[1][5] } },
		{ rule = { class = "Filezilla" }, properties = { tag = tags[1][6] } },
		{ rule = { class = "Transmission" }, properties = { tag = tags[1][7] } },
		{ rule = { class = "Eclipse" }, properties = { tag = tags[2][2] } },
		-- Gimp
		{ rule = { class = "Gimp" }, properties = { tag = tags[2][3] } },
		{ rule = { name = "Layers" }, properties = { tag = tags[1][9] } },
		{ rule = { name = "Toolbox" }, properties = { tag = tags[1][9] } },
		-- Fin Gimp
		{ rule = { class = "Geany" }, properties = { tag = tags[1][1] } },
		{ rule = { class = "Vlc" }, properties = { tag = tags[2][4] } },
		{ rule = { class = "ncmpcpp" }, properties = { tag = tags[1][3] } },
		{ rule = { class = "mc" }, properties = { tag = tags[1][5] } },
		{ rule = { name = "Chat" }, properties = { tag = tags[1][2] }, },
		{ rule = { class = "emulator64-arm" }, properties = { tag = tags[1][8] }, },
		{ rule = { name = "Android SDK Manager" }, properties = { tag = tags[1][8] }, }
	}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

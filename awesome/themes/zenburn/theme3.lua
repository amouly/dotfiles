-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

-- {{{ Main
theme = {}
theme.wallpaper_cmd = { "awsetbg /usr/share/awesome/themes/zenburn/zenburn-background.png" }
theme.confdir       = "/home/amouly/.config/awesome/themes/zenburn"
-- }}}

-- {{{ Styles
theme.font      = "Profont 8"


--- { Widgets
theme.widget_cpu    = theme.confdir .. "/icons/cpu.png"
theme.widget_temp    = theme.confdir .. "/icons/temp.png"
theme.widget_bat    = theme.confdir .. "/icons/bat.png"
theme.widget_mem    = theme.confdir .. "/icons/mem.png"
theme.widget_fs     = theme.confdir .. "/icons/disk.png"
theme.widget_net    = theme.confdir .. "/icons/down.png"
theme.widget_netup  = theme.confdir .. "/icons/up.png"
theme.widget_wifi   = theme.confdir .. "/icons/wifi.png"
theme.widget_mail   = theme.confdir .. "/icons/mail.png"
theme.widget_vol    = theme.confdir .. "/icons/vol.png"
theme.widget_power   = theme.confdir .. "/icons/power.png"
theme.widget_date   = theme.confdir .. "/icons/time.png"
theme.widget_cal   = theme.confdir .. "/icons/cal.png"
theme.widget_crypto = theme.confdir .. "/icons/crypto.png"
theme.widget_sep    = theme.confdir .. "/icons/separator2.png"
theme.widget_sep3    = theme.confdir .. "/icons/separator3.png"

theme.widget_music    = theme.confdir .. "/icons/music.png"
theme.widget_playm    = theme.confdir .. "/icons/play.png"
theme.widget_pausem    = theme.confdir .. "/icons/pause.png"
theme.widget_stopm    = theme.confdir .. "/icons/stop.png"
theme.widget_prevm    = theme.confdir .. "/icons/prev.png"
theme.widget_nextm    = theme.confdir .. "/icons/next.png"

theme.fg_netdn_widget = "#CC9393"
theme.fg_netup_widget = "#7F9F7F"

-- {{{ Colors
theme.fg_normal = "#FFFFFF"
theme.fg_focus  = "#F7F7F7"
theme.fg_urgent = "#DCDCCC"
theme.bg_normal = "#3B3737"
theme.bg_focus  = "#1E2320"
theme.bg_urgent = "#991818"
-- }}}

-- {{{ Borders
theme.border_width  = "0"
theme.border_normal = "#3B3737"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"

theme.border_width_topbar  = "1"
theme.border_width_mybar  = "1"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#3B3737"
theme.titlebar_bg_normal = "#3B3737"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
theme.taglist_bg_focus = "#33B5E5"
theme.taglist_fg_focus = "#ffffff"

theme.taglist_bg_urgent = "#991818"
theme.taglist_fg_urgent = "#FFFFFF"

theme.tasklist_bg_urgent = "#991818"
theme.tasklist_fg_urgent = "#FFFFFF"
-- }}}



-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width  = "120"
theme.menu_border_width  = "1"
theme.menu_border_color  = "#6F6F6F"

theme.menu_bg_focus = "#33B5E5"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "/usr/share/awesome/themes/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/zenburn/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.menu_submenu_icon      = "/usr/share/awesome/themes/default/submenu.png"
theme.tasklist_floating_icon = ""
-- }}}



-- {{{ Layout icons
theme.layout_tile       = theme.confdir .. "/icons/layouts/tile.png"
theme.layout_tileleft   = theme.confdir .. "/icons/layouts/tileleft.png"
theme.layout_tilebottom = theme.confdir .. "/icons/layouts/tilebottom.png"
theme.layout_tiletop    = theme.confdir .. "/icons/layouts/tiletop.png"
theme.layout_fairv      = theme.confdir .. "/icons/layouts/fairv.png"
theme.layout_fairh      = theme.confdir .. "/icons/layouts/fairh.png"
theme.layout_spiral     = theme.confdir .. "/icons/layouts/spiral.png"
theme.layout_dwindle    = theme.confdir .. "/icons/layouts/dwindle.png"
theme.layout_max        = theme.confdir .. "/icons/layouts/max.png"
theme.layout_fullscreen = theme.confdir .. "/icons/layouts/fullscreen.png"
theme.layout_magnifier  = theme.confdir .. "/icons/layouts/magnifier.png"
theme.layout_floating   = theme.confdir .. "/icons/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

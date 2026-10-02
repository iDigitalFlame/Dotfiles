-- ################################
-- ### iDigitalFlame  2016-2026 ###
-- #                              #
-- #            -/`               #
-- #            -yy-   :/`        #
-- #         ./-shho`:so`         #
-- #    .:- /syhhhh//hhs` `-`     #
-- #   :ys-:shhhhhhshhhh.:o- `    #
-- #   /yhsoshhhhhhhhhhhyho`:/.   #
-- #   `:yhyshhhhhhhhhhhhhh+hd:   #
-- #     :yssyhhhhhyhhhhhhhhdd:   #
-- #    .:.oyshhhyyyhhhhhhddd:    #
-- #    :o+hhhhhyssyhhdddmmd-     #
-- #     .+yhhhhyssshdmmddo.      #
-- #       `///yyysshd++`         #
-- #                              #
-- ########## SPACEPORT ###########
-- ## SwayImg Configuration
--
-- Copyright (C) 2016 - 2026 iDigitalFlame
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
--

swayimg.appid            = "swayimg"
swayimg.antialiasing     = true
swayimg.decoration       = true
swayimg.dnd_button       = "MouseRight"
swayimg.exif_orientation = true
swayimg.fullscreen       = false
swayimg.format_conf      = {
    raw  = {
        enable     = true,
        camera_wb  = true
    },
    ttf  = {
        text       = "The quick brown fox jumps over the lazy dog 0123456789",
        color      = 0xFFFFFFFF,
        enable     = true,
        background = 0x00000000
    },
    video = {
        rows       = 3,
        size       = 300,
        label      = 0x0AFFFFFF,
        enable     = true,
        columns    = 3,
        padding    = 5
    }
}
swayimg.mode             = "viewer"
swayimg.overlay          = false

swayimg.gallery.aspect           = "fill"
swayimg.gallery.border_color     = 0xA07D0BAB
swayimg.gallery.border_size      = 5
swayimg.gallery.cache            = 10
swayimg.gallery.embedded_thumb   = true
swayimg.gallery.hover            = true
swayimg.gallery.limit_cache      = 256
swayimg.gallery.mark_color       = 0x00000000
swayimg.gallery.padding_size     = 5
swayimg.gallery.pinch_factor     = 1.0
swayimg.gallery.preload          = true
swayimg.gallery.pstore           = false
swayimg.gallery.selected_color   = 0xA07D0BAB
swayimg.gallery.selected_scale   = 1.2
swayimg.gallery.text             = {
    topleft     = {"{name} ({sizehr})"},
    topright    = {"{list.index} / {list.total}"},
    bottomleft  = {},
    bottomright = {}
}
swayimg.gallery.thumb_size       = 200
swayimg.gallery.unselected_color = 0x00000000
swayimg.gallery.window_color     = 0x00000000


swayimg.imagelist.adjacent  = true
swayimg.imagelist.fsmon     = true
swayimg.imagelist.order     = "numeric"
swayimg.imagelist.recursive = false
swayimg.imagelist.reverse   = false

swayimg.text.background     = 0xAF0A000A
swayimg.text.color          = 0xFFFFFFFF
swayimg.text.font           = "SourceCodePro"
swayimg.text.padding        = 5
swayimg.text.shadow         = 0xFF000000
swayimg.text.size           = 16
swayimg.text.spacing        = 0
swayimg.text.status_timeout = 5
swayimg.text.timeout        = 15
swayimg.text.visible        = true

swayimg.slideshow.autocenter       = true
swayimg.slideshow.default_position = "center"
swayimg.slideshow.default_scale    = "optimal"
swayimg.slideshow.drag_button      = "MouseLeft"
swayimg.slideshow.history          = 0
swayimg.slideshow.loop             = false
swayimg.slideshow.pinch_factor     = 1.0
swayimg.slideshow.preload          = 0
swayimg.slideshow.mark_color       = 0x00000000
swayimg.slideshow.scale            = 1.0
swayimg.slideshow.text             = {
    topleft     = {"{name}"},
    topright    = {},
    bottomleft  = {},
    bottomright = {}
}
swayimg.slideshow.timeout          = 0

swayimg.slideshow.set_image_background(0x00000000)
swayimg.slideshow.set_image_chessboard(10, 0xAF333333, 0xA00A000A)
swayimg.slideshow.set_window_background(0x00000000)

swayimg.viewer.autocenter       = true
swayimg.viewer.default_position = "center"
swayimg.viewer.default_scale    = "optimal"
swayimg.viewer.drag_button      = "MouseLeft"
swayimg.viewer.history          = 0
swayimg.viewer.loop             = false
swayimg.viewer.mark_color       = 0x00000000
swayimg.viewer.preload          = 1
swayimg.viewer.pinch_factor     = 1.0
swayimg.viewer.scale            = 1.0
swayimg.viewer.text             = {
    topleft     = {
        "File: {name}",
        "File Size: {sizehr}",
        "Size: {frame.width}x{frame.height}",
        "Format: {format}",
        "EXIF Date: {meta.Exif.Photo.DateTimeOriginal}",
        "EXIF Camera: {meta.Exif.Image.Model}",
        "EXIF Location: {meta.Exif.GPSInfo}"
    },
    topright    = {
        "Image: {list.index} / {list.total}",
        "Scale: {scale}"
    },
    bottomleft  = {},
    bottomright = {}
}

swayimg.viewer.set_image_background(0x00000000)
swayimg.viewer.set_image_chessboard(10, 0xAF333333, 0xA00A000A)
swayimg.viewer.set_window_background(0x00000000)

-- Mask Keybinds
swayimg.gallery.on_key("A",      function() end)
swayimg.gallery.on_key("S",      function() end)
swayimg.gallery.on_key("Next",   function() end)
swayimg.gallery.on_key("Prior",  function() end)
swayimg.gallery.on_key("Delete", function() end)
swayimg.gallery.on_key("Insert", function() end)

swayimg.gallery.on_mouse("ScrollLeft",      function() end)
swayimg.gallery.on_mouse("ScrollRight",     function() end)
swayimg.gallery.on_mouse("Ctrl+ScrollUp",   function() end)
swayimg.gallery.on_mouse("Ctrl+ScrollDown", function() end)

swayimg.slideshow.on_key("Delete", function() end)

swayimg.viewer.on_key("A",           function() end)
swayimg.viewer.on_key("M",           function() end)
swayimg.viewer.on_key("S",           function() end)
swayimg.viewer.on_key("Next",        function() end)
swayimg.viewer.on_key("Prior",       function() end)
swayimg.viewer.on_key("Delete",      function() end)
swayimg.viewer.on_key("Insert",      function() end)
swayimg.viewer.on_key("Shift+M",     function() end)
swayimg.viewer.on_key("Backspace",   function() end)
swayimg.viewer.on_key("Shift+Next",  function() end)
swayimg.viewer.on_key("Shift+Prior", function() end)

swayimg.gallery.on_key("F",                function()
    swayimg.fullscreen = not swayimg.fullscreen
end)
swayimg.gallery.on_key("I",                function()
    swayimg.text.visible = not swayimg.text.visible
end)
swayimg.gallery.on_key("Q",                function()
    swayimg.exit()
end)
swayimg.gallery.on_key("R",                function()
    swayimg.gallery.thumb_size = 200;
end)
swayimg.gallery.on_key("T",                function()
    swayimg.text.visible = not swayimg.text.visible
end)
swayimg.gallery.on_key("Up",               function()
    swayimg.gallery.select("up")
end)
swayimg.gallery.on_key("End",              function()
    swayimg.gallery.select("last")
end)
swayimg.gallery.on_key("Down",             function()
    swayimg.gallery.select("down")
end)
swayimg.gallery.on_key("Home",             function()
    swayimg.gallery.select("first")
end)
swayimg.gallery.on_key("Left",             function()
    swayimg.gallery.select("left")
end)
swayimg.gallery.on_key("Plus",             function()
    swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 20;
end)
swayimg.gallery.on_key("Equal",            function()
    swayimg.gallery.thumb_size = swayimg.gallery.thumb_size + 20;
end)
swayimg.gallery.on_key("Minus",            function()
    local v = swayimg.gallery.thumb_size
    if v > 20 then
        swayimg.gallery.thumb_size = v - 20
    else
        swayimg.gallery.thumb_size = 0
    end
end)
swayimg.gallery.on_key("Right",            function()
    swayimg.gallery.select("right")
end)
swayimg.gallery.on_key("Escape",           function()
    swayimg.exit()
end)
swayimg.gallery.on_key("Return",           function()
    swayimg.mode = "viewer"
end)
swayimg.gallery.on_key("Ctrl+C",           function()
    local v = swayimg.gallery.get_image()
    if v then
        os.execute("/usr/bin/wl-copy --trim-newline '"..v.path.."'")
    end
end)
swayimg.gallery.on_key("Shift+C",          function()
    local v = swayimg.gallery.get_image()
    if v then
        os.execute("/usr/bin/swaymsg 'exec \"${HOME}/.local/bin/crop\" \""..v.path.."\"'")
    end
end)
swayimg.gallery.on_key("Ctrl+Left",        function()
    swayimg.gallery.select("left")
end)
swayimg.gallery.on_key("Ctrl+Right",       function()
    swayimg.gallery.select("right")
end)
swayimg.gallery.on_key("Shift+Left",       function()
    local v = swayimg.gallery.get_image()
    if v then
        os.execute("/usr/bin/magick mogrify -rotate -90 '"..v.path.."'")
        swayimg.gallery.reload()
    end
end)
swayimg.gallery.on_key("Shift+Right",      function()
    local v = swayimg.gallery.get_image()
    if v then
        os.execute("/usr/bin/magick mogrify -rotate 90 '"..v.path.."'")
        swayimg.gallery.reload()
    end
end)
swayimg.gallery.on_key("Shift+Delete",     function()
    local v = swayimg.gallery.get_image()
    if v then
        os.execute("/usr/bin/rm '"..v.path.."'")
        swayimg.text.set_status("File "..v.path.." removed")
    end
end)
swayimg.gallery.on_key("Shift+Underscore", function()
    local v = swayimg.gallery.thumb_size
    if v > 20 then
        swayimg.gallery.thumb_size = v - 20
    else
        swayimg.gallery.thumb_size = 0
    end
end)

swayimg.gallery.on_mouse("ScrollUp",   function()
    swayimg.gallery.select("right")
end)
swayimg.gallery.on_mouse("ScrollDown", function()
    swayimg.gallery.select("left")
end)

swayimg.viewer.on_key("[",                function()
    swayimg.viewer.rotate(270)
end)
swayimg.viewer.on_key("]",                function()
    swayimg.viewer.rotate(90)
end)
swayimg.viewer.on_key(">",                function()
    swayimg.viewer.flip_vertical()
end)
swayimg.viewer.on_key("<",                function()
    swayimg.viewer.flip_horizontal()
end)
swayimg.viewer.on_key("E",                function()
    swayimg.exif_orientation = true
    swayimg.viewer.reload()
end)
swayimg.viewer.on_key("F",                function()
    swayimg.fullscreen = not swayimg.fullscreen
end)
swayimg.viewer.on_key("I",                function()
    swayimg.text.visible = not swayimg.text.visible
end)
swayimg.viewer.on_key("Q",                function()
    swayimg.exit()
end)
swayimg.viewer.on_key("R",                function()
    swayimg.viewer.reset()
end)
swayimg.viewer.on_key("T",                function()
    swayimg.text.visible = not swayimg.text.visible
end)
swayimg.viewer.on_key("W",                function()
    swayimg.exif_orientation = false
    swayimg.viewer.reload()
end)
swayimg.viewer.on_key("Up",               function()
    swayimg.viewer.open("next")
end)
swayimg.viewer.on_key("Down",             function()
    swayimg.viewer.open("prev")
end)
swayimg.viewer.on_key("Left",             function()
    local v = swayimg.viewer.frame
    if v > 0 then
        swayimg.viewer.frame = v - 1
    end
end)
swayimg.viewer.on_key("Plus",             function()
    local v = swayimg.viewer.scale
    swayimg.viewer.set_abs_scale(v + v / 10);
end)
swayimg.viewer.on_key("Equal",            function()
    local v = swayimg.viewer.scale
    swayimg.viewer.set_abs_scale(v + v / 10);
end)
swayimg.viewer.on_key("Minus",            function()
    local v = swayimg.viewer.scale
    if v > 0 then
        swayimg.viewer.set_abs_scale(v - v / 10);
    end
end)
swayimg.viewer.on_key("Right",            function()
    swayimg.viewer.frame = swayimg.viewer.frame + 1
end)
swayimg.viewer.on_key("Escape",           function()
    swayimg.exit()
end)
swayimg.viewer.on_key("Return",           function()
    swayimg.mode = "gallery"
end)
swayimg.viewer.on_key("Ctrl+C",           function()
    local v = swayimg.viewer.get_image()
    if v then
        os.execute("/usr/bin/wl-copy --trim-newline '"..v.path.."'")
    end
end)
swayimg.viewer.on_key("Shift+C",          function()
    local v = swayimg.viewer.get_image()
    if v then
        os.execute("/usr/bin/swaymsg 'exec \"${HOME}/.local/bin/crop\" \""..v.path.."\"'")
    end
end)
swayimg.viewer.on_key("Ctrl+Left",        function()
    swayimg.viewer.open("next")
end)
swayimg.viewer.on_key("Ctrl+Right",       function()
    swayimg.viewer.open("prev")
end)
swayimg.viewer.on_key("Shift+Left",       function()
    local v = swayimg.viewer.get_image()
    if v then
        os.execute("/usr/bin/magick mogrify -rotate -90 '"..v.path.."'")
        swayimg.viewer.reload()
    end
end)
swayimg.viewer.on_key("BracketLeft",      function()
    swayimg.viewer.rotate(270)
end)
swayimg.viewer.on_key("Shift+Right",      function()
    local v = swayimg.viewer.get_image()
    if v then
        os.execute("/usr/bin/magick mogrify -rotate 90 '"..v.path.."'")
        swayimg.viewer.reload()
    end
end)
swayimg.viewer.on_key("BracketRight",     function()
    swayimg.viewer.rotate(90)
end)
swayimg.viewer.on_key("Shift+Delete",     function()
    local v = swayimg.viewer.get_image()
    if v then
        os.execute("/usr/bin/rm '"..v.path.."'")
        swayimg.text.status = "File "..v.path.." removed"
    end
end)
swayimg.viewer.on_key("Shift+Underscore", function()
    local v = swayimg.viewer.scale
    if v > 0 then
        swayimg.viewer.set_abs_scale(v - v / 10);
    end
end)

swayimg.viewer.on_mouse("ScrollUp",         function()
  local v = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(v.x, v.y - 10)
end)
swayimg.viewer.on_mouse("ScrollDown",       function()
  local v = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(v.x, v.y + 10)
end)
swayimg.viewer.on_mouse("ScrollLeft",       function()
  local v = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(v.x - 10, v.y)
end)
swayimg.viewer.on_mouse("ScrollRight",      function()
  local v = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(v.x + 10, v.y)
end)
swayimg.viewer.on_mouse("Ctrl+ScrollUp",    function()
  local v = swayimg.viewer.scale
  local i = swayimg.get_mouse_pos()
  swayimg.viewer.set_abs_scale(v + v / 10, i.x, i.y)
end)
swayimg.viewer.on_mouse("Shift+ScrollUp",   function()
    swayimg.viewer.open("prev")
end)
swayimg.viewer.on_mouse("Ctrl+ScrollDown",  function()
  local v = swayimg.viewer.scale
  local i = swayimg.get_mouse_pos()
  swayimg.viewer.set_abs_scale(v - v / 10, i.x, i.y)
end)
swayimg.viewer.on_mouse("Shift+ScrollDown", function()
    swayimg.viewer.open("next")
end)

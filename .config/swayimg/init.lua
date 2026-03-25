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

-- Mask these Keybinds
swayimg.gallery.on_key("S",        function() end)
swayimg.gallery.on_key("Ctrl+P",   function() end)
swayimg.gallery.on_key("Delete",   function() end)
swayimg.slideshow.on_key("Delete", function() end)
swayimg.viewer.on_key("A",         function() end)
swayimg.viewer.on_key("M",         function() end)
swayimg.viewer.on_key("S",         function() end)
swayimg.viewer.on_key("Delete",    function() end)

swayimg.gallery.on_key("F",                function()
    swayimg.toggle_fullscreen()
end)
swayimg.gallery.on_key("I",                function()
    swayimg.text.show()
end)
swayimg.gallery.on_key("Q",                function()
    swayimg.exit()
end)
swayimg.gallery.on_key("R",                function()
    swayimg.gallery.set_thumb_size(200);
end)
swayimg.gallery.on_key("Up",               function()
    swayimg.gallery.switch_image("up")
end)
swayimg.gallery.on_key("End",              function()
    swayimg.gallery.switch_image("last")
end)
swayimg.gallery.on_key("Down",             function()
    swayimg.gallery.switch_image("down")
end)
swayimg.gallery.on_key("Home",             function()
    swayimg.gallery.switch_image("first")
end)
swayimg.gallery.on_key("Left",             function()
    swayimg.gallery.switch_image("left")
end)
swayimg.gallery.on_key("Plus",             function()
    swayimg.gallery.set_thumb_size(swayimg.gallery.get_thumb_size() + 20);
end)
swayimg.gallery.on_key("Equal",            function()
    swayimg.gallery.set_thumb_size(swayimg.gallery.get_thumb_size() + 20);
end)
swayimg.gallery.on_key("Minus",            function()
    swayimg.gallery.set_thumb_size(swayimg.gallery.get_thumb_size() - 20);
end)
swayimg.gallery.on_key("Right",            function()
    swayimg.gallery.switch_image("right")
end)
swayimg.gallery.on_key("Escape",           function()
  swayimg.exit()
end)
swayimg.gallery.on_key("Return",           function()
    swayimg.set_mode("viewer")
end)
swayimg.gallery.on_key("Ctrl+C",           function()
    os.execute("/usr/bin/wl-copy --trim-newline '"..swayimg.gallery.get_image().path.."'")
end)
swayimg.gallery.on_key("Shift+C",          function()
    os.execute("/usr/bin/swaymsg 'exec \"${HOME}/.local/bin/crop\" \""..swayimg.gallery.get_image().path.."\"'")
end)
swayimg.gallery.on_key("Shift+Left",       function()
    os.execute("/usr/bin/magick mogrify -rotate -90 '"..swayimg.gallery.get_image().path.."'")
end)
swayimg.gallery.on_key("Shift+Right",      function()
    os.execute("/usr/bin/magick mogrify -rotate 90 '"..swayimg.gallery.get_image().path.."'")
end)
swayimg.gallery.on_key("Shift+Delete",     function()
    local v = swayimg.gallery.get_image().path
    os.execute("/usr/bin/rm '"..v.."'")
    swayimg.text.set_status("File "..v.." removed")
end)
swayimg.gallery.on_key("Shift+Underscore", function()
    swayimg.gallery.set_thumb_size(swayimg.gallery.get_thumb_size() - 20);
end)

swayimg.gallery.on_mouse("ScrollUp",   function()
    swayimg.gallery.switch_image("right")
end)
swayimg.gallery.on_mouse("ScrollDown", function()
    swayimg.gallery.switch_image("left")
end)

swayimg.viewer.on_key("F",                function()
    swayimg.toggle_fullscreen()
end)
swayimg.viewer.on_key("I",                function()
    swayimg.text.show()
end)
swayimg.viewer.on_key("Q",                function()
    swayimg.exit()
end)
swayimg.viewer.on_key("R",                function()
    swayimg.viewer.reset()
end)
swayimg.viewer.on_key("Left",             function()
    swayimg.viewer.prev_frame()
end)
swayimg.viewer.on_key("Plus",             function()
    local v = swayimg.viewer.get_scale()
    swayimg.viewer.set_abs_scale(v + v / 10);
end)
swayimg.viewer.on_key("Equal",            function()
    local v = swayimg.viewer.get_scale()
    swayimg.viewer.set_abs_scale(v + v / 10);
end)
swayimg.viewer.on_key("Minus",            function()
    local v = swayimg.viewer.get_scale()
    swayimg.viewer.set_abs_scale(v - v / 10);
end)
swayimg.viewer.on_key("Right",            function()
    swayimg.viewer.next_frame()
end)
swayimg.viewer.on_key("Escape",           function()
  swayimg.exit()
end)
swayimg.viewer.on_key("Return",           function()
    swayimg.set_mode("gallery")
end)
swayimg.viewer.on_key("Ctrl+C",           function()
    os.execute("/usr/bin/wl-copy --trim-newline '"..swayimg.viewer.get_image().path.."'")
end)
swayimg.viewer.on_key("Shift+C",          function()
    os.execute("/usr/bin/swaymsg 'exec \"${HOME}/.local/bin/crop\" \""..swayimg.viewer.get_image().path.."\"'")
end)
swayimg.viewer.on_key("Shift+Left",       function()
    os.execute("/usr/bin/magick mogrify -rotate -90 '"..swayimg.viewer.get_image().path.."'")
end)
swayimg.viewer.on_key("BracketLeft",      function()
    swayimg.viewer.rotate(270)
end)
swayimg.viewer.on_key("Shift+Right",      function()
    os.execute("/usr/bin/magick mogrify -rotate 90 '"..swayimg.viewer.get_image().path.."'")
end)
swayimg.viewer.on_key("BracketRight",     function()
    swayimg.viewer.rotate(90)
end)
swayimg.viewer.on_key("Shift+Delete",     function()
    local v = swayimg.viewer.get_image().path
    os.execute("/usr/bin/rm '"..v.."'")
    swayimg.text.set_status("File "..v.." removed")
end)
swayimg.viewer.on_key("Shift+Underscore", function()
    local v = swayimg.viewer.get_scale()
    swayimg.viewer.set_abs_scale(v - v / 10);
end)

swayimg.viewer.on_mouse("Shift+ScrollUp",   function()
  swayimg.viewer.switch_image("prev")
end)
swayimg.viewer.on_mouse("Shift+ScrollDown", function()
  swayimg.viewer.switch_image("next")
end)

swayimg.enable_antialiasing(true)
swayimg.enable_decoration(true)
-- swayimg.enable_exif_orientation(true)
swayimg.enable_overlay(true)
swayimg.set_dnd_button("MouseRight")
swayimg.set_mode("viewer")

swayimg.gallery.enable_preload(true)
swayimg.gallery.enable_pstore(false)
swayimg.gallery.limit_cache(256)
swayimg.gallery.set_aspect("fill")
swayimg.gallery.set_border_color(0xA07D0BAB)
swayimg.gallery.set_border_size(5)
swayimg.gallery.set_padding_size(5)
swayimg.gallery.set_selected_color(0xA07D0BAB)
swayimg.gallery.set_selected_scale(1.20)
swayimg.gallery.set_text("topleft", {"{name} ({sizehr})"})
swayimg.gallery.set_text("topright", {"{list.index} / {list.total}"})
swayimg.gallery.set_thumb_size(200)
swayimg.gallery.set_unselected_color(0x00000000)
swayimg.gallery.set_window_color(0x00000000)

swayimg.imagelist.enable_adjacent(true)
-- swayimg.imagelist.enable_fsmon(true)
swayimg.imagelist.enable_reverse(false)
swayimg.imagelist.enable_recursive(false)
swayimg.imagelist.set_order("numeric")

swayimg.text.set_background(0xAF0A000A)
swayimg.text.set_font("SourceCodePro")
swayimg.text.set_foreground(0xFFFFFFFF)
swayimg.text.set_padding(5)
swayimg.text.set_shadow(0xFF000000)
-- swayimg.text.set_spacing(1)
swayimg.text.set_size(16)
swayimg.text.set_status_timeout(5)
swayimg.text.set_timeout(15)

-- swayimg.slideshow.limit_history(0)
swayimg.slideshow.set_default_scale("fit")
swayimg.slideshow.set_text("topleft", {"{name}"})
swayimg.slideshow.set_timeout(0)
swayimg.slideshow.set_window_background(0x00000000)

swayimg.viewer.enable_centering(true)
swayimg.viewer.enable_loop(false)
-- swayimg.viewer.limit_history(0)
swayimg.viewer.limit_preload(1)
swayimg.viewer.set_default_position("center")
swayimg.viewer.set_default_scale("optimal")
swayimg.viewer.set_drag_button("MouseLeft")
swayimg.viewer.set_image_chessboard(10, 0xAF333333, 0xA00A000A)
swayimg.viewer.set_mark_color(0x00000000)
swayimg.viewer.set_text("bottomleft", {})
swayimg.viewer.set_text("topleft", {
  "File: {name}",
  "File Size: {sizehr}",
  "Size: {frame.width}x{frame.height}",
  "Format: {format}",
  "EXIF Date: {meta.Exif.Photo.DateTimeOriginal}",
  "EXIF Camera: {meta.Exif.Image.Model}",
  "EXIF Location: {meta.Exif.GPSInfo}"
})
swayimg.viewer.set_text("topright", {
  "Image: {list.index} / {list.total}",
  "Scale: {scale}"
})
swayimg.viewer.set_window_background(0x00000000)

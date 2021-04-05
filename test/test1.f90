program test1
use cairo
use cairo_enums
use iso_c_binding, only: c_ptr, c_int, c_null_char
implicit none
type(c_ptr) :: surface, c
integer(c_int) :: r

! Initialize
surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 200, 200)
c = cairo_create(surface)

! Set background colour
call cairo_set_source_rgb(c, 0.45098039d0, 0.30980392d0, 0.58823529d0)
call cairo_move_to(c, 0.d0, 0.d0)
call cairo_rectangle(c, 0.d0, 0.d0, 200.d0, 200.d0)
call cairo_fill(c)

! Draw 'F'
call cairo_set_source_rgb(c, 1.d0, 1.d0, 1.d0)
call cairo_select_font_face(c, "Clarendon BT Roman"//c_null_char, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
call cairo_set_font_size(c, 72.0d0)
call cairo_move_to(c, 40d0, 80d0)
call cairo_show_text(c, "F"//c_null_char)
call cairo_stroke(c)

! Write .png
r = cairo_surface_write_to_png(surface, "F.png"//c_null_char)

! Destroy
call cairo_destroy(c)
call cairo_surface_destroy(surface)

end program test1

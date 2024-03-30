! Last modification: vmagnin, 2024-03-30

! The Cairo types are added by hand:
module cairo_types
    use iso_c_binding, only: c_double
    implicit none

    type, bind(c) :: cairo_matrix_t
        real(c_double) :: xx
        real(c_double) :: yx
        real(c_double) :: xy
        real(c_double) :: yy
        real(c_double) :: x0
        real(c_double) :: y0
    end type

    ! https://www.cairographics.org/manual/cairo-cairo-scaled-font-t.html#cairo-text-extents-t
    type, bind(c) :: cairo_text_extents_t
        real(c_double) :: x_bearing;
        real(c_double) :: y_bearing;
        real(c_double) :: width;
        real(c_double) :: height;
        real(c_double) :: x_advance;
        real(c_double) :: y_advance;
    end type

end module

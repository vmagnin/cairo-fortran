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

end module

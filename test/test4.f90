! test4
!
! We'll see in this test code
! - Create a 480x480 image
! - Create an internal workspace 8x8
! - Draw board
! - Save image to disk in PDF

program test4
    use cairo
    use cairo_enums
    use cairo_types, only: cairo_matrix_t

    implicit none
    type(c_ptr)    :: surface, c
    integer(c_int) :: r
    real(c_double), parameter :: IMAGE_WIDTH = 480.0d0
    real(c_double), parameter :: IMAGE_HEIGHT = IMAGE_WIDTH
    real(c_double), parameter :: WORKSPACE_SIZE = 8.d0
    real(c_double), parameter :: WORKSPACE_FACTOR = IMAGE_WIDTH/WORKSPACE_SIZE
    type(cairo_matrix_t), target :: m
    integer :: i, j

    ! Rendering in a PDF file:
    surface = cairo_pdf_surface_create("chess.pdf"//c_null_char, &
                                     & IMAGE_WIDTH, IMAGE_HEIGHT)
    c = cairo_create(surface)

    ! Initialize
    call cairo_set_antialias(c, CAIRO_ANTIALIAS_BEST)

    ! Transform image coordinates (480x480) to my internal workspace (8x8)
    call cairo_matrix_init(c_loc(m), +WORKSPACE_FACTOR, 0.0d0, 0.0d0, &
                         & +WORKSPACE_FACTOR, 0.0d0, 0.0d0)
    call cairo_transform(c, c_loc(m))

    ! Draw board
    do i = 1, 8, 1
        do j = 1, 8, 1

            ! Which color?
            if (mod(i + j, 2) .eq. 0) then
                call cairo_set_source_rgb(c, 1.0d0, 0.8d0, 0.7d0)
            else
                call cairo_set_source_rgb(c, 0.1d0, 0.1d0, 0.1d0)
            end if

            ! Draw square
            call cairo_rectangle(c, real(j, kind=c_double) - 1.d0, &
                                  & real(i, kind=c_double) - 1.d0, 1.d0, 1.d0)
            call cairo_fill(c)

        end do
    end do

    ! Destroy
    call cairo_destroy(c)
    call cairo_surface_destroy(surface)

end program test4

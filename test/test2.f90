! test2
!
! We'll see in this test code
! - Create a 480x480 image
! - Set the background colour
! - Move the origin coordinates to the centre of image
! - Make the Y-axis increase from bottom to top
! - Create an internal workspace 100x100 x=(-50:50), y=(-50,50)
! - Draw axis and grid lines
! - Plot a function i(t) = I|\cos(\omega t + \phi)|
! - Draw a line
! - Save the image to disk

program test2
    use cairo
    use cairo_enums
    use cairo_types, only: cairo_matrix_t

    implicit none
    type(c_ptr)    :: surface, c
    integer(c_int) :: r
    real(c_double), parameter :: IMAGE_WIDTH = 480.0d0
    real(c_double), parameter :: IMAGE_HEIGHT = IMAGE_WIDTH
    real(c_double), parameter :: WORKSPACE_SIZE = 100.d0
    real(c_double), parameter :: WORKSPACE_FACTOR = IMAGE_WIDTH/WORKSPACE_SIZE
    real(c_double), parameter :: WORKSPACE_HALF = WORKSPACE_SIZE/2.0d0
    integer, parameter :: GRID_STEP = int(WORKSPACE_SIZE/10.0)
    integer, parameter :: NUM_POINTS = 500
    real :: t(NUM_POINTS)
    real :: y(NUM_POINTS)
    real, parameter :: PLOT_STEP = real(WORKSPACE_SIZE)/NUM_POINTS
    type(cairo_matrix_t), target :: m
    integer :: i

    ! Initialize
    surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, &
                                       & int(IMAGE_WIDTH), int(IMAGE_HEIGHT))
    c = cairo_create(surface)
    call cairo_set_antialias(c, CAIRO_ANTIALIAS_BEST)

    ! Set background colour
    call cairo_set_source_rgb(c, 0.05d0, 0.05d0, 0.05d0)
    call cairo_move_to(c, 0.d0, 0.d0)
    call cairo_rectangle(c, 0.d0, 0.d0, IMAGE_WIDTH, IMAGE_HEIGHT)
    call cairo_fill(c)

    ! Move origin, invert Y-axis
    call cairo_matrix_init(c_loc(m), +WORKSPACE_FACTOR, 0.0d0, 0.0d0, &
                     & -WORKSPACE_FACTOR, IMAGE_WIDTH/2.0d0, IMAGE_HEIGHT/2.0d0)
    call cairo_transform(c, c_loc(m))

    ! Draw grid
    do i = -int(WORKSPACE_HALF - GRID_STEP), int(WORKSPACE_HALF - GRID_STEP), GRID_STEP
        if (i .eq. 0) then
            call cairo_set_line_width(c, 0.25d0)
            call cairo_set_source_rgb(c, 1.0d0, 1.0d0, 1.0d0)
        else
            call cairo_set_line_width(c, 0.05d0)
            call cairo_set_source_rgb(c, 0.8d0, 0.8d0, 0.8d0)
        end if

        ! Vertical lines
        call cairo_move_to(c, real(i, kind=c_double), -WORKSPACE_HALF)
        call cairo_line_to(c, real(i, kind=c_double), +WORKSPACE_HALF)
        call cairo_stroke(c)

        ! Horizontal lines
        call cairo_move_to(c, -WORKSPACE_HALF, real(i, kind=c_double))
        call cairo_line_to(c, +WORKSPACE_HALF, real(i, kind=c_double))
        call cairo_stroke(c)
    end do

    ! Poor man linspace()
    do i = 1, size(t)
        t(i) = -real(WORKSPACE_HALF) + PLOT_STEP*real(i)
    end do

    y = current(I=20.0, omega=0.22, t=t, phi=0.0)

    ! Draw function points
    call cairo_set_line_width(c, 0.5d0)
    call cairo_set_source_rgb(c, 0.95d0, 0.0230d0, 0.95330d0)
    call cairo_move_to(c, real(t(1), kind=c_double), real(y(1), kind=c_double))
    do i = 2, size(t) - 1
        call cairo_line_to(c, real(t(i), kind=c_double), real(y(i), kind=c_double))
    end do
    call cairo_stroke(c)

    ! Draw Green Line
    call cairo_set_line_width(c, 1.0d0)
    call cairo_set_source_rgb(c, 0.05d0, 0.9230d0, 0.05330d0)
    call cairo_move_to(c, -40.d0, -40.d0)
    call cairo_line_to(c, 40.d0, -40.d0)
    call cairo_stroke(c)

    ! Write .png
    r = cairo_surface_write_to_png(surface, "axis.png"//c_null_char)

    ! Destroy
    call cairo_destroy(c)
    call cairo_surface_destroy(surface)

contains

    elemental pure function current(I, omega, t, phi) result(r)
        real, intent(in) :: I
        real, intent(in) :: omega
        real, intent(in) :: t
        real, intent(in) :: phi
        real :: r

        r = I*abs(cos(omega*t + phi))
    end function

end program test2

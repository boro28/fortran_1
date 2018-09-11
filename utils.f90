#ifndef DEF_KIND
#define DEF_KIND 8
#endif

module utils
    implicit none

    integer, parameter :: precision = DEF_KIND

contains

    subroutine print_diagonal(matrix, size)
        implicit none
        integer :: i
        integer, intent(in) :: size
        real(kind = precision), intent(inout), dimension(size,size) :: matrix
        do i = 1, size
            print *, matrix(i, i)
        end do
    end subroutine print_diagonal

    subroutine print_rows(matrix, size)
        implicit none
        integer :: j
        integer, intent(in) :: size
        real(kind = precision), intent(in), dimension(size,size) :: matrix
        do j = 1, size
            print *, j, ": ", matrix(:, j)
        end do
    end subroutine print_rows

end module utils
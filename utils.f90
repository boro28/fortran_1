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
        real(kind = precision), intent(inout) :: matrix(0:size, 0:size)
        do i = 0, size
            print *, matrix(i, i)
        end do
    end subroutine print_diagonal

    subroutine print_rows(matrix, size)
        implicit none
        integer :: i
        integer, intent(in) :: size
        real(kind = precision), intent(inout) :: matrix(0:size, 0:size)
        do i = 0, size
            print *, i, ": ", matrix(:, i)
        end do
    end subroutine print_rows




end module utils
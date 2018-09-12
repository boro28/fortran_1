module matrix_populate
    use utils
    implicit none
contains
    subroutine populate(matrix, vector, size)
        integer, intent(in) :: size
        real(kind = precision), intent(inout) :: matrix(0:size, 0:size)
        real(kind = precision), intent(inout) :: vector(0:size)
        real(kind = precision) :: p1, p2
        integer :: i

        p1 = size**2
        p2 = -2.0 * p1

        matrix(:,:) = 0.0

        do i = 1, size - 1
            matrix(i - 1, i) = p1
            matrix(i, i) = p2
            matrix(i + 1, i) = p1
        end do

        matrix(0, 0) = 1.0
        matrix(size, size) = 1.0

        vector = 0.0
        vector(size) = 1.0

    end subroutine populate
end module matrix_populate
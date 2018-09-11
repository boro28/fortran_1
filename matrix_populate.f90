module matrix_populate
    use utils
    implicit none

contains
    subroutine populate(matrix, vector, size)
        integer, intent(in) :: size
        real(kind = precision), intent(inout), dimension(size, size) :: matrix
        real(kind = precision), intent(inout), dimension(size) :: vector
        real(kind = precision) :: p1, p2
        integer :: i

        p1 = 1.0 / (size**2)
        p2 = -2 * p1

        matrix = 0
        matrix(1, 1) = p2
        matrix(1, 2) = p1

        do i = 2, size - 1
            matrix(i - 1, i) = p1
            matrix(i, i) = p2
            matrix(i + 1, i) = p1
        end do

        matrix(size - 1, size) = p1
        matrix(size, size) = p2

        vector = 0
        vector(size) = 1
    end subroutine populate
end module matrix_populate
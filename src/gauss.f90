module gauss
    use utils
    implicit none

contains
    subroutine eliminate(matrix, vector, size)
        integer, intent(in) :: size
        real (kind = precision) :: matrix(0:size, 0:size)
        real (kind = precision) :: vector(0:size)

        integer :: i, j
        real (kind = precision) :: multiplier
        do i = 0, size
            if(matrix(i, i) /= 0) then
                vector(i) = vector(i) / matrix(i, i)
                matrix(:, i) = matrix(:, i) / matrix(i, i)
                do j = 0, size
                    if(i /= j) then
                        multiplier = matrix(i, j) / matrix(i, i)
                        matrix(:, j) = matrix(:, j) - multiplier * matrix(:, i)
                        vector(j) = vector(j) - multiplier * vector(i)

                    end if
                end do
            end if
        end do
    end subroutine eliminate
end module gauss
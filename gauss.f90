module gauss
  use utils
  implicit none

  contains
  subroutine eliminate(matrix, vector, size)
        integer, intent(in) :: size
        real (kind = iPRECISION), dimension(size, size) :: matrix
        real (kind = iPRECISION), dimension(size) :: vector

        integer :: i, j
        real (kind = iPRECISION) :: multiplier
        do i = 1, size
            multiplier = matrix(i, j) / matrix(i, i)
            matrix(:, j) = matrix(:, j) - multiplier * matrix(:, i)
            vector(j) = vector(j) - multiplier * vector(i)
            vector(i) = vector(i) / matrix(i, i)
                matrix(:, i) = matrix(:, i) / matrix(i, i)
            end do
        end do
  end subroutine eliminate
end module gauss
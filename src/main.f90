program main
    use gauss
    use matrix_populate
    use utils
    implicit none

    integer (kind = 4) :: N
    real (kind = precision), allocatable :: matrix(:, :), vector(:)
    real(kind = 16), allocatable, dimension(:) :: expected, error
    integer :: i

    do N = 1, 1000

        allocate(matrix(0:N, 0:N))
        allocate(vector(0:N))
        allocate(expected(0:N))
        allocate(error(0:N))

        call populate(matrix, vector, N)
        call eliminate(matrix, vector, N)

        do i = 1, N - 1
            vector(i) = vector(i) / matrix(i, i)
        end do

        expected(0) = 0.0
        do i = 1, N - 1
            expected(i) = 1.0 / N * i
        end do
        expected(N) = 1.0

        error = vector - expected

        print '(i6,";",f15.7,"")', N, (SUM(ABS(error)) / size(error))

        deallocate(matrix)
        deallocate(vector)
        deallocate(expected)
        deallocate(error)

    end do

end program main
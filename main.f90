program main
    use gauss
    use matrix_populate
    use utils
    implicit none

    integer (kind = 4) :: N
    real (kind = precision), allocatable :: matrix(:, :), vector(:)
    real(kind = 16), allocatable, dimension(:) :: Ideal, Error
    integer :: i

    read(*, *) N

    allocate(matrix(0:N, 0:N))
    allocate(vector(0:N))
    allocate(Ideal(0:N))
    allocate(Error(0:N))

    call populate(matrix, vector, N)
    call eliminate(matrix, vector, N)

    do i = 1, N - 1
        vector(i) = vector(i) / matrix(i, i)
    end do

    do i = 0, N
        print *, i, vector(i)
    end do

    Ideal(0) = 0.0
    do i = 1, N - 1
        Ideal(i) = 1.0 / N * i
    end do
    Ideal(N) = 1.0

    do i = 0, N
        print *, i, Ideal(i)
    end do

    Error = vector - Ideal

    print *, (SUM(ABS(Error)) / size(Error))

    deallocate(matrix)
    deallocate(vector)

end program main
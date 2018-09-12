program main
    use gauss
    use matrix_populate
    use utils

    integer (kind = 4) :: N
    real (kind = precision), allocatable :: matrix(:, :), vector(:)
    real(kind = 16), allocatable, dimension(:) :: Ideal, Error
    integer :: i

    read(*, *) N

    allocate(matrix(1:N, 1:N))
    allocate(vector(1:N))
    allocate(Ideal(1:N))
    allocate(Error(1:N))

    call populate(matrix, vector, N)
    call eliminate(matrix, vector, N)

    do i = 1, n - 1
        vector(i) = vector(i) / matrix(i, i)
    end do

    do i = 1, n
        print *, i, vector(i)
    end do
    ! Calculate errors
    ! Sollution to this equation is function f(x) = x

    Ideal(1) = 0.0
    do i = 2, N - 1
        Ideal(i) = (1.0 / (N-1)) * (i-1)
    end do

    Ideal(N) = 1.0

    do i = 1, n
        print *, i, Ideal(i)
    end do

    Error = vector - Ideal

    print *, (SUM(ABS(Error)) / N)

    deallocate(matrix)
    deallocate(vector)

end program main
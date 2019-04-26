program main

    ! program is a set of testing functions

    implicit none

    real(kind=4),dimension(3,2) :: A
    real(kind=4),dimension(2,3) :: B
    real(kind=4),dimension(3,3) :: C

    integer :: i,j

    do i=1,3
        do j=1,2
            A(i,j)=i
            B(j,i)=j
        end do
    end do

    call measure_times_4(A,B)

    contains 

    subroutine measure_times_4(A,B)
        use naivemath
        use bettermath
        use dotmath
        implicit none
        real(kind=4), intent(in), dimension(:,:) :: A,B
        real(kind=4), dimension(:,:),allocatable :: C

        real :: start,finish

        call cpu_time(start)
        C=naivmull(A,B)
        call cpu_time(finish)
        if(allocated(C)) deallocate(C)


        write(*,*) finish-start


        call cpu_time(start)
        C=bettmull(A,B)
        call cpu_time(finish)
        if(allocated(C)) deallocate(C)


        write(*,*) finish-start


        call cpu_time(start)
        C=dotmull(A,B)
        call cpu_time(finish)
        if(allocated(C)) deallocate(C)


        write(*,*) finish-start



    end subroutine



end program main


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

    open (unit=10, file="./res/naiv_4.txt",action="write", form="formatted", status="replace", access="stream")
    open (unit=11, file="./res/bett_4.txt",action="write", form="formatted", status="replace", access="stream")
    open (unit=12, file="./res/dot_4.txt",action="write", form="formatted", status="replace", access="stream")
    call measure_times_4(A,B,10,11,12)
    call measure_times_4(A,B,10,11,12)
    close(10)
    close(11)
    close(12)

    contains 

    subroutine measure_times_4(A, B, fd1 , fd2, fd3)
        use naivemath
        use bettermath
        use dotmath
        implicit none
        real(kind=4), intent(in), dimension(:,:) :: A,B
        real(kind=4), dimension(:,:),allocatable :: C
        integer, intent(in) :: fd1,fd2,fd3
        logical :: exists

        real :: start,finish

        call cpu_time(start)
        C=naivmull(A,B)
        call cpu_time(finish)
        if(allocated(C)) deallocate(C)
        
        write(fd1,*) size(C,dim=1),finish-start


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


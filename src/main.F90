program main

    ! program is a set of testing functions

    implicit none

    real(kind=4), allocatable, dimension(:,:) :: A
    real(kind=4), allocatable, dimension(:,:) :: B

    integer, dimension(8) :: sizes
    integer :: i,j,k

    sizes=(/10,20,40,80,160,320,640,1280/)


    call open_result_files()
    
    ! create matrices of different size and measure time for them
    do i=1, size(sizes)
        allocate(A(sizes(i),sizes(i)))
        allocate(B(sizes(i),sizes(i)))

        do j=1, sizes(i)
            do k=1, sizes(i)
                A(j,k)=1
                B(j,k)=1
            end do
        end do

        call measure_times_4(A,B,10,11,12) ! file descriptors for those results

        deallocate(A)
        deallocate(B)
    end do

    call close_result_files()



    contains 

    subroutine open_result_files()
        open (unit=10, file="./res/naiv_4.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=11, file="./res/bett_4.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=12, file="./res/dot_4.txt",action="write", form="formatted", status="replace", access="stream")
    end

    subroutine close_result_files()
        close(10)
        close(11)
        close(12)
    end    

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


        write(fd2,*) size(C,dim=1),finish-start


        call cpu_time(start)
        C=dotmull(A,B)
        call cpu_time(finish)
        if(allocated(C)) deallocate(C)


        write(fd3,*) size(C,dim=1),finish-start



    end subroutine



end program main


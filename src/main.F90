program main

    use dotmath
    ! program is a set of testing functions

    implicit none

    real(kind=4), allocatable, dimension(:,:) :: A
    real(kind=4), allocatable, dimension(:,:) :: B
    real(kind=8), allocatable, dimension(:,:) :: C
    real(kind=8), allocatable, dimension(:,:) :: D
    real(kind=16), allocatable, dimension(:,:) :: E
    real(kind=16), allocatable, dimension(:,:) :: F

    real(kind=8),dimension(3,2) :: G
    real(kind=8),dimension(2,3) :: H
    real(kind=8), allocatable,dimension(:,:) :: X

    integer, dimension(8) :: sizes
    integer :: i,j,k

    sizes=(/10,20,40,80,160,320,640,1280/)


    do i=1,3
        do j=1,2
            G(i,j)=i
            H(j,i)=j
        end do
    end do

    X=dotmull(G,H)
    write(*,*) X


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

        allocate(C(sizes(i),sizes(i)))
        allocate(D(sizes(i),sizes(i)))

        do j=1, sizes(i)
            do k=1, sizes(i)
                C(j,k)=1
                D(j,k)=1
            end do
        end do

        call measure_times_8(C,D,13,14,15) ! file descriptors for those results

        deallocate(C)
        deallocate(D)

        allocate(E(sizes(i),sizes(i)))
        allocate(F(sizes(i),sizes(i)))

        do j=1, sizes(i)
            do k=1, sizes(i)
                E(j,k)=1
                F(j,k)=1
            end do
        end do

        call measure_times_16(E,F,16,17,18) ! file descriptors for those results

        deallocate(E)
        deallocate(F)
    end do

    call close_result_files()



    contains 

    subroutine open_result_files()
        open (unit=10, file="./res/naiv_4.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=11, file="./res/bett_4.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=12, file="./res/dot_4.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=13, file="./res/naiv_8.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=14, file="./res/bett_8.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=15, file="./res/dot_8.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=16, file="./res/naiv_16.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=17, file="./res/bett_16.txt",action="write", form="formatted", status="replace", access="stream")
        open (unit=18, file="./res/dot_16.txt",action="write", form="formatted", status="replace", access="stream")
    end

    subroutine close_result_files()
        close(10)
        close(11)
        close(12)
        close(13)
        close(14)
        close(15)
        close(16)
        close(17)
        close(18)
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

        real(kind=4) :: start,finish

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


    subroutine measure_times_8(A, B, fd1 , fd2, fd3)
        use naivemath
        use bettermath
        use dotmath
        implicit none
        real(kind=8), intent(in), dimension(:,:) :: A,B
        real(kind=8), dimension(:,:),allocatable :: C
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


    subroutine measure_times_16(A, B, fd1 , fd2, fd3)
        use naivemath
        use bettermath
        use dotmath
        implicit none
        real(kind=16), intent(in), dimension(:,:) :: A,B
        real(kind=16), dimension(:,:),allocatable :: C
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


program main
    use dotmath
    implicit none



    real(kind=16),dimension(3,2) :: A
    real(kind=16),dimension(2,3) :: B
    real(kind=16),dimension(3,3) :: C

    integer :: i,j

    do i=1,3
        do j=1,2
            A(i,j)=i
            B(j,i)=j
        end do
    end do

    C=dotmull(A,B)  
    write(*,*) C
    write(*,*) size(C,dim=1)
    write(*,*) size(C,dim=2)


end program main


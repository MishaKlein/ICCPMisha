program Main

    use VQMC
    implicit none
    
  integer, parameter :: NUM_WALKERS=400 ! number of walkers
  integer, parameter :: MC=26000 ! number of MC steps 
  integer, parameter :: Itime=4000 ! Initialization steps 
  integer, parameter :: intbeta=4 ! number of different beta values 
  real(8), parameter :: s=0       ! Distance between nuclei
  
  real(8) :: E, E2, varE, mu(2),beta(intbeta) ,dr 
  integer :: k ,i 
  
  beta=[0.15, 0.175, 0.20, 0.25]
  

do k=1, size(beta)


    call init(NUM_WALKERS, s, beta(k))

    dr = 1
    do i = 1, Itime
        call random_walk(dr)
    end do

    do i = 1, MC
        call random_walk(dr)
        call energy(mu)
        E = E + mu(1)
        E2 = E2 + mu(2)
    end do
    E = E / MC
    E2 = E2 / MC
    varE = E2 - E**2
    print *, 'beta', beta(k), 'E' , E , 'VarE' , VarE
    
    !beta=beta+0.1
end do 

end program

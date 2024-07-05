% Derivation of Frequency Dependent Dielectric Permittivity 

%{
    Derivation is based on the experimental data of "Optical Constants of the Noble Metals" paper by 
    P. B. Johnson and R. W. Christy, 1963. 
    n(w) = n + ik, epsilon(w) = epsilon1 + i epsilon2
    
    epsilon1 = n^2-k^2
    epsilon2 = 2nk
    n^2 = epsilon1/2 + 1/2 *  sqrt(epsilon1^2 + epsilon2^2) 
    k = epsilon2/2n

    Here we will use n and k data to derive numerical values of frequency dependent dielectric permittivity of gold.
    Eventually, the resulting epsilon(w) will be used in MIM interface wave vector even mode dispersion relation
    calculations.  
%}

h = 6.626e-34;
c = 299792458;

E = h*c./wl1;

eps_real = n1.^2 - k.^2;
eps_imag = 2.*n1.*k;



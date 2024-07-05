clc
clear all
close all

c = 299792458;
lam = linspace(300e-9,2000e-9,1000); %wavelength
f = c./lam;
w = 2*pi*f;

eps_inf = 9.5; 
wp = 1.36e16;   
%gamma = 1.05e14;  
gamma = 1.05e12;
eps_au = eps_inf-wp^2./(w.^2+1i.*w.*gamma);

% figure 
% plot(lam*1e9,real(eps_au));  
% figure
% plot(lam*1e9,imag(eps_au));

% --- Step 2 ---

eps_d = 1; % we have interface with air
nsp = sqrt((eps_au*eps_d)./(eps_au+eps_d));
ksp = w/c .* nsp;

figure
plot(real(ksp)/wp,w/wp)
hold on
plot(imag(ksp)/wp,w/wp,'--')
xlabel('k_{sp}/\omega_{p}'); ylabel('\omega/\omega_{p}')
title('Lossy Single Layer Interface')


close all
clear all
clc

% --- Multilayer surface plasmone ---

% MIM -> eps1 = dielectric constant of insulation core
%        eps2 = dielectric constant of metallic sheet 

% angular frequency definition 
c = 299792458;
lam = linspace(400e-9,2000e-9,5000); 
% lam = linspace(200e-9,500e-9,2000); 

f = c./lam;
w = 2*pi*f;

% drude model definition and metalic characteristic
eps_inf = 9.5; % Silver -> 3.7, Au -> 9.5
wp = 1.36e16;   % silver -> 1.38*10e16, Au->1.36e16
gamma = 1.05e14;  % Silver -> 2.73*10e13, Au -> 1.05e14
% gamma = 1.05e12; % Au lossy
eps_au = eps_inf - wp^2./(w.^2+1i.*w.*gamma); % eps1
% eps_au = eps_inf - (wp^2./w);
% eps_au = 1 - ((wp^2./gamma^2)./(1+((w.^2)/gamma^2)));

% dielectric material 
eps_d = 1; % eps2  silica -> 2.13

% beta definition
nsp = sqrt((eps_au.*eps_d)./(eps_au+eps_d));
beta = (w/c) .* nsp;

figure
plot(real(beta),w)
xlabel('\beta'); ylabel('\omega');
title('\beta Definition')

% a = 25e-9; % distance btween layers 
a = [25e-9 50e-9 100e-9];
k1 = sqrt( beta.^2 - (w/c).^2*eps_d); % evanescent wave direction
k2 = sqrt( beta.^2 - (w/c).^2.*eps_au); % evanescent wave direction 

% dispersion_relation = tanh(k1.*a) + (k2.*eps_d)./(k1.*eps_au);  ,real(dispersion_relation_3),w
dispersion_relation_1 = tanh(k1.*a(1));  
dispersion_relation_2 = tanh(k1.*a(2));
dispersion_relation_3 = tanh(k1.*a(3));
% dispersion_relation_4 = -(k2.*eps_d)./(k1.*eps_au);

% figure 
% plot(dispersion_relation_1,w,dispersion_relation_2,w,dispersion_relation_3,w);
% legend('a=25nm','a=50nm','a=100nm')
% xlabel('Dispersion Relation');

main = wp./sqrt(1+eps_au);
squareRoot = sqrt(1+ (2.*eps_au.*exp(-2.*beta.*a(1)))./(1+eps_au) );
omega_plus_1 = main;

% omega_plus_1 = ( wp./sqrt(1+real(eps_au)) ).*sqrt( 1 + ( (2.*real(eps_au).*exp(-2.*beta*a(1)))./(1+real(eps_au)) ) ); 
% omega_plus_2 = ( wp./sqrt(1+real(eps_au)) ).*sqrt(1+(2.*real(eps_au).*exp(-2*beta*a(2)))./(1+real(eps_au))); 
% omega_plus_3 = ( wp./sqrt(1+real(eps_au)) ).*sqrt(1+(2.*real(eps_au).*exp(-2*beta*a(3)))./(1+real(eps_au))); 

figure 
plot(beta,omega_plus_1);
figure
plot(beta,squareRoot);
% hold on 
% plot(omega_plus_3);
% xlabel('beta'); ylabel('\omega^{+}');
% title('Even Mode (\omega^{+})')
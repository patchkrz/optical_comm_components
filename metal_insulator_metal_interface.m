close all
clear all
clc

% --- Multilayer surface plasmone ---

% MIM -> eps1 = dielectric constant of insulation core
%        eps2 = dielectric constant of metallic sheet 

% angular frequency definition 
c = 299792458;
lam = linspace(300e-9,2000e-9,1000); 
f = c./lam;
w = 2*pi*f;

% drude model definition and metalic characteristic
eps_inf = 9.5; % Silver -> 3.7, Au -> 9.5
wp = 1.36e16;   % silver -> 1.38*10e16, Au->1.36e16
gamma = 1.05e14;  % Silver -> 2.73*10e13, Au -> 1.05e14
% gamma = 1.05e12; % Au lossy
eps_au = eps_inf-wp^2./(w.^2+1i.*w.*gamma); % eps1

% dielectric material 
eps_d = 1; % eps2 

% beta definition
nsp = sqrt((real(eps_au).*eps_d)./(real(eps_au)+eps_d));
beta = w/c .* nsp;

figure
plot(real(beta),w)
xlabel('\beta');ylabel('\omega');
title('\beta Definition')

a = 25e-9; % distance btween layers
% a = [25e-9 50e-9 100e-9];

k1 = sqrt(beta.^2-(w/c).^2*eps_d);
k2 = sqrt(beta.^2-(w/c).^2.*eps_au);

dispersion_relation = tanh(real(k1)*a) + (k2.*eps_d)./(k1.*eps_au);

% dispersion_relation = -(k2.*eps_d)./(k1.*eps_au); 

figure 
plot(real(dispersion_relation),w);
xlabel('dispersion relation'); ylabel('\omega');
title('Dispersion Relation')

omega_plus = ( wp./(sqrt(1+eps_au)) ).*sqrt(1+(2.*eps_au.*exp(-2*beta*a))./(1+eps_au)); 

figure 
plot(real(omega_plus),w);
xlabel('\omega^{+}'); ylabel('\omega');
title('\omega^{+}')
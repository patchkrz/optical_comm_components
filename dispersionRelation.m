clc
clear all
close all

% Parameters
a = 1;          % Lattice constant
N = 1000;       % Number of points in the Brillouin zone
theta = linspace(0, pi, N); % Angle range in radians

% Material Parameters
epsilon1 = 4;   % Permittivity of insulator 1
epsilon2 = 1;   % Permittivity of metal
epsilon3 = 4;   % Permittivity of insulator 2

% Define kx and ky
kx = linspace(-pi/a, pi/a, N);
ky = linspace(-pi/a, pi/a, N);

% Initialize dispersion relation array
omega = zeros(N, N);

% Loop over all kx and ky values
for i = 1:N
    for j = 1:N
        % Define the wavevector
        k = [kx(i), ky(j)];
        
        % Calculate transfer matrices
        T1 = calc_transfer_matrix(k, epsilon1);
        T2 = calc_transfer_matrix(k, epsilon2);
        T3 = calc_transfer_matrix(k, epsilon3);
        
        % Calculate overall transfer matrix
        T = T3 * T2 * T1;
        
        % Calculate eigenvalues of transfer matrix
        eigenvalues = eig(T);
        
        % Store the frequency (omega) values
        omega(i, j) = sqrt(eigenvalues(1)); % Considering the principal square root
    end
end

% Plot dispersion relation
figure;
mesh(real(kx), real(ky), real(omega));
xlabel('k_x');
ylabel('k_y');
zlabel('\omega');
title('Dispersion Relation at IMI Interface');
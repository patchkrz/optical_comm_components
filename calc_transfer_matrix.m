function T = calc_transfer_matrix(k, epsilon)
    % Calculate transfer matrix elements
    kx = k(1);
    ky = k(2);
    kz = sqrt(epsilon - kx^2 - ky^2); % Using dispersion relation for free space
    
    % Construct transfer matrix
    T = [exp(1i * kz) 0; 0 exp(-1i * kz)];
end
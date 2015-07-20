function [G Gmax Gmin] = rpattern(phi_range, D, f, n)
% Compute the radiation pattern (Annex 3 of ITU-R Appendix 8 pg 252)
%    - phi_range is the range of off-axis angles to be used for the Gain
%           calculation [deg]
%    - D is the diameter of the antenna [m]
%    - f is the operating frequency [MHz]
%    - n is the aperture efficieny (<1)
% The functions returns the G serie, the maximum and the minimum Gains.
c = 3e8;
lambda = c/f;
Gmax = 10*log10(n*(4*pi*(pi*(D/2)^2))/(lambda^2));
G1 = 2 + 15*log10(D/lambda);
phi_m = (20*lambda/D)*sqrt(Gmax-G1);
phi_r = 15.85*(D/lambda)^(-0.6);

if (D/lambda > 100.0)
    k = 1;
    for phi = phi_range,
        if (0 <= phi && phi < phi_m)
            G(k) = Gmax - (2.5e-3)*(D*phi/lambda)^2;
        elseif (phi_m <= phi < phi_r)
            G(k) = G1;
        elseif (phi_r <= phi && phi < 48.0)
            G(k) = 32 - 25*log10(phi);
        elseif (48.0 <= phi && phi <= 180.0)
            G(k) = -10;
        end
        k = k + 1;
    end
else
    k = 1;
    for phi = phi_range,
        if (0 <= phi && phi < phi_m)
            G(k) = Gmax - (2.5e-3)*(D*phi/lambda)^2;
        elseif (phi_m <= phi && phi < 100*lambda/D)
            G(k) = G1;
        elseif (100*lambda/D <= phi && phi < 48.0)
            G(k) = 52 - 10*log10(D/lambda) - 25*log10(phi);
        elseif (48.0 <= phi && phi <= 180.0)
            G(k) = -10 - 10*log10(D/lambda);
        end
        k = k + 1;
    end
end

Gmin = min(G);
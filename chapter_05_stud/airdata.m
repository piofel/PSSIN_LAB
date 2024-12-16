% wind_gusts: vector of gusts along body axes
% wind_steady: vector of steady wind along NED axes
function [Va, alpha, beta] = airdata(u,v,w,phi,theta,psi,wind_steady,wind_gusts)
    R = rotation_matrix(phi,theta,psi);  % NED to body

    % compute wind data in body frame
    Vw = wind_gusts + R*wind_steady;
    
    % compute air data
    Var = % TODO Sec. 2.3
    ur = Var(1);
    vr = Var(2);
    wr = Var(3);
    Va = % TODO Sec. 2.3
    alpha = % TODO Sec. 2.3
    beta = % TODO Sec. 2.3
end
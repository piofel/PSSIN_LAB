function R = rotation_matrix(phi,theta,psi)
    
    cphi = cos(phi);
    sphi = sin(phi);
    R_roll = [...
          1,    0,      0;...
          0,    cphi,   sphi;...
          0,    -sphi,  cphi];

    ctheta = cos(theta);
    stheta = sin(theta);
    R_pitch = % TODO

    cpsi = cos(psi);
    spsi = sin(psi);
    R_yaw = % TODO

    R = R_roll * R_pitch * R_yaw;

end
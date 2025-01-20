% forcesMoments.m
%   Computes the forces and moments acting on the airframe. 
%
%   Output is
%       Force   - forces
%       Torque  - moments
%       Va      - airspeed
%       alpha   - angle of attack
%       beta    - sideslip angle
%       w_ned   - wind vector in the inertial frame
%

function out = forces_moments(uu)
    % pn      = uu(1); % North position
    % pe      = uu(2); % East position
    % pd      = uu(3); % Down position (negative altitude)
    u       = uu(4); % velocity along body x-axis
    v       = uu(5); % velocity along body y-axis
    w       = uu(6); % velocity along body z-axis
    phi     = uu(7); % roll angle
    theta   = uu(8); % pitch angle
    psi     = uu(9); % yaw angle
    p       = uu(10); % body frame roll rate
    q       = uu(11); % body frame pitch rate
    r       = uu(12); % body frame yaw rate
    delta_e = uu(13); % elevator deflection
    delta_a = uu(14); % aileron deflection
    delta_r = uu(15); % rudder deflection
    delta_t = uu(16); % propeller thrust (pulse-width-modulation command)
    w_ns    = uu(17); % steady wind - North
    w_es    = uu(18); % steady wind - East
    w_ds    = uu(19); % steady wind - Down
    u_wg    = uu(20); % gust along body x-axis
    v_wg    = uu(21); % gust along body y-axis    
    w_wg    = uu(22); % gust along body z-axis
    mass = % TODO
    gravity = % TODO
    S_wing = uu(38);
    b = uu(39);
    c = uu(40);
    S_prop = uu(41);
    rho = uu(42);
    e = uu(43);
    AR = uu(44);
    C_L_0 = uu(45);
    C_m_0 = uu(47);
    C_L_alpha = uu(48);
    C_m_alpha = uu(50);
    C_L_q = uu(51);
    C_D_q = uu(52);
    C_m_q = uu(53);
    C_L_delta_e = % TODO
    C_D_delta_e = uu(55);
    C_m_delta_e = uu(56);
    M = uu(57);
    alpha0 = uu(58);
    C_D_p = uu(60);
    C_Y_0 = uu(61);
    C_ell_0 = uu(62);
    C_n_0 = uu(63);
    C_Y_beta = uu(64);
    C_ell_beta = uu(65);
    C_n_beta = uu(66);
    C_Y_p = uu(67);
    C_ell_p = uu(68);
    C_n_p = uu(69);
    C_Y_r = uu(70);
    C_ell_r = uu(71);
    C_n_r = uu(72);
    C_Y_delta_a = uu(73);
    C_ell_delta_a = uu(74);
    C_n_delta_a = uu(75);
    C_Y_delta_r = uu(76);
    C_ell_delta_r = uu(77);
    C_n_delta_r = uu(78);
    C_prop = uu(79);
    k_motor = % TODO
    k_Omega = uu(81);
    k_T_p = uu(82);

    wind_steady = [w_ns;w_es;w_ds];
    wind_gusts = [u_wg;v_wg;w_wg];
    
    % compute wind data in NED
    R_body_to_NED = rotation_matrix(phi,theta,psi)';
    w_ned = % TODO

    % compute air data
    [Va, alpha, beta] = airdata(u,v,w,phi,theta,psi,wind_steady,wind_gusts);
    
    % compute external forces and torques on aircraft
    sinalpha = sin(alpha);
    cosalpha = cos(alpha);
    aeroFactor = 0.5 * rho * Va^2 * S_wing;
    C_D = calc_C_D(C_L_0,C_L_alpha,C_D_p,e,AR,alpha);
    C_L = calc_C_L(C_L_0,C_L_alpha,M,alpha0,alpha);
    C_X = % TODO
    C_X_q = % TODO
    C_X_delta_e = % TODO
    C_Z = % TODO
    C_Z_q = % TODO
    C_Z_delta_e = % TODO
    mg = mass*gravity;
    dbVa = 2*Va;
    Force = NaN(3,1);
    Force(1) = % TODO
    Force(2) = % TODO
    Force(3) = % TODO
    Torque = NaN(3,1);
    Torque(1) = % TODO
    Torque(2) = % TODO   
    Torque(3) = % TODO
    out = [Force; Torque; Va; alpha; beta; w_ned];
end

function C_L = calc_C_L(C_L_0,C_L_alpha,M,alpha0,alpha)
    e1 = exp(-M*(alpha-alpha0));
    e2 = % TODO
    sigma = % TODO
    C_L = % TODO
end

function C_D = calc_C_D(C_L_0,C_L_alpha,C_D_p,e,AR,alpha)
    C_D = % TODO
end

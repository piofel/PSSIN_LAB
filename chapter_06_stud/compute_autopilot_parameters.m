Ts = 0.01;

%----------roll loop-------------
e_phi_max = 
zeta_phi = 
phi_max = 
delta_a_max = deg2rad(45);
wn_phi = 
roll_kp =
roll_kd = 
clearvars e_phi_max zeta_phi a_phi1 a_phi2

%----------course loop-------------
zeta_chi = 
W_chi = 
wn_chi = 
course_kp = 
course_ki = 
clearvars wn_phi zeta_chi W_chi wn_chi

%----------sideslip loop-------------
zeta_beta = 
e_beta_max = 
delta_r_max = deg2rad(45);
sideslip_kp = 
sideslip_ki = 
clearvars e_beta_max zeta_beta a_beta1 a_beta2

%----------yaw damper-------------
yaw_damper_kp = NaN;
yaw_damper_tau_r = NaN;

%----------pitch loop-------------
e_theta_max =
zeta_theta =
theta_max =
delta_e_max = deg2rad(45);
wn_theta = 
pitch_kp = 
pitch_kd = 
K_theta_DC =
clearvars e_theta_max zeta_theta a_theta1 a_theta2 a_theta3

%----------altitude loop-------------
W_h = 
zeta_h = 
altitude_zone = 
wn_h = 
altitude_kp = 
altitude_ki = 
clearvars W_h zeta_h wn_h

%---------airspeed hold using throttle---------------
wn_V = 
zeta_V = 
airspeed_throttle_kp =
airspeed_throttle_ki = 
clearvars wn_V zeta_V a_V2

%---------airspeed hold using pitch---------------
zeta_V2 = 
W_V2 = 
wn_V2 = 
airspeed_pitch_kp = 
airspeed_pitch_ki = 
clearvars wn_theta W_V2 zeta_V2 a_V1 wn_V2 gravity

%---------autopilot parameters vector---------------
autopilotParams = NaN(60,1);

% autopilotParams(1:30) - PID autpilot parameters
autopilotParams(1) = roll_kp;
autopilotParams(2) = roll_kd;
autopilotParams(3) = course_kp;
autopilotParams(4) = course_ki;
autopilotParams(5) = sideslip_kp;
autopilotParams(6) = sideslip_ki;
autopilotParams(7) = yaw_damper_kp;
autopilotParams(8) = yaw_damper_tau_r;
autopilotParams(9) = pitch_kp;
autopilotParams(10) = pitch_kd;
autopilotParams(11) = K_theta_DC;
autopilotParams(12) = altitude_kp;
autopilotParams(13) = altitude_ki;
autopilotParams(14) = altitude_zone;
autopilotParams(15) = airspeed_throttle_kp;
autopilotParams(16) = airspeed_throttle_ki;
autopilotParams(17) = airspeed_pitch_kp;
autopilotParams(18) = airspeed_pitch_ki;
autopilotParams(19) = u_trim(4);  % throttle trim value
autopilotParams(20) = Ts;
autopilotParams(21) = NaN;  % obsolete - formerly autopilotType
autopilotParams(22) = delta_e_max;
autopilotParams(23) = delta_a_max;
autopilotParams(24) = delta_r_max;
autopilotParams(25) = 1;  % delta_t_max
autopilotParams(26) = phi_max;
autopilotParams(27) = theta_max;
autopilotParams(28) = u_trim(1);  % elevator trim value
autopilotParams(29) = u_trim(2);  % aileron trim value
autopilotParams(30) = u_trim(3);  % rudder trim value

% autopilotParams(31:35) - altitude-control state machine
autopilotParams(31) = 10;  % h_take_off
autopilotParams(32) = theta_max;  % theta_take_off
autopilotParams(33) = 0;  % altitude state machine on/off (0/1)
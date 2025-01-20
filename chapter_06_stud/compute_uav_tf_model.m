% Global variables used:
% uavParams,
% x_trim is the trimmed state,
% u_trim is the trimmed input,
% y_trim is the trimmed output.

Gamma3 = uavParams(3);
Gamma4 = uavParams(4);
mass = uavParams(10);
Jy = uavParams(12);
gravity = uavParams(15);
S_wing = uavParams(16);
b = uavParams(17);
c = uavParams(18);
S_prop = uavParams(19);
rho = uavParams(20);
C_D_0 = TODO
C_D_alpha = uavParams(27);
C_m_alpha = uavParams(28);
C_m_q = uavParams(31);
C_D_delta_e = uavParams(33);
C_m_delta_e = uavParams(34);
C_Y_beta = uavParams(42);
C_ell_p = uavParams(46);
C_n_p = uavParams(47);
C_ell_delta_a = uavParams(52);
C_n_delta_a = TODO
C_Y_delta_r = uavParams(54);
C_prop = uavParams(57);
k_motor = uavParams(58);

theta_trim = x_trim(8);
psi_trim = TODO
Va_trim = y_trim(1);
alpha_trim = TODO
delta_e_trim = u_trim(1);
delta_t_trim = TODO

twice_Va = 2*Va_trim;
aero_factor = 0.5 * rho * Va_trim^2 * S_wing;
C_p_p = TODO
C_p_delta_a = TODO
a_phi1 = -aero_factor*b*C_p_p*b/twice_Va;
a_phi2 = TODO
a_theta_com = TODO
a_theta1 = TODO
a_theta2 = TODO
a_theta3 = TODO
a_V1 = TODO
a_V2 = TODO
a_V3 = TODO
a_beta_com = rho*Va_trim*S_wing/(2*mass);
a_beta1 = -a_beta_com*C_Y_beta;
a_beta2 = TODO

% define transfer functions
T_phi_delta_a   = tf(a_phi2,[1,a_phi1,0]);
T_chi_phi       = tf(gravity/Va_trim,[1,0]);
T_theta_delta_e = tf(a_theta3,[1,a_theta1,a_theta2]);
T_h_theta       = tf(Va_trim,[1,0]);
T_h_Va          = tf(theta_trim,[1,0]);
T_Va_delta_t    = tf(a_V2,[1,a_V1]);
T_Va_theta      = tf(-a_V3,[1,a_V1]);
T_beta_delta_r  = tf(a_beta2,[1,a_beta1]);

clearvars S_wing b rho aero_factor C_p_p C_ell_p C_n_p Gamma3 Gamma4 a_V3
clearvars C_p_delta_a C_ell_delta_a C_n_delta_a C_m_delta_e
clearvars a_theta_com C_m_q C_m_alpha theta_trim delta_e_trim k_motor Jy
clearvars mass C_D_0 C_D_delta_e S_prop Va_trim alpha_trim psi_trim C_prop
clearvars a_beta_com c C_D_alpha C_Y_delta_r delta_t_trim twice_Va C_Y_beta
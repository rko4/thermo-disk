clear all;
a = 401 / ( 3.45 * 10^6 ); % parameter, that characterize thermal conductivity
b = 2 * 20 / ( 3.45 * 10^2 ); % parameter, that characterize heat exchange to air

Dr = 0.001; % step between points
r_int = 0.03; % internal disc radius
r_ext = 0.06; % external disc radius
r_vals = r_int : Dr : r_ext; % vector with values of points

Dt = 0.001; % step between time moments
t_start = 0; % start time
t_final = 10; % finish time
t_vals = t_start : Dt : t_final; % vector with values of of time moments

int_temp = 400; % temperature across internal face
air_temp = 293; % air temperature 

init_dstrb = air_temp * ones ( 1 , length ( r_vals ) ); %initial temperature distribution
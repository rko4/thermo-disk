initParameters;

u_vals = heatDisk ( a, b, t_vals, r_vals, init_dstrb, int_temp, air_temp, 1);

showDistribution(u_vals , r_vals , t_vals , 1 , 1);

showDistribution(u_vals , r_vals , t_vals , 2.5 , 1);

showDistribution(u_vals , r_vals , t_vals , 5 , 1);

showDistribution(u_vals , r_vals , t_vals , 10 , 1);

animateCylindricDistribution( u_vals , r_vals , t_vals , [ int_temp , air_temp ] , 100 , 1);

animateDistribution( u_vals , r_vals , t_vals , 49 );

animateCylindricDistribution( u_vals , r_vals , t_vals, [ int_temp , air_temp ] , 100 , 0);
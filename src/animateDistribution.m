function frame = animateDistribution( u_vals , r_vals , t_vals , steps )
% This function returns contour 2D animation of temperature distribution
% u_vals - temperature distribution as a matrix
% t_vals - vector with values of time
% r_vals - vector with values of radius
% steps - amount of frames in animation;

t_length = length (t_vals);

r_length = length ( r_vals );

figure;
a = 2^( 1 / sqrt ( steps ) );
for i_step = 0 : steps;
    
    t_step = int16((a^i_step) / (a^steps)* ( t_length - 1 ) + 1);
    t_val_at_step = t_vals(t_step);
    showDistribution( u_vals , r_vals , t_vals , t_val_at_step , 0 );
    frame( i_step + 1) = getframe;
end
movieview(frame);
title('Temperature distribution in copper disk as a function of radius and time');
end
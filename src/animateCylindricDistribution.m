function frame = animateCylindricDistribution( u_vals , r_vals , t_vals , temp_limits, steps , contour )
% This function returns contour or 3D animation of temperature distribution
% u_vals - temperature distribution as a matrix
% t_vals - vector with values of time
% r_vals - vector with values of radius
% temp_limits - boundaries of temperature axis
% steps - amount of frames in animation
% contour - bool parameter, 1 for contour animation, 0 for 3D
t_length = length (t_vals);

r_int = r_vals(1);
r_length = length ( r_vals );
r_ext = r_vals ( r_length );
Dr = mean ( diff ( r_vals ) );

air_temp = temp_limits ( 2 );
int_temp = temp_limits ( 1 );

Dphi = 2 * Dr / (r_ext - r_int); % angle step
phi = (0 : Dphi : 2 ) * pi; % vector of values of polar angle phi to convert cylindric coordinates into cartesian

figure;
for i_step = 0 : steps;
    
    t_step =  int16(i_step / steps* ( t_length - 1 ) + 1);
    t_val_at_step = t_vals(t_step);
    u_vals_i = u_vals( t_step , 1 : (r_ext - r_int) / Dr + 1);
    
    for r_step = 1 : r_length
        for phi_step = 1 : length(phi)
            
            r_i = r_int + Dr * ( r_step - 1 );
            phi_j = pi * Dphi * ( phi_step - 1 );
            
            X ( r_step , phi_step ) = r_i * cos ( phi_j );
            Y ( r_step , phi_step ) = r_i * sin ( phi_j );
            Z ( r_step , phi_step ) = u_vals_i ( r_step );
            
            % this step is only for better coloring
            if ( r_step == r_length )  
                Z ( r_step , phi_step ) = air_temp;
            end
            
        end
    end
    
    %contour animation
    if (contour == 1)
        contourf(X,Y,Z, int16 ( ( int_temp - air_temp ) / 10 ) )
        axis ([-r_ext r_ext -r_ext r_ext]);
        xlabel 'x, m'; ylabel 'y, m';
    %3D animation
    elseif (contour == 0)
        surf(X,Y,Z)
        axis ([-r_ext r_ext -r_ext r_ext air_temp int_temp]);
        xlabel 'x, m'; ylabel 'y, m'; zlabel 'Temperature, K';
    end
    title ( strcat ( 'Temperature distribution in copper disk as a function of radius and time at t = ' , num2str(t_val_at_step) , ' sec' ) );
    frame( i_step + 1) = getframe;
end

movieview(frame);
title('Temperature distribution in copper disk as a function of radius and time');

end